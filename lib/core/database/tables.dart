import 'package:drift/drift.dart';

// Supplier-related tables
class Suppliers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get phone => text()();
  IntColumn get current_balance => integer().defaultConst(0); // Store as integer cents for precision
}

class PurchaseInvoices extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get supplier_id => integer()
      .references(Suppliers.id, onDelete: ConstrainedOperator.cascade);
  TextColumn get paper_invoice_number => text()();
  IntColumn get date => integer(); // epoch timestamp
  RealColumn get subtotal => real()();
  RealColumn get global_discount => real()();
  RealColumn get paid_amount => real()();
  TextColumn get status => text().withLength(max: 20); // 'unpaid', 'partially_paid', 'paid', 'cancelled'
}

class PurchaseItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get invoice_id => integer()
      .references(PurchaseInvoices.id, onDelete: ConstrainedOperator.cascade);
  IntColumn get product_id => integer(); // Reference to Products table
  RealColumn get cost_price => real()();
  IntColumn get quantity_purchased => integer()();
  IntColumn get bonus_quantity => integer().nullable()();
  IntColumn get expiry_date => integer().nullable(); // epoch
  RealColumn get actual_unit_cost => real()(); // After applying bonus spread
}

class SupplierPayments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get invoice_id => integer()
      .references(PurchaseInvoices.id, onDelete: ConstrainedOperator.setNull);
  RealColumn get amount => real()();
  IntColumn get date => integer(); // epoch
}

// For inventory tracking
class ProductUnits extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get unit_name => text()(); // e.g., 'box', 'vial'
  RealColumn get conversion_factor => real(); // 1 unit = X base units
}

class ProductBatches extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get product_id => integer().references(Products.id);
  TextColumn get batch_number => text();
  IntColumn get unit_id => integer().references(ProductUnits.id);
  IntColumn get units_in_batch => integer();
  IntColumn get expiry_date => integer().nullable(); // epoch
}