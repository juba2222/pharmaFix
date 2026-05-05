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
  final double currentBalance;
  final double creditLimit;

  const CustomerEntity({
    required this.id,
    required this.name,
    this.phone,
    this.currentBalance = 0.0,
    this.creditLimit = 0.0,
  });

  CustomerEntity copyWith({
    int? id,
    String? name,
    String? phone,
    double? currentBalance,
    double? creditLimit,
  }) {
    return CustomerEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      currentBalance: currentBalance ?? this.currentBalance,
      creditLimit: creditLimit ?? this.creditLimit,
    );
  }

  @override
  List<Object?> get props => [id, name, phone, currentBalance, creditLimit];
}
