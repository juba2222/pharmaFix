// =============================================================
// File: lib/core/services/auth_preferences.dart
// Purpose: Persists the logged-in user's authentication details (UserId, PharmacyId).
//          Used globally to filter database queries and handle multi-tenancy.
// Layer: Core (Services)
// =============================================================

import 'package:shared_preferences/shared_preferences.dart';

class AuthPreferences {
  static const String _userIdKey = 'auth_user_id';
  static const String _pharmacyIdKey = 'auth_pharmacy_id';
  static const String _userNameKey = 'auth_user_name';

  /// Saves the authenticated user's session data.
  static Future<void> saveAuthData({
    required String userId,
    required String pharmacyId,
    required String userName,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userIdKey, userId);
    await prefs.setString(_pharmacyIdKey, pharmacyId);
    await prefs.setString(_userNameKey, userName);
  }

  /// Retrieves the current pharmacy ID.
  static Future<String?> getPharmacyId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_pharmacyIdKey);
  }

  /// Retrieves the current user ID.
  static Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userIdKey);
  }

  /// Retrieves the current user Name.
  static Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userNameKey);
  }

  /// Clears all auth data (used on Logout).
  static Future<void> clearAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userIdKey);
    await prefs.remove(_pharmacyIdKey);
    await prefs.remove(_userNameKey);
  }
}
