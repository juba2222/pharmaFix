import 'package:supabase_flutter/supabase_flutter.dart';

class AppUser {
  final String id;
  final String email;
  final String name;
  final String pharmacyId;
  final String roleId;
  final bool isActive;

  AppUser({
    required this.id,
    required this.email,
    required this.name,
    required this.pharmacyId,
    required this.roleId,
    this.isActive = true,
  });

  /// Factory constructor to create an [AppUser] from a Supabase [User] object.
  /// Extracts data from `userMetadata`.
  factory AppUser.fromSupabaseUser(User user) {
    final metadata = user.userMetadata ?? {};
    return AppUser(
      id: user.id,
      email: user.email ?? '',
      name: metadata['name'] as String? ?? '',
      pharmacyId: metadata['pharmacy_id'] as String? ?? '',
      roleId: metadata['role_id'] as String? ?? '',
      isActive: metadata['is_active'] as bool? ?? true,
    );
  }

  @override
  String toString() {
    return 'AppUser(id: $id, email: $email, name: $name, pharmacyId: $pharmacyId, roleId: $roleId, isActive: $isActive)';
  }
}
