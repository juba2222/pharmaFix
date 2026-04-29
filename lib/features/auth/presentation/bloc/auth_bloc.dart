import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/models/app_user_model.dart';
import '../../../../core/services/auth_preferences.dart';
import '../../../../core/base/current_session.dart';
import '../../../../core/di/injection_container.dart';

import '../../../../core/services/sync_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;
  final SyncService _syncService;

  AuthBloc(this._repository, this._syncService) : super(AuthInitial()) {
    on<AuthCheckRequested>((event, emit) async {
      final user = _repository.currentUser;
      if (user != null) {
        // 1. Persist in SharedPreferences (Async/Permanent)
        await AuthPreferences.saveAuthData(
          userId: user.id,
          pharmacyId: user.pharmacyId,
          userName: user.name,
        );

        // 2. Populate Global Singleton (Sync/Fast)
        sl<CurrentSession>().setSession(
          pharmacyId: user.pharmacyId,
          userId: user.id,
          role: user.roleId,
        );
        
        // Trigger sync in background
        _syncService.syncDown();

        emit(AuthAuthenticated(user));
      } else {
        emit(AuthUnauthenticated());
      }
    });

    on<AuthSignInRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await _repository.signIn(email: event.email, password: event.password);
        final user = _repository.currentUser;
        if (user != null) {
          // 1. Persist in SharedPreferences (Async/Permanent)
          await AuthPreferences.saveAuthData(
            userId: user.id,
            pharmacyId: user.pharmacyId,
            userName: user.name,
          );

          // 2. Populate Global Singleton (Sync/Fast)
          sl<CurrentSession>().setSession(
            pharmacyId: user.pharmacyId,
            userId: user.id,
            role: user.roleId,
          );

          // Trigger sync in background
          _syncService.syncDown();

          emit(AuthAuthenticated(user));
        } else {
          emit(AuthUnauthenticated());
        }
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<LogoutRequested>((event, emit) async {
      await _repository.signOut();
      await AuthPreferences.clearAuthData();
      sl<CurrentSession>().clear();
      emit(AuthUnauthenticated());
    });
  }
}
