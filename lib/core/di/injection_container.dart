// =============================================================
// File: lib/core/di/injection_container.dart
// Purpose: Main hub for Dependency Injection (Service Locator).
//          Registers singletons and factories so the app can request them globally.
// Layer: Core (DI)
// Dependencies: get_it
// =============================================================

import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../base/current_session.dart';
import '../database/app_database.dart';
import '../database/daos/sync_dao.dart';
import '../services/sync_service.dart';
import '../../features/auth/data/repositories/auth_repository.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/customers/data/repositories/customer_repository_impl.dart';
import '../../features/customers/domain/repositories/i_customer_repository.dart';
// import '../../features/inventory/data/repositories/product_repository.dart';
// import '../../features/inventory/data/repositories/product_repository_impl.dart';
// import '../../features/inventory/domain/repositories/i_product_repository.dart';
import '../../features/pos/domain/repositories/i_pos_repository.dart';
import '../../features/pos/data/repositories/pos_repository_impl.dart';
import '../../features/pos/presentation/bloc/pos_cubit.dart';
import '../../features/inventory/domain/repositories/i_inventory_repository.dart';
import '../../features/inventory/data/repositories/inventory_repository_impl.dart';
import '../../features/inventory/presentation/bloc/inventory_cubit.dart';

// 'sl' stands for Service Locator
final sl = GetIt.instance;

Future<void> init() async {
  // -----------------------------------------------------------
  // 0. Base / Session
  // -----------------------------------------------------------
  sl.registerLazySingleton<CurrentSession>(() => CurrentSession());

  // 1. Core / Database
  // -----------------------------------------------------------
  sl.registerLazySingleton<AppDatabase>(() => AppDatabase());
  sl.registerLazySingleton<SyncDao>(() => sl<AppDatabase>().syncDao);

  // 2. Data Sources / External
  sl.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  // 3. Services
  sl.registerLazySingleton<SyncService>(() => SyncService(sl(), sl()));

  // 4. Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepository(sl()));
  sl.registerLazySingleton<IPosRepository>(() => PosRepositoryImpl(sl()));
  sl.registerLazySingleton<IInventoryRepository>(() => InventoryRepositoryImpl(sl()));

  // V6.1: ProductRepositoryImpl — reads from Drift, syncs via SyncService
  // sl.registerLazySingleton<IProductRepository>(
  //   () => ProductRepositoryImpl(sl(), sl()),
  // );

  // Customers — offline-first, local Drift only
  sl.registerLazySingleton<ICustomerRepository>(
    () => CustomerRepositoryImpl(sl()),
  );

  // Legacy ProductRepository (hybrid search — kept for backward compat)
  // sl.registerLazySingleton<ProductRepository>(() => ProductRepository(sl(), sl()));

  // -----------------------------------------------------------
  // 5. Blocs / State Management
  // -----------------------------------------------------------
  // Registered as Factory — fresh instance per screen open
  sl.registerFactory(() => AuthBloc(sl(), sl()));
  sl.registerFactory(() => PosCubit(sl<IPosRepository>(), sl<ICustomerRepository>()));
  sl.registerFactory(() => InventoryCubit(sl<IInventoryRepository>()));
}
