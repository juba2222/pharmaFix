// =============================================================
// File: lib/core/database/table_constants.dart
// Purpose: Holds all string constants for table and column names.
//          STRICTLY FOLLOWS THE ERD MASTER SCHEMA V2.2.
// Layer: Core (Database)
// =============================================================

class TableConstants {
  // --- Shared Columns ---
  static const String colId = 'id';
  static const String colPharmacyId = 'pharmacy_id';
  static const String colCreatedAt = 'created_at';
  static const String colUpdatedAt = 'updated_at';
  static const String colIsSynced = 'is_synced';
  static const String colUnitId = 'unit_id';
  static const String colName = 'name';
  static const String colPhone = 'phone';
  static const String colEmail = 'email';
  static const String colStatus = 'status';
  static const String colUserId = 'user_id';
  static const String colAmount = 'amount';
  static const String colRemainingAmount = 'remaining_amount';
  static const String colCurrentBalance = 'current_balance';


  // --- Pharmacies ---
  static const String tableNamePharmacies = 'pharmacies';
  static const String colLicenseNumber = 'license_number';

  // --- Users ---
  static const String tableNameUsers = 'users';
  static const String colPhoneNumber = 'phone_number';
  static const String colPasswordHash = 'password_hash';
  static const String colRole = 'role';
  static const String colIsActive = 'is_active';

  // --- Customers ---
  static const String tableNameCustomers = 'customers';
  static const String colAddress = 'address';
  static const String colTotalDebt = 'total_debt';

  // --- Categories ---
  static const String tableNameCategories = 'categories';

  // --- Manufacturers ---
  static const String tableNameManufacturers = 'manufacturers';

  // --- Suppliers ---
  static const String tableNameSuppliers = 'suppliers';
  static const String colSupplierId = 'supplier_id';
  static const String colCompanyName = 'company_name';
  static const String colOpeningBalance = 'opening_balance';

  // --- Supplier Payments ---
  static const String tableNameSupplierPayments = 'supplier_payments';
  static const String colPaymentDate = 'payment_date';
  static const String colNotes = 'notes';

  // --- Purchase Invoices ---
  static const String tableNamePurchaseInvoices = 'purchase_invoices';
  static const String colInvoiceNumber = 'invoice_number';
  static const String colInvoiceDate = 'invoice_date';
  static const String colPaidOnInvoice = 'paid_on_invoice'; // Explicitly for purchase invoices

  // --- Purchase Invoice Items ---
  static const String tableNamePurchaseInvoiceItems = 'purchase_invoice_items';
  static const String colPurchaseInvoiceId = 'purchase_invoice_id';
  static const String colTotalLineAmount = 'total_line_amount';


  // --- Products ---
  static const String tableNameProducts = 'products';
  static const String colCategoryId = 'category_id';
  static const String colManufacturerId = 'manufacturer_id';
  static const String colProductName = 'product_name';
  static const String colScientificName = 'scientific_name';
  static const String colBarcode = 'barcode';
  static const String colBaseUnit = 'base_unit';
  static const String colUnitsPerBox = 'units_per_box';
  static const String colPiecesPerUnit = 'pieces_per_unit';
  static const String colUnitCostPrice = 'unit_cost_price';
  static const String colUnitSellingPrice = 'unit_selling_price';
  static const String colMinStockThreshold = 'min_stock_threshold';
  static const String colExpiryAlertDays = 'expiry_alert_days';

  // --- Product Units ---
  static const String tableNameProductUnits = 'product_units';
  static const String colUnitName = 'unit_name';
  static const String colConversionFactor = 'conversion_factor';
  static const String colCostPrice = 'cost_price';
  static const String colSellingPrice = 'selling_price';
  static const String colIsBaseUnit = 'is_base_unit';

  // --- Product Batches ---
  static const String tableNameProductBatches = 'product_batches';
  static const String colProductId = 'product_id';
  static const String colBatchNumber = 'batch_number';
  static const String colExpiryDate = 'expiry_date';
  static const String colQuantityInBaseUnit = 'quantity_in_base_unit';
  static const String colPurchasePrice = 'purchase_price';

  // --- Cash Sessions ---
  static const String tableNameCashSessions = 'cash_sessions';
  static const String colStartTime = 'start_time';
  static const String colEndTime = 'end_time';
  static const String colCashOpeningBalance = 'opening_balance'; // renamed to avoid duplicate
  static const String colTotalSales = 'total_sales';
  static const String colTotalReturns = 'total_returns';
  static const String colTotalExpenses = 'total_expenses';

  // --- Invoices ---
  static const String tableNameInvoices = 'invoices';
  static const String colSessionId = 'session_id';
  static const String colCustomerId = 'customer_id';
  static const String colSubtotalAmount = 'subtotal_amount';
  static const String colTaxAmount = 'tax_amount';
  static const String colDiscountAmount = 'discount_amount';
  static const String colTotalAmount = 'total_amount';
  static const String colPaidAmount = 'paid_amount';

  // --- Invoice Items ---
  static const String tableNameInvoiceItems = 'invoice_items';
  static const String colInvoiceId = 'invoice_id';
  static const String colBatchId = 'batch_id';
  static const String colQuantitySoldBaseUnit = 'quantity_sold_base_unit';
  static const String colUnitPriceAtSale = 'unit_price_at_sale';
  static const String colDiscountPercentage = 'discount_percentage';
  static const String colSubtotal = 'subtotal';

  // --- Returns ---
  static const String tableNameReturns = 'returns';
  static const String colTotalRefund = 'total_refund';
  static const String colTotalRefundAmount = 'total_refund_amount';
  static const String colReturnDate = 'return_date';

  // --- Return Items ---
  static const String tableNameReturnItems = 'return_items';
  static const String colReturnId = 'return_id';
  static const String colInvoiceItemId = 'invoice_item_id';
  static const String colQuantity = 'quantity';
  static const String colRefundAmount = 'refund_amount';

  // --- Audit Logs ---
  static const String tableNameAuditLogs = 'audit_logs';
  static const String colAction = 'action';
  static const String colTableName = 'table_name';
  static const String colOldValue = 'old_value';
  static const String colNewValue = 'new_value';

  // --- Payments ---
  static const String tableNamePayments = 'payments';
  static const String colMethod = 'method';

  // --- Invoice Items Pricing Extensions ---
  static const String colOriginalUnitPrice = 'original_unit_price';
  static const String colAppliedDiscount = 'applied_discount';
  static const String colAppliedPremium = 'applied_premium';
  static const String colFinalUnitPrice = 'final_unit_price';
  static const String colPriceModifiedBy = 'price_modified_by';
  
  // --- Purchase Returns Extensions ---
  static const String colTotalReturnValue = 'total_return_value';

  // --- Write Offs ---
  static const String tableNameWriteOffs = 'write_offs';
  static const String colReason = 'reason';
}
