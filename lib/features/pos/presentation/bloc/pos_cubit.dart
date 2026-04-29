// =============================================================
// File: lib/features/pos/presentation/bloc/pos_cubit.dart
// Purpose: Manages POS cart, checkout, and customer selection state.
// Layer: Presentation (State Management)
// =============================================================

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/sale_item_entity.dart';
import '../../domain/repositories/i_pos_repository.dart';
import '../../../customers/domain/entities/customer_entity.dart';
import '../../../customers/domain/repositories/i_customer_repository.dart';
import '../../../../core/models/product.dart';
import 'pos_state.dart';

class PosCubit extends Cubit<PosState> {
  final IPosRepository _posRepository;
  final ICustomerRepository _customerRepository;

  PosCubit(this._posRepository, this._customerRepository)
      : super(const PosState());

  double _calculateTotal(List<SaleItemEntity> cart) =>
      cart.fold(0.0, (sum, item) => sum + item.subtotal);

  // ── Cart Operations ──────────────────────────────────────────

  void addToCart(Product product, dynamic selectedUnit, [List<dynamic>? allUnits]) {
    final cart = List<SaleItemEntity>.from(state.cartItems);
    
    // Check if the product is already in cart (any unit)
    final existingIdx = cart.indexWhere((i) => i.productId == product.id);

    final List<SaleUnitInfo> availableUnits = (allUnits ?? []).map((u) => SaleUnitInfo(
      id: u.id,
      name: u.unitName,
      conversionFactor: u.conversionFactor,
      sellingPrice: u.sellingPrice,
    )).toList();

    if (existingIdx >= 0) {
      final item = cart[existingIdx];
      // If adding same unit, just increment quantity
      if (item.unitId == selectedUnit.id) {
        cart[existingIdx] = item.copyWith(quantity: item.quantity + 1);
      } else {
        // If it's a different unit, we could either add a new line or switch.
        // Based on user request, it's better to allow switching, but here 
        // if they select a different unit from the search results, we add a new line.
        cart.add(_createSaleItem(product, selectedUnit, availableUnits));
      }
    } else {
      cart.add(_createSaleItem(product, selectedUnit, availableUnits));
    }

    final newTotal = _calculateTotal(cart);
    emit(state.copyWith(
      cartItems: cart,
      totalAmount: newTotal,
      paidAmount: newTotal,
      status: CheckoutStatus.initial,
    ));
  }

  SaleItemEntity _createSaleItem(Product product, dynamic unit, List<SaleUnitInfo> available) {
    return SaleItemEntity(
      productId: product.id,
      unitId: unit.id,
      productName: product.localName ?? product.id,
      unitName: unit.unitName,
      conversionFactor: unit.conversionFactor,
      quantity: 1.0,
      originalUnitPrice: unit.sellingPrice,
      appliedDiscount: 0.0,
      appliedPremium: 0.0,
      finalUnitPrice: unit.sellingPrice,
      availableUnits: available,
    );
  }

  void changeItemUnit(String productId, String newUnitId) {
    final cart = List<SaleItemEntity>.from(state.cartItems);
    final idx = cart.indexWhere((i) => i.productId == productId && i.unitId != newUnitId);
    
    if (idx >= 0) {
      final item = cart[idx];
      final newUnit = item.availableUnits.firstWhere((u) => u.id == newUnitId);
      
      cart[idx] = item.copyWith(
        unitId: newUnit.id,
        unitName: newUnit.name,
        conversionFactor: newUnit.conversionFactor,
        originalUnitPrice: newUnit.sellingPrice,
        finalUnitPrice: newUnit.sellingPrice, // Reset price/discount on unit change
        appliedDiscount: 0.0,
      );

      final newTotal = _calculateTotal(cart);
      emit(state.copyWith(
        cartItems: cart,
        totalAmount: newTotal,
        paidAmount: newTotal,
      ));
    }
  }

  void updateItemQuantity(String unitId, double newQuantity) {
    if (newQuantity <= 0) return removeFromCart(unitId);
    final cart = List<SaleItemEntity>.from(state.cartItems);
    final idx = cart.indexWhere((i) => i.unitId == unitId);
    if (idx < 0) return;
    final item = cart[idx];
    cart[idx] = item.copyWith(
      quantity: newQuantity,
    );
    emit(state.copyWith(
      cartItems: cart,
      totalAmount: _calculateTotal(cart),
      status: CheckoutStatus.initial,
    ));
  }

  void updateItemPrice(String unitId, double newPrice) {
    final cart = List<SaleItemEntity>.from(state.cartItems);
    final idx = cart.indexWhere((i) => i.unitId == unitId);
    if (idx < 0) return;

    final item = cart[idx];
    // Calculate discount: original - final
    final discount = item.originalUnitPrice - newPrice;

    cart[idx] = item.copyWith(
      finalUnitPrice: newPrice,
      appliedDiscount: discount,
    );

    emit(state.copyWith(
      cartItems: cart,
      totalAmount: _calculateTotal(cart),
      paidAmount: _calculateTotal(cart), // Update paid amount as well if it's supposed to auto-fill
      status: CheckoutStatus.initial,
    ));
  }

