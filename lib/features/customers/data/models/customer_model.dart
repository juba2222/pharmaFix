// =============================================================
// File: lib/features/customers/data/models/customer_model.dart
// Purpose: Maps between Drift's CustomerDbModel and CustomerEntity.
// Layer: Data (Model / DTO)
// =============================================================

import '../../domain/entities/customer_entity.dart';

class CustomerModel {
  final int id;
  final String name;
  final String? phone;
  final double totalDebt;

  const CustomerModel({
    required this.id,
    required this.name,
    this.phone,
    this.totalDebt = 0.0,
  });

  /// Maps from a Drift-generated CustomerDbModel row to this model.
  factory CustomerModel.fromDbModel(dynamic dbModel) {
    return CustomerModel(
      id: dbModel.id as int,
      name: dbModel.name as String,
      phone: dbModel.phone as String?,
      totalDebt: (dbModel.totalDebt as num?)?.toDouble() ?? 0.0,
    );
  }

  /// Converts this model to the Domain Entity.
  CustomerEntity toEntity() {
    return CustomerEntity(
      id: id,
      name: name,
      phone: phone,
      totalDebt: totalDebt,
    );
  }
}
