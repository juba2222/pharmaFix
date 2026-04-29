// =============================================================
// File: lib/features/customers/domain/entities/customer_entity.dart
// Purpose: Pure Domain entity for a pharmacy customer.
// Layer: Domain (Pure Dart — zero Flutter/Drift imports)
// =============================================================

import 'package:equatable/equatable.dart';

class CustomerEntity extends Equatable {
  final int id;
  final String name;
  final String? phone;
  final double totalDebt;

  const CustomerEntity({
    required this.id,
    required this.name,
    this.phone,
    this.totalDebt = 0.0,
  });

  CustomerEntity copyWith({
    int? id,
    String? name,
    String? phone,
    double? totalDebt,
  }) {
    return CustomerEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      totalDebt: totalDebt ?? this.totalDebt,
    );
  }

  @override
  List<Object?> get props => [id, name, phone, totalDebt];
}
