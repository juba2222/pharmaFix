// =============================================================
// File: lib/features/pos/presentation/bloc/pos_state.dart
// Purpose: Holds the state of the POS cart, checkout, and selected customer.
// Layer: Presentation (State Management)
// =============================================================

import 'package:equatable/equatable.dart';
import '../../domain/entities/sale_item_entity.dart';
import '../../../customers/domain/entities/customer_entity.dart';
import '../../../../core/models/product.dart';

enum CheckoutStatus { initial, loading, success, failure }

class PosState extends Equatable {
  final List<SaleItemEntity> cartItems;
  final double totalAmount;
  final CheckoutStatus status;
  final String? errorMessage;
  final CustomerEntity? selectedCustomer;
  final List<CustomerEntity> customerSearchResults;
  final List<Product> productSearchResults;
  final double paidAmount;
  final String paymentMethod;

  double get debt => totalAmount - paidAmount;
  bool get isDebt => debt > 0.01;
  bool get canConfirm => !isDebt || selectedCustomer != null;

  const PosState({
    this.cartItems = const [],
    this.totalAmount = 0.0,
    this.status = CheckoutStatus.initial,
    this.errorMessage,
    this.selectedCustomer,
    this.customerSearchResults = const [],
    this.productSearchResults = const [],
    this.paidAmount = 0.0,
    this.paymentMethod = 'Cash',
  });

  PosState copyWith({
    List<SaleItemEntity>? cartItems,
    double? totalAmount,
    CheckoutStatus? status,
    String? errorMessage,
    CustomerEntity? selectedCustomer,
    List<CustomerEntity>? customerSearchResults,
    List<Product>? productSearchResults,
    double? paidAmount,
    String? paymentMethod,
    bool clearCustomer = false,
  }) {
    return PosState(
      cartItems: cartItems ?? this.cartItems,
      totalAmount: totalAmount ?? this.totalAmount,
      status: status ?? this.status,
      errorMessage: errorMessage,
      selectedCustomer:
          clearCustomer ? null : (selectedCustomer ?? this.selectedCustomer),
      customerSearchResults:
          customerSearchResults ?? this.customerSearchResults,
      productSearchResults:
          productSearchResults ?? this.productSearchResults,
      paidAmount: paidAmount ?? this.paidAmount,
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }

  @override
  List<Object?> get props => [
        cartItems,
        totalAmount,
        status,
        errorMessage,
        selectedCustomer,
        customerSearchResults,
        productSearchResults,
        paidAmount,
        paymentMethod,
      ];
}
