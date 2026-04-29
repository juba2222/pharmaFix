// =============================================================
// File: lib/core/services/sync_preferences.dart
// Purpose: Persists the last successful sync timestamp using SharedPreferences.
//          Enables incremental sync — only pulling records changed since last sync.
// Layer: Core (Services)
// =============================================================

import 'package:shared_preferences/shared_preferences.dart';

class SyncPreferences {
  static const String _lastSyncKey = 'last_synced_at';

  /// Returns the last synced timestamp as an ISO8601 string.
  /// Falls back to epoch if never synced (pulls everything on first run).
  static Future<String> getLastSyncTimestamp() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_lastSyncKey) ?? '1970-01-01T00:00:00Z';
  }

  /// Saves the current time as the last successful sync timestamp.
  static Future<void> saveLastSyncTimestamp() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _lastSyncKey,
      DateTime.now().toUtc().toIso8601String(),
    );
  }

  /// Resets the timestamp (forces a full re-sync on next syncDown call).
  static Future<void> resetSyncTimestamp() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_lastSyncKey);
  }
}
