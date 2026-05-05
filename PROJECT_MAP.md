# 🗺️ PROJECT_MAP.md — PharmaFix Brain
> **Rule:** Every time a new file is added, update this map with a 1-line description of that file's responsibility.  
> This file is the **"Brain"** of our project context — it prevents amnesia as the project grows.

---

## 📦 Project Identity

| Field | Value |
|---|---|
| **App Name** | PharmaFix |
| **Type** | SaaS Pharmacy POS & Management System |
| **Platform** | Flutter (Web-first, expandable to Mobile) |
| **Direction** | RTL (Arabic) |
| **Primary Color** | `#01C653` (Green) |
| **State Management** | Flutter Bloc / Cubit |
| **Database** | Drift (SQLite) — SSOT for all UI reads |
| **Remote Backend** | Supabase (PostgreSQL) — V6.1 schema |
| **DI Container** | get_it |
| **Architecture** | Clean Architecture (Domain → Data → Presentation) |
| **Schema Version** | **V6.1** (Multi-Unit Inventory system) |

---

## 🗂️ Directory Tree & File Responsibilities

```
pharmaFix/
│
├── PROJECT_MAP.md                  ← YOU ARE HERE — living index of all files & their purpose
├── PROJECT_STATE.md                ← Current development status & next steps
├── Architecture_Guide.md           ← High-level architectural decisions and patterns
├── _planning/                      ← Technical specs and master ERD documentation
│   └── specs/                      ← Feature-specific specifications
├── pubspec.yaml                    ← Flutter dependencies (drift, bloc, get_it, dartz, equatable)
├── analysis_options.yaml           ← Dart linting rules
│
├── lib/
│   ├── main.dart                   ← App entry point; bootstraps MaterialApp, theme (Cairo font, green palette)
│   │
│   ├── core/                       ← Shared infrastructure used across all features
│   │   ├── base/
│   │   │   ├── base_entity.dart    ← Base class for Domain Entities (id, createdAt).
│   │   │   ├── base_model.dart     ← Base class for Data Models with copyWith.
│   │   │   └── base_state.dart     ← Standardized UI states (Loading, Success, Error).
│   │   ├── database/               ← Drift database setup (Strictly Follows ERD V6.1)
│   │   │   ├── table_constants.dart ← All table/column name string constants (zero raw strings in queries).
│   │   │   ├── app_database.dart   ← Relational DB connection, migrations, & table registration.
│   │   │   ├── daos/
│   │   │   │   └── sync_dao.dart              ← DAO for sync-specific batch operations.
│   │   │   └── tables/             ← Atomic Drift table definitions (one class per file)
│   │   │       ├── pharmacies_table.dart       ← Pharmacy tenant definitions.
│   │   │       ├── users_table.dart            ← System users and roles.
│   │   │       ├── customers_table.dart        ← Pharmacy clients data.
│   │   │       ├── categories_table.dart       ← Product category definitions.
│   │   │       ├── manufacturers_table.dart    ← Product manufacturer definitions.
│   │   │       ├── suppliers_table.dart        ← Inventory supplier data with balance tracking.
│   │   │       ├── products_table.dart         ← Master product catalog (V6.1 — no price columns).
│   │   │       ├── product_units_table.dart    ← [V6.1] Multi-unit definitions with conversion_factor & pricing.
│   │   │       ├── product_batches_table.dart  ← Specific batches with expiry, quantity & purchase_price (V6.1).
│   │   │       ├── cash_sessions_table.dart    ← Cashier session tracking.
│   │   │       ├── invoices_table.dart         ← Sales transaction headers.
│   │   │       ├── invoice_items_table.dart    ← Invoice line items with unit_id reference (V6.1).
│   │   │       ├── returns_table.dart          ← Sales returns headers.
│   │   │       ├── return_items_table.dart     ← Specific items returned.
│   │   │       ├── sales_returns_table.dart    ← [V6.1] Sales returns with total_refund_amount.
│   │   │       ├── sales_return_items_table.dart ← [V6.1] Line items for sales returns.
│   │   │       ├── purchase_returns_table.dart   ← [V6.1] Purchase returns headers.
│   │   │       ├── purchase_return_items_table.dart ← [V6.1] Line items for purchase returns.
│   │   │       ├── audit_logs_table.dart       ← System-wide activity logs.
│   │   │       └── payments_table.dart         ← Payment and debt tracking.
│   │   ├── di/
│   │   │   └── injection_container.dart ← GetIt registrations for all services, repos & blocs.
│   │   ├── error/
│   │   │   └── failures.dart       ← Standardizes errors: DatabaseFailure, ServerFailure, etc.
│   │   ├── usecases/
│   │   │   └── usecase.dart        ← Base contract for business logic use cases.
│   │   ├── services/
│   │   │   ├── sync_service.dart       ← Offline-first sync engine: syncDown() (incremental pull), syncUp() (invoice push).
│   │   │   └── sync_preferences.dart  ← Persists last_synced_at in SharedPreferences for incremental sync.
│   │   ├── widgets/                ← Atomic & shared UI components
│   │   │   ├── custom_drawer.dart  ← Main navigation drawer used globally across features.
│   │   │   └── drawer_item.dart    ← Reusable atomic widget for a singular drawer menu item.
│   │   └── models/                 ← Legacy core models (pre-V6.1 Freezed DTOs)
│   │
│   └── features/                   ← Feature-based folder structure
│       ├── customers/              ← Customer management (lightweight for POS debt flow)
│       │   ├── data/
│       │   │   ├── models/
│       │   │   │   └── customer_model.dart       ← Maps CustomerDbModel (Drift) → CustomerEntity.
│       │   │   └── repositories/
│       │   │       └── customer_repository_impl.dart ← Local Drift: LIKE search + insert returning entity.
│       │   └── domain/
│       │       ├── entities/
│       │       │   └── customer_entity.dart      ← Pure entity: id (int), name, phone?, totalDebt.
│       │       └── repositories/
│       │           └── i_customer_repository.dart ← Contract: searchCustomers(), addCustomer().
│       ├── auth/                   ← Supabase Auth & login flow
│       │   ├── data/
│       │   │   ├── models/
│       │   │   │   └── app_user_model.dart      ← Freezed model mapping Supabase Auth user to domain.
│       │   │   └── repositories/
│       │   │       └── auth_repository.dart     ← Handles sign in/out with Supabase Auth.
│       │   └── presentation/
│       │       ├── bloc/
│       │       │   ├── auth_bloc.dart           ← Global Auth state manager (BLoC).
│       │       │   ├── auth_event.dart          ← Auth events (LoginRequested, LogoutRequested).
│       │       │   └── auth_state.dart          ← Auth states (Authenticated, Unauthenticated, etc).
│       │       └── pages/
│       │           └── login_screen.dart        ← UI for logging in.
│       │
│       ├── inventory/              ← Managing stocks and medicine definitions.
│       │   ├── data/
│       │   │   ├── models/
│       │   │   │   ├── product_model.dart       ← [V6.1] Freezed DTO: Product with nested List<ProductUnitModel>.
│       │   │   │   ├── product_unit_model.dart  ← [V6.1] Freezed DTO: Unit with conversion_factor, cost/sell prices.
│       │   │   │   └── product_batch_model.dart ← [V6.1] Freezed DTO: Batch with purchase_price.
│       │   │   └── repositories/
│       │   │       ├── product_repository.dart     ← Legacy hybrid local/Supabase search repo.
│       │   │       └── product_repository_impl.dart ← [V6.1] IProductRepository: reads Drift only, refresh via SyncService.
│       │   └── domain/
│       │       ├── entities/
│       │       │   └── medicine.dart            ← Main inventory domain entity.
│       │       └── repositories/
│       │           └── i_product_repository.dart ← Abstract contract: getProducts(), refreshInventory().
│       │
│       ├── suppliers/              ← Supplier and purchase management.
│       │   ├── data/
│       │   │   └── repositories/
│       │   │       └── supplier_repository_impl.dart ← Local Drift: debt calculation + statement generation.
│       │   └── domain/
│       │       ├── entities/
│       │       │   ├── supplier_entity.dart      ← Pure entity for supplier data.
│       │       │   └── supplier_statement_item.dart ← Entity for account statement entries.
│       │       └── repositories/
│       │           └── i_supplier_repository.dart ← Contract: addSupplier(), getSuppliersWithDebt(), getAccountStatement().
│       │
│       └── pos/

│           ├── data/               ← Implementations of Domain contracts & local fetching
│           │   ├── datasources/
│           │   │   └── pos_local_data_source.dart  ← Drift SQLite queries for searching products.
│           │   ├── models/
│           │   │   ├── sale_item_model.dart         ← Translates Drift ProductDbModel into SaleItemEntity.
│           │   │   └── invoice_item_model.dart      ← [V6.1] Freezed DTO: InvoiceItem with unit_id reference.
│           │   └── repositories/
│           │       └── pos_repository_impl.dart    ← [V6.1] Offline-first checkout: Drift transaction, FIFO stock deduction.
│           ├── domain/             ← Pure Business Logic layer for POS
│           │   ├── entities/
│           │   │   └── sale_item_entity.dart        ← [V6.1] Cart item with unitId, conversionFactor & pricing breakdown.
│           │   └── repositories/
│           │       └── i_pos_repository.dart        ← Abstract contract: checkout(), lookupProduct().
│           └── presentation/       ← UI and State Management for POS
│               ├── bloc/
│               │   ├── pos_cubit.dart               ← [V6.1] Cart logic: addToCart, updateQty, removeFromCart, processCheckout.
│               │   └── pos_state.dart               ← POS state: cartItems, totalAmount, CheckoutStatus enum.
│               ├── pages/
│               │   └── pos_screen.dart              ← Main POS UI handler (Loading/Error/Success states).
│               └── widgets/                         ← Atomic components used only in POS
│                   ├── pos_bottom_bar.dart           ← Checkout footer with total & confirm button.
│                   ├── pos_cart_item_tile.dart       ← Atomic tile for a single cart item.
│                   ├── pos_cart_list.dart            ← Dynamic list of cart items.
│                   ├── pos_search_bar.dart           ← Scanning and name-search input field.
│                   ├── pos_total_display.dart        ← Atomic widget to display total amount.
│                   └── checkout_dialog.dart          ← Full implementation: customer search/quick-add (enhanced with phone), payment method selection, confirm button.
│
├── _agents/                        ← AI agent configuration (skills & workflows)
│   ├── skills/                     ← Expert skill packs for AI-assisted development
│   └── workflows/                  ← Step-by-step workflow definitions
│
└── web/                            ← Flutter web build target assets
```

