// =============================================================
// File: lib/core/base/current_session.dart
// Purpose: Synchronous, globally accessible singleton to hold the current user's session data.
//          Avoids repeated async calls to SharedPreferences for multi-tenant filtering.
// Layer: Core (Base)
// =============================================================

class CurrentSession {
  String? _pharmacyId;
  String? _userId;
  String? _userRole;

  // Getters
  String? get pharmacyId => _pharmacyId;
  String? get userId => _userId;
  String? get userRole => _userRole;

  /// Returns true if there is an active session with valid IDs.
  bool get isAuthenticated => _pharmacyId != null && _userId != null;

  /// Populates the session data. Called upon successful Login or AuthCheck.
  void setSession({
    required String pharmacyId,
    required String userId,
    required String role,
  }) {
    _pharmacyId = pharmacyId;
    _userId = userId;
    _userRole = role;
  }

  /// Clears the session data. Called upon Logout.
  void clear() {
    _pharmacyId = null;
    _userId = null;
    _userRole = null;
  }
}
