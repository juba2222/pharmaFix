// =============================================================
// File: lib/features/inventory/presentation/bloc/inventory_state.dart
// Purpose: States for the Inventory feature.
// =============================================================

import 'package:equatable/equatable.dart';
import '../../domain/entities/inventory_item.dart';

abstract class InventoryState extends Equatable {
  const InventoryState();
  @override
  List<Object?> get props => [];
}

class InventoryInitial extends InventoryState {}

class InventoryLoading extends InventoryState {}

class InventoryLoaded extends InventoryState {
  final List<InventoryItem> items;
  final String searchQuery;
  final bool filterLowStock;

  const InventoryLoaded({
    required this.items,
    this.searchQuery = '',
    this.filterLowStock = false,
  });

  @override
  List<Object?> get props => [items, searchQuery, filterLowStock];
}

class InventoryError extends InventoryState {
  final String message;
  const InventoryError(this.message);
  @override
  List<Object?> get props => [message];
}
