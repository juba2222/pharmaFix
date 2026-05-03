// =============================================================
// File: lib/features/suppliers/presentation/cubit/purchase_invoice_cubit.dart
// Purpose: Manages state for the purchase invoice cart.
// Layer: Presentation (Cubit)
// =============================================================

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/i_supplier_repository.dart';
import '../../../inventory/domain/repositories/i_inventory_repository.dart';
import 'purchase_invoice_state.dart';

class PurchaseInvoiceCubit extends Cubit<PurchaseInvoiceState> {
  final ISupplierRepository supplierRepository;
  final IInventoryRepository inventoryRepository;
  final String pharmacyId;

  PurchaseInvoiceCubit({required this.supplierRepository, required this.inventoryRepository, required this.pharmacyId}) : super(PurchaseInvoiceState.initial());

  void addItem(Map<String, dynamic> item) {
    final newList = List<Map<String, dynamic>>.from(state.cartItems)..add(item);
    final total = newList.fold(0.0, (sum, i) => sum + (i['quantity'] * i['purchasePrice']));
    emit(state.copyWith(cartItems: newList, totalAmount: total, error: null));
  }

  void removeItem(int index) {
    final newList = List<Map<String, dynamic>>.from(state.cartItems)..removeAt(index);
    final total = newList.fold(0.0, (sum, i) => sum + (i['quantity'] * i['purchasePrice']));
    emit(state.copyWith(cartItems: newList, totalAmount: total, error: null));
  }

  void updatePaidAmount(double amount) => emit(state.copyWith(paidAmount: amount, error: null));

  Future<void> saveInvoice(String supplierId, String? invoiceNumber) async {
    if (state.cartItems.isEmpty) return emit(state.copyWith(error: 'السلة فارغة'));
    emit(state.copyWith(isSaving: true, error: null));
    final res = await supplierRepository.createPurchaseInvoice(supplierId: supplierId, pharmacyId: pharmacyId, invoiceNumber: invoiceNumber, totalAmount: state.totalAmount, paidAmount: state.paidAmount, items: state.cartItems);
    res.fold((f) => emit(state.copyWith(isSaving: false, error: f.message)), (r) => emit(state.copyWith(isSaving: false, success: true)));
  }
}