  void updateItemDiscount(String unitId, double discountPerUnit) {
    final cart = List<SaleItemEntity>.from(state.cartItems);
    final idx = cart.indexWhere((i) => i.unitId == unitId);
    if (idx < 0) return;

    final item = cart[idx];
    if (discountPerUnit < 0 || discountPerUnit > item.originalUnitPrice) return;

    final newFinalPrice = item.originalUnitPrice - discountPerUnit;

    cart[idx] = item.copyWith(
      finalUnitPrice: newFinalPrice,
      appliedDiscount: discountPerUnit,
    );

    final newTotal = _calculateTotal(cart);
    emit(state.copyWith(
      cartItems: cart,
      totalAmount: newTotal,
      paidAmount: newTotal,
      status: CheckoutStatus.initial,
    ));
  }

  void removeFromCart(String unitId) {
    final cart = List<SaleItemEntity>.from(state.cartItems)
      ..removeWhere((i) => i.unitId == unitId);
    emit(state.copyWith(
      cartItems: cart,
      totalAmount: _calculateTotal(cart),
      status: CheckoutStatus.initial,
    ));
  }

  void clearCart() => emit(const PosState());

  // ── Customer Operations ──────────────────────────────────────

  void selectCustomer(CustomerEntity customer) {
    emit(state.copyWith(selectedCustomer: customer));
  }

  void clearSelectedCustomer() {
    emit(state.copyWith(clearCustomer: true));
  }

  void clearCustomer() {
    emit(state.copyWith(clearCustomer: true, customerSearchResults: const []));
  }

  /// Search customers by name or phone fragment and update state.
  Future<void> searchCustomers(String query) async {
    if (query.trim().isEmpty) {
      emit(state.copyWith(customerSearchResults: const []));
      return;
    }
    final result = await _customerRepository.searchCustomers(query);
    result.fold(
      (_) => emit(state.copyWith(customerSearchResults: const [])),
      (customers) => emit(state.copyWith(customerSearchResults: customers)),
    );
  }

  /// Search products by name fragment or barcode and update state.
  Future<void> searchProducts(String query) async {
    if (query.trim().isEmpty) {
      emit(state.copyWith(productSearchResults: const []));
      return;
    }
    final result = await _posRepository.searchProducts(query);
    result.fold(
      (failure) {
        print('POS_DEBUG: Search Error: ${failure.message}');
        emit(state.copyWith(productSearchResults: const []));
      },
      (products) {
        print('POS_DEBUG: Found ${products.length} products for query: $query');
        emit(state.copyWith(productSearchResults: products));
      },
    );
  }

  /// Looks up a product by exact barcode via the repository. 
  /// Usually adds it to cart if found.
  Future<void> lookupProduct(String barcode) async {
    if (barcode.trim().isEmpty) return;
    
    final result = await _posRepository.lookupProduct(barcode);
    result.fold(
      (failure) {
        emit(state.copyWith(
          status: CheckoutStatus.failure,
          errorMessage: failure.message,
        ));
      },
      (product) async {
        // If found, auto-select and fetch units
        await selectProduct(product);
      },
    );
  }

  /// Fetches units for a product and adds the primary/first unit to cart.
  Future<void> selectProduct(Product product) async {
    // 1. FIFO Check: Get oldest batch for this product
    final oldestBatchResult = await _posRepository.getOldestBatch(product.id);
    oldestBatchResult.fold(
      (f) => null, // Ignore failures
      (oldestBatch) {
        if (oldestBatch != null) {
          // Logic: If there is an available batch with an expiry date
          // we should ideally warn the user. 
          // For simplicity in V1, we just log and can emit a side-effect if needed.
          print('FIFO_DEBUG: Oldest batch for ${product.localName} expires on ${oldestBatch.expiryDate}');
        }
      },
    );

    final result = await _posRepository.getProductUnits(product.id);
    result.fold(
      (failure) => emit(state.copyWith(
        status: CheckoutStatus.failure,
        errorMessage: failure.message,
      )),
      (units) {
        if (units.isNotEmpty) {
          // Add the first unit (usually base unit) by default
          addToCart(product, units.first, units);
          // Clear search results after selection
          emit(state.copyWith(productSearchResults: const []));
        }
      },
    );
  }

  /// Quick-add a new customer locally and auto-select them for this sale.
  Future<CustomerEntity?> quickAddCustomer(String name, String? phone) async {
    final result = await _customerRepository.addCustomer(
      name: name,
      phone: phone,
      pharmacyId: 0, // Default for now
    );
    
    return result.fold(
      (failure) {
        emit(state.copyWith(
          status: CheckoutStatus.failure,
          errorMessage: failure.message,
        ));
        return null;
      },
      (customer) {
        emit(state.copyWith(
          selectedCustomer: customer,
          status: CheckoutStatus.initial,
        ));
        return customer;
      },
    );
  }

  void updatePaidAmount(double amount) {
    emit(state.copyWith(paidAmount: amount));
  }

  void updatePaymentMethod(String method) {
    emit(state.copyWith(paymentMethod: method));
  }

  // ── Checkout ──────────────────────────────────────────────────

  Future<void> processCheckout({
    required String sessionId,
    required String userId,
  }) async {
    if (state.cartItems.isEmpty) return;
    if (!state.canConfirm) return; // Presentation logic enforced in Domain
    
    emit(state.copyWith(status: CheckoutStatus.loading));

    final result = await _posRepository.checkout(
      sessionId,
      userId,
      state.cartItems,
      state.paymentMethod,
      state.paidAmount,
      state.selectedCustomer?.id.toString(),
    );

    result.fold(
      (failure) => emit(state.copyWith(
        status: CheckoutStatus.failure,
        errorMessage: failure.message,
      )),
      (_) => emit(const PosState(status: CheckoutStatus.success)),
    );
  }
}
