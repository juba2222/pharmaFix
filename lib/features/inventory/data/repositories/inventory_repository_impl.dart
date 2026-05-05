import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/inventory_item.dart';
import '../../domain/entities/write_off_entity.dart';
import '../../domain/repositories/i_inventory_repository.dart';
import '../../domain/models/drug_suggestion_model.dart';

class InventoryRepositoryImpl implements IInventoryRepository {
  final AppDatabase _db;
  final _uuid = const Uuid();

  InventoryRepositoryImpl(this._db);

  @override
  Future<List<DrugSuggestionModel>> searchDrugSuggestions(String query) async {
    final suggestions = <DrugSuggestionModel>[];
    if (query.trim().isEmpty) return suggestions;

    // 1. Search Local Products
    final localQuery = _db.select(_db.productsTable).join([
      leftOuterJoin(
        _db.productUnitsTable,
        _db.productUnitsTable.productId.equalsExp(_db.productsTable.id),
      ),
    ]);
    
    localQuery.where(_db.productsTable.localName.contains(query) |
        _db.productsTable.barcode.contains(query));

    final localRows = await localQuery.get();
    
    final productMap = <String, DrugSuggestionModel>{};
    for (final row in localRows) {
      final p = row.readTable(_db.productsTable);
      final u = row.readTableOrNull(_db.productUnitsTable);
      
      if (!productMap.containsKey(p.id)) {
        productMap[p.id] = DrugSuggestionModel(
          id: p.id,
          name: p.localName,
          barcode: p.barcode,
          category: null, 
          source: DrugSource.local,
          units: [],
        );
      }
      
      if (u != null) {
        productMap[p.id]!.units!.add(SuggestionUnit(
          id: u.id,
          name: u.unitName,
          conversionFactor: u.conversionFactor,
          price: u.sellingPrice,
        ));
      }
    }
    
    // Auto-fill cost, batch, and expiry from the latest batch
    if (productMap.isNotEmpty) {
      final batchQuery = _db.select(_db.productBatchesTable)
        ..where((t) => t.productId.isIn(productMap.keys))
        ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)]);
      
      final batches = await batchQuery.get();
      final processedProducts = <String>{};
      for (final b in batches) {
        if (!processedProducts.contains(b.productId)) {
          final existing = productMap[b.productId]!;
          productMap[b.productId] = DrugSuggestionModel(
            id: existing.id,
            name: existing.name,
            barcode: existing.barcode,
            category: existing.category,
            source: existing.source,
            units: existing.units,
            costPrice: b.purchasePrice,
            batchNumber: b.batchNumber,
            expiryDate: b.expiryDate,
          );
          processedProducts.add(b.productId);
        }
      }
    }

    suggestions.addAll(productMap.values);

    // 2. Search Master Drugs
    final masterQuery = _db.select(_db.masterDrugsTable).join([
      leftOuterJoin(
        _db.masterUnitsTable,
        _db.masterUnitsTable.masterDrugId.equalsExp(_db.masterDrugsTable.id),
      ),
    ]);
    
    masterQuery.where(_db.masterDrugsTable.name.contains(query) |
        _db.masterDrugsTable.barcode.contains(query));

    final masterRows = await masterQuery.get();
    final masterMap = <String, DrugSuggestionModel>{};
    for (final row in masterRows) {
      final m = row.readTable(_db.masterDrugsTable);
      final mu = row.readTableOrNull(_db.masterUnitsTable);
      
      if (!masterMap.containsKey(m.id)) {
        masterMap[m.id] = DrugSuggestionModel(
          id: m.id,
          name: m.name,
          barcode: m.barcode,
          category: m.category,
          source: DrugSource.master,
          units: [],
        );
      }
      
      if (mu != null) {
        masterMap[m.id]!.units!.add(SuggestionUnit(
          name: mu.unitName,
          conversionFactor: mu.conversionFactor,
        ));
      }
    }
    
    final localBarcodes = suggestions.map((s) => s.barcode).toSet();
    for (final m in masterMap.values) {
      if (m.barcode == null || !localBarcodes.contains(m.barcode)) {
        suggestions.add(m);
      }
    }

    return suggestions;
  }

  @override
  Stream<List<InventoryItem>> watchInventory({String? query, String? sortBy}) {
    final qtySum = _db.productBatchesTable.quantityInBaseUnit.sum();
    final minExpiry = _db.productBatchesTable.expiryDate.min();
    final oldestBatchId = _db.productBatchesTable.id.min();

    final q = _db.select(_db.productsTable)
        .addColumns([qtySum, minExpiry, oldestBatchId])
        .join([
          leftOuterJoin(
            _db.productBatchesTable,
            _db.productBatchesTable.productId.equalsExp(_db.productsTable.id),
          ),
          leftOuterJoin(
            _db.productUnitsTable,
            _db.productUnitsTable.productId.equalsExp(_db.productsTable.id) &
                _db.productUnitsTable.isBaseUnit.equals(true),
          ),
        ]);

    if (query != null && query.isNotEmpty) {
      q.where(_db.productsTable.localName.contains(query) |
          _db.productsTable.barcode.contains(query));
    }

    q.groupBy([_db.productsTable.id]);

    final parts = (sortBy ?? 'name_asc').split('_');
    final field = parts.first;
    final isAsc = parts.last != 'desc';

    switch (field) {
      case 'closestExpiry':
        q.orderBy([isAsc ? OrderingTerm.asc(minExpiry) : OrderingTerm.desc(minExpiry)]);
        break;
      case 'lowStock':
        q.orderBy([isAsc ? OrderingTerm.asc(qtySum) : OrderingTerm.desc(qtySum)]);
        break;
      default:
        q.orderBy([isAsc ? OrderingTerm.asc(_db.productsTable.localName) : OrderingTerm.desc(_db.productsTable.localName)]);
    }

    return q.watch().map((rows) => rows.map((row) {
          final p = row.readTable(_db.productsTable);
          final u = row.readTableOrNull(_db.productUnitsTable);
          final total = row.read(qtySum) ?? 0.0;
          final expiry = row.read(minExpiry);
          return InventoryItem(
            productId: p.id,
            productName: p.localName,
            barcode: p.barcode,
            totalPills: total,
            closestExpiry: expiry,
            conversionFactor: u?.conversionFactor.toInt() ?? 1,
            sellingPrice: u?.sellingPrice ?? 0.0,
            batchId: row.read(oldestBatchId),
            unitId: u?.id,
            baseUnitName: u?.unitName ?? 'وحدة',
          );
        }).toList());
  }

  @override
  Future<Either<Failure, Unit>> addFullProduct({
    required String name,
    required String barcode,
    required String unitName,
    required double conversionFactor,
    required double sellingPrice,
    required double initialQty,
    required double costPrice,
    required DateTime expiryDate,
    double? stripConversionFactor,
    double? stripPrice,
    double? pillPrice,
  }) async {
    try {
      await _db.transaction(() async {
        final productId = _uuid.v4();
        
        await _db.into(_db.productsTable).insert(
              ProductsTableCompanion.insert(
                id: productId,
                localName: name,
                barcode: Value(barcode),
                pharmacyId: 'default',
                minStockThreshold: 5.0,
              ),
            );

        await _db.into(_db.productUnitsTable).insert(
              ProductUnitsTableCompanion.insert(
                id: Value(_uuid.v4()),
                productId: productId,
                unitName: unitName,
                conversionFactor: const Value(1.0),
                sellingPrice: sellingPrice,
                pharmacyId: 'default',
                isBaseUnit: const Value(true),
              ),
            );

        if (stripConversionFactor != null && stripConversionFactor > 1) {
           await _db.into(_db.productUnitsTable).insert(
              ProductUnitsTableCompanion.insert(
                id: Value(_uuid.v4()),
                productId: productId,
                unitName: 'شريط',
                conversionFactor: Value(stripConversionFactor),
                sellingPrice: stripPrice ?? (sellingPrice / stripConversionFactor),
                pharmacyId: 'default',
                isBaseUnit: const Value(false),
              ),
            );
        }

        final totalConversion = conversionFactor; 
        await _db.into(_db.productUnitsTable).insert(
              ProductUnitsTableCompanion.insert(
                id: Value(_uuid.v4()),
                productId: productId,
                unitName: 'حبة',
                conversionFactor: Value(totalConversion),
                sellingPrice: pillPrice ?? (sellingPrice / totalConversion),
                pharmacyId: 'default',
                isBaseUnit: const Value(false),
              ),
            );

        if (initialQty > 0) {
          await _db.into(_db.productBatchesTable).insert(
                ProductBatchesTableCompanion.insert(
                  id: _uuid.v4(),
                  productId: productId,
                  pharmacyId: 'default',
                  batchNumber: 'INITIAL-STOCK',
                  expiryDate: expiryDate,
                  quantityInBaseUnit: initialQty,
                  purchasePrice: Value(costPrice),
                ),
              );
        }
      });
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> addInitialStock({
    required String productId,
    required double quantity,
    required double costPrice,
    required DateTime expiryDate,
  }) async {
    try {
      await _db.into(_db.productBatchesTable).insert(ProductBatchesTableCompanion.insert(
        id: _uuid.v4(),
        productId: productId,
        pharmacyId: 'default',
        batchNumber: 'OPENING-${DateTime.now().millisecondsSinceEpoch}',
        expiryDate: expiryDate,
        quantityInBaseUnit: quantity,
        purchasePrice: Value(costPrice),
      ));
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<void> writeOffStock(WriteOffEntity writeOff) async {
    await _db.transaction(() async {
      // 1. Deduct from batch
      final batch = await (_db.select(_db.productBatchesTable)
            ..where((t) => t.id.equals(writeOff.batchId)))
          .getSingle();

      await (_db.update(_db.productBatchesTable)..where((t) => t.id.equals(batch.id))).write(
        ProductBatchesTableCompanion(
          quantityInBaseUnit: Value(batch.quantityInBaseUnit - writeOff.quantity),
          updatedAt: Value(DateTime.now()),
        ),
      );

      // 2. Record write-off
      await _db.into(_db.writeOffsTable).insert(
            WriteOffsTableCompanion.insert(
              id: writeOff.id,
              pharmacyId: writeOff.pharmacyId,
              productId: writeOff.productId,
              batchId: writeOff.batchId,
              unitId: writeOff.unitId,
              quantity: writeOff.quantity,
              reason: writeOff.reason,
              createdAt: Value(writeOff.createdAt),
            ),
          );
    });
  }

  @override
  Future<void> seedData() async {
    final count = await (_db.select(_db.masterDrugsTable)..limit(1)).get();
    if (count.isNotEmpty) return;

    await _db.batch((batch) {
      const panadolId = 'master-panadol-extra';
      batch.insert(_db.masterDrugsTable, MasterDrugsTableCompanion.insert(
        id: panadolId,
        name: 'Panadol Extra (بنادول اكسترا)',
        barcode: const Value('5000158102322'),
        category: const Value('الأدوية الصلبة (أشرطة/أقراص/كبسولات)'),
      ));

      batch.insertAll(_db.masterUnitsTable, [
        MasterUnitsTableCompanion.insert(
          id: 'mu-panadol-box',
          masterDrugId: panadolId,
          unitName: 'علبة',
          conversionFactor: 1.0,
        ),
        MasterUnitsTableCompanion.insert(
          id: 'mu-panadol-strip',
          masterDrugId: panadolId,
          unitName: 'شريط',
          conversionFactor: 2.0,
        ),
        MasterUnitsTableCompanion.insert(
          id: 'mu-panadol-pill',
          masterDrugId: panadolId,
          unitName: 'حبة',
          conversionFactor: 20.0,
        ),
      ]);

      const augmentinId = 'master-augmentin-1g';
      batch.insert(_db.masterDrugsTable, MasterDrugsTableCompanion.insert(
        id: augmentinId,
        name: 'Augmentin 1g (أوجمنتين 1 غرام)',
        barcode: const Value('6221007005123'),
        category: const Value('الأدوية الصلبة (أشرطة/أقراص/كبسولات)'),
      ));

      batch.insertAll(_db.masterUnitsTable, [
        MasterUnitsTableCompanion.insert(
          id: 'mu-aug-box',
          masterDrugId: augmentinId,
          unitName: 'علبة',
          conversionFactor: 1.0,
        ),
        MasterUnitsTableCompanion.insert(
          id: 'mu-aug-strip',
          masterDrugId: augmentinId,
          unitName: 'شريط',
          conversionFactor: 2.0,
        ),
        MasterUnitsTableCompanion.insert(
          id: 'mu-aug-pill',
          masterDrugId: augmentinId,
          unitName: 'حبة',
          conversionFactor: 14.0,
        ),
      ]);
    });
  }

}
