import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/i_inventory_repository.dart';
import '../../domain/entities/inventory_item.dart';
import '../../domain/models/drug_suggestion_model.dart';
import 'inventory_state.dart';

enum InventorySort { name, lowStock, closestExpiry }

class InventoryCubit extends Cubit<InventoryState> {
  final IInventoryRepository _repository;
  StreamSubscription? _subscription;

  String _query = '';
  InventorySort _sort = InventorySort.name;
  bool _ascending = true;

  InventoryCubit(this._repository) : super(InventoryInitial());

  Future<void> loadInventory({String? query, InventorySort? sort, bool? ascending}) async {
    _query = query ?? _query;
    _sort = sort ?? _sort;
    _ascending = ascending ?? _ascending;

    emit(InventoryLoading());

    _subscription?.cancel();
    _subscription = _repository
        .watchInventory(query: _query, sortBy: '${_sort.name}_${_ascending ? 'asc' : 'desc'}')
        .listen(_onData, onError: _onError);
  }

  Future<void> createNewProduct({
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
    final result = await _repository.addFullProduct(
      name: name,
      barcode: barcode,
      unitName: unitName,
      conversionFactor: conversionFactor,
      sellingPrice: sellingPrice,
      initialQty: initialQty,
      costPrice: costPrice,
      expiryDate: expiryDate,
      stripConversionFactor: stripConversionFactor,
      stripPrice: stripPrice,
      pillPrice: pillPrice,
    );

    result.fold(
      (failure) => emit(InventoryError(failure.toString())),
      (_) => loadInventory(), // Refresh list after adding
    );
  }

  Future<void> addOpeningStock(String productId, double qty, double cost, DateTime expiry) async {
    final result = await _repository.addInitialStock(
      productId: productId,
      quantity: qty,
      costPrice: cost,
      expiryDate: expiry,
    );
    result.fold(
      (failure) => emit(InventoryError(failure.toString())),
      (_) => null,
    );
  }

  void search(String query) => loadInventory(query: query);

  void changeSort(InventorySort sort, {bool? ascending}) {
    loadInventory(sort: sort, ascending: ascending);
  }

  void _onData(List<InventoryItem> items) => emit(InventoryLoaded(items: items));
  void _onError(dynamic e) => emit(InventoryError(e.toString()));

  int getExpiredCount(List<InventoryItem> items) =>
      items.where((i) => i.status == InventoryStatus.expired).length;

  int getNearExpiryCount(List<InventoryItem> items) =>
      items.where((i) => i.status == InventoryStatus.nearExpiry).length;

  int getLowStockCount(List<InventoryItem> items) =>
      items.where((i) => i.status == InventoryStatus.lowStock).length;

  int getOutOfStockCount(List<InventoryItem> items) =>
      items.where((i) => i.status == InventoryStatus.outOfStock).length;

  Future<List<DrugSuggestionModel>> getDrugSuggestions(String query) async {
    return await _repository.searchDrugSuggestions(query);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
