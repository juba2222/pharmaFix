import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/app_user_model.dart';

class AuthRepository {
  final SupabaseClient _supabase;

  AuthRepository(this._supabase);

  /// Authenticate user using email and password.
  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    try {
      return await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  /// Create a new user and pass pharmacy_id and role_id in metadata.
  /// This metadata will be used by the DB trigger to populate the public.users table.
  Future<AuthResponse> signUp({
    required String name,
    required String email,
    required String password,
    required String pharmacyId,
    required String roleId,
  }) async {
    try {
      return await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          'name': name,
          'pharmacy_id': pharmacyId,
          'role_id': roleId,
          'is_active': true,
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  /// Get currently signed-in user as [AppUser].
  AppUser? get currentUser {
    final user = _supabase.auth.currentUser;
    if (user == null) return null;
    return AppUser.fromSupabaseUser(user);
  }

  /// Sign out current session.
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  /// Stream of authentication state changes.
  Stream<AuthState> get authStateChanges => _supabase.auth.onAuthStateChange;
}
