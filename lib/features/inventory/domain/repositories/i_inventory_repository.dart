import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/inventory_item.dart';
import '../entities/write_off_entity.dart';
import '../models/drug_suggestion_model.dart';

abstract class IInventoryRepository {
  Stream<List<InventoryItem>> watchInventory({String? query, String? sortBy});

  Future<List<DrugSuggestionModel>> searchDrugSuggestions(String query);

  Future<Either<Failure, Unit>> addInitialStock({
    required String productId,
    required double quantity,
    required double costPrice,
    required DateTime expiryDate,
  });

  /// Adds a completely new product with its unit and initial batch
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
  });

  Future<void> writeOffStock(WriteOffEntity writeOff);

  Future<void> seedData();
}
