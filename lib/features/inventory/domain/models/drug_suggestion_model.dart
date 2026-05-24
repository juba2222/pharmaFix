// =============================================================
// File: lib/features/inventory/domain/models/drug_suggestion_model.dart
// Purpose: Unified model for drug suggestions from local and master databases.
// =============================================================

import 'package:equatable/equatable.dart';

enum DrugSource { local, master, newDrug }

class DrugSuggestionModel extends Equatable {
  final String id;
  final String name;
  final String? barcode;
  final String? category;
  final DrugSource source;
  final List<SuggestionUnit>? units; // Predefined units if available
  final double? costPrice;
  final String? batchNumber;
  final DateTime? expiryDate;

  const DrugSuggestionModel({
    required this.id,
    required this.name,
    this.barcode,
    this.category,
    required this.source,
    this.units,
    this.costPrice,
    this.batchNumber,
    this.expiryDate,
  });

  @override
  List<Object?> get props => [id, name, barcode, category, source, units, costPrice, batchNumber, expiryDate];
}

class SuggestionUnit extends Equatable {
  final String? id;
  final String name;
  final double conversionFactor;
  final double? price;

  const SuggestionUnit({
    this.id,
    required this.name,
    required this.conversionFactor,
    this.price,
  });

  @override
  List<Object?> get props => [name, conversionFactor, price];
}