---

## 🧩 Features Status

| Feature | Domain | Data | Presentation | Status |
|---|---|---|---|---|
| POS (نقطة البيع) | ✅ | ✅ | ✅ | ✅ V6.1 Complete |
| Inventory (المخزن) | ✅ | ✅ | ✅ | 🔄 In Progress (Polishing) |
| Auth (تسجيل الدخول) | ✅ | ✅ | ✅ | ✅ Complete |
| Customers (الزبائن) | ✅ | ✅ | ✅ | ✅ Complete (V1.0 Dashboard) |
| Suppliers (الموردين) | ✅ | ✅ | ❌ | 🔄 In Progress (Data Ready) |
| Reports (التقارير) | ✅ | ✅ | ✅ | ✅ Complete (V1.0 Dashboard) |
| Settings (الإعدادات) | ❌ | ❌ | ❌ | ❌ Not Started |


---

## 📐 Clean Architecture Layers (Quick Reference)

```
Domain Layer      → Entities (pure Dart), Use Cases, Repository Interfaces
     ↓
Data Layer        → Models (JSON/DB conversion), Data Sources, Repository Implementations
     ↓
Presentation      → Screens, Widgets, Cubits/Blocs (state management)
```

> **Rule:** Never import Presentation into Domain. Never import Data directly into Presentation.

---

## 🔑 Key Packages (Why We Use Each)

| Package | Purpose |
|---|---|
| `drift` | Type-safe local SQLite database with code generation |
| `sqlite3_flutter_libs` | Native SQLite3 engine for Drift |
| `path_provider` | Locates the correct system folder for the DB file |
| `shared_preferences` | Stores lightweight settings (e.g., pharmacy name, login state) |
| `flutter_bloc` | State management — separates UI logic from widgets |
| `get_it` | Dependency Injection (Service Locator) for singleton instances |
| `equatable` | Makes Entities comparable — prevents unnecessary UI rebuilds |
| `dartz` | Functional error handling using `Either<Failure, Success>` |
| `supabase_flutter` | Official Supabase client for DB, Auth, and Storage |
| `freezed` & `json_serializable` | Immutable data classes and automatic JSON generation |
| `uuid` | Generates RFC4122 UUIDs for local record IDs |

---

## ✏️ How to Update This File

When you add a new file, append a line to the tree above and update the Features Status table.  
**Format:** `path/to/file.dart  ← One sentence describing what this file does.`

_Last updated: 2026-05-03 (Supplier Feature Implementation & README Refresh)_

