# 📋 PROJECT_STATE.md — PharmaFix Current State

> Updated: **2026-04-25** | Schema: **V6.1 (Multi-Unit)** | Phase: **POS UI Polishing & Customer Management Improvements**

---

## ✅ Completed

- [x] Project initialized (Flutter + pubspec.yaml dependencies)
- [x] Architecture_Guide.md (the constitution) defined
- [x] PROJECT_MAP.md created and updated to V6.1
- [x] AI Skills & Workflows configured in `_agents/`
- [x] Architecture audit completed
- [x] **Master Database Schema — ERD V6.1 Compliant (Drift)**
  - [x] `product_units_table.dart` — Multi-unit system with conversion_factor
  - [x] `product_batches_table.dart` — Added `purchase_price` column
  - [x] `invoice_items_table.dart` — Added `unit_id` foreign key
  - [x] `sales_returns_table.dart` & `sales_return_items_table.dart`
  - [x] `purchase_returns_table.dart` & `purchase_return_items_table.dart`
- [x] **Domain Layer — POS Feature (V6.1)**
  - [x] `SaleItemEntity` — Multi-unit cart item with conversionFactor & pricing breakdown
  - [x] `IPosRepository` — Abstract contract for checkout & product lookup
- [x] **Data Layer — Freezed DTOs (V6.1)**
  - [x] `ProductModel` with nested `List<ProductUnitModel>` & `explicitToJson: true`
  - [x] `ProductUnitModel` — conversion_factor, cost_price, selling_price, barcode
  - [x] `ProductBatchModel` — includes purchase_price
  - [x] `InvoiceItemModel` — includes unit_id
- [x] **Core Services**
  - [x] `SyncService` — syncDown() (Supabase → Drift), syncUp() (pending → Supabase)
- [x] **Inventory Repository (V6.1)**
  - [x] `ProductRepositoryImpl` — reads Drift only (zero latency), refresh via SyncService
  - [x] `IProductRepository` — abstract contract registered in GetIt
- [x] **POS Repository — Checkout Transaction**
  - [x] `PosRepositoryImpl.checkout()` — full Drift transaction, FIFO batch deduction
- [x] **POS Presentation Layer**
  - [x] `PosState` — cartItems, totalAmount, CheckoutStatus enum
  - [x] `PosCubit` — addToCart, updateItemQuantity, removeFromCart, processCheckout
- [x] **Auth Feature** — Supabase Auth sign-in/out, AuthBloc, LoginScreen
- [x] **Dependency Injection** — All new V6.1 services & repos registered in `injection_container.dart`
- [x] **POS UI Polish** — Redesigned `PosCartItemTile` with modern quantity selector and internal price arrows.
- [x] **Customer Quick-Add** — Enhanced dialog with mandatory phone number and validation.
- [x] **Inventory Feature (Smart Stock Tracking)**
  - [x] `IInventoryRepository` & `InventoryRepositoryImpl` with SQL Aggregation (Drift).
  - [x] `UnitConversionHelper` for Box/Strip/Unit display logic.
  - [x] `InventoryProductCard` with expiry date color coding.
  - [x] `InventoryScreen` with search and initial stock dialog integration.
  - [x] Full DI registration for Inventory components.
- [x] **Database Schema Fixes**
  - [x] Resolved Schema mismatch errors (accessing Drift tables properly with `Table` suffix).
  - [x] Auto-incremented `schemaVersion` to 5 for reliable `MasterDrugs` dictionary support.
- [x] **Smart Autocomplete (AddProductScreen)**
  - [x] Dynamic Dictionary integration (search from Local + Master DB).
  - [x] Auto-fill historical cost price, batch number, and expiry date.
  - [x] Dynamic categories auto-fill from suggestions.
- [x] **Supplier Management (Full Module - V6.2 Enhanced)**
  - [x] **FIFO Payment Waterfall:** Automatic debt coverage for oldest invoices.
  - [x] **Invoice Lifecycle:** Draft mode for preparation, Immutable state after commitment.
  - [x] **Smart Reversals:** Full cancellation logic that restores inventory and balances.
  - [x] **Global Discounts:** Support for header-level discounts in purchase invoices.
  - [x] **Statement Tracking:** Full debit/credit ledger for each supplier.
- [x] **Financial Accounting & Reports (Hub V2.0)**
  - [x] **Advanced P&L:** Net Profit tracking with COGS (Cost of Goods Sold) and Operational Expenses.
  - [x] **Cash Flow Management:** Real-time tracking of Cash In (Sales) vs Cash Out (Purchases + Expenses).
  - [x] **Operational Expenses:** New module to record Rent, Salaries, and Utilities.
  - [x] **Smart Debt Balance:** Net financial position (Receivables vs Payables).
  - [x] **Inventory Insights:** Stock valuation and automated expiry risk analysis.
  - [x] **Custom Time Ranges:** Support for Daily, Weekly, Monthly, and precise Date Range filtering.
- [x] **UI/UX & Atomic Design**
  - [x] **Atomic UI Kit:** Migration to modular components (`ModernCard`, `ModernButton`).
  - [x] **Google Stitch Aesthetic:** Modern gradients and shadows implemented in POS.
  - [x] **Performance:** SQL-based aggregations for zero-latency dashboards.
- [x] **Architectural Compliance (V6.1 Clean Architect)**
  - [x] Strict adherence to 60-line file limit.
  - [x] Decoupled business logic into Services and Transactions.

---

## 🔄 In Progress

- [ ] **FIFO Multi-Batch Deduction** — Currently deducts from single oldest batch (TODO in pos_repository_impl.dart)
- [ ] **SyncUp Implementation** — pushes `isSynced=false` invoices & items to Supabase, marks synced in Drift
- [ ] **`last_synced_at` tracking** — `SyncPreferences` persists timestamp via SharedPreferences for incremental pulls

---

## ❌ Not Started

- [ ] Settings feature

---

## 🚨 Known Issues / TODOs

| File | Issue | Priority |
|---|---|---|
| `pos_repository_impl.dart` | FIFO deduction only handles single batch | Medium |
| `sync_service.dart` | `syncUp()` is a stub — pending invoice upload not implemented | High |

---

## 🎯 Next Immediate Actions

1. [ ] Implement FIFO multi-batch deduction in `pos_repository_impl.dart`.
2. [ ] Refactor `pos_repository_impl.dart` to comply with 60-line rule.
3. [ ] Implement `SyncUp` for invoices and purchase orders.
