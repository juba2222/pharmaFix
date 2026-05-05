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
  final double currentBalance;
  final double creditLimit;

  const CustomerModel({
    required this.id,
    required this.name,
    this.phone,
    this.currentBalance = 0.0,
    this.creditLimit = 0.0,
  });

  /// Maps from a Drift-generated CustomerDbModel row to this model.
  factory CustomerModel.fromDbModel(dynamic dbModel) {
    return CustomerModel(
      id: dbModel.id as int,
      name: dbModel.name as String,
      phone: dbModel.phone as String?,
      currentBalance: (dbModel.currentBalance as num?)?.toDouble() ?? 0.0,
      creditLimit: (dbModel.creditLimit as num?)?.toDouble() ?? 0.0,
    );
  }

  /// Converts this model to the Domain Entity.
  CustomerEntity toEntity() {
    return CustomerEntity(
      id: id,
      name: name,
      phone: phone,
      currentBalance: currentBalance,
      creditLimit: creditLimit,
    );
  }
}
