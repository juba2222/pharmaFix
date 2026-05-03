import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/supplier_entity.dart';

part 'suppliers_state.freezed.dart';

@freezed
class SuppliersState with _$SuppliersState {
  const factory SuppliersState.initial() = _Initial;
  const factory SuppliersState.loading() = _Loading;
  const factory SuppliersState.loaded({
    required List<SupplierEntity> suppliers,
    required double totalDebt,
  }) = _Loaded;
  const factory SuppliersState.error(String message) = _Error;
}
