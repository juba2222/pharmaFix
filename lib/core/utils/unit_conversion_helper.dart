// =============================================================
// File: lib/core/utils/unit_conversion_helper.dart
// Purpose: Logic for converting raw pill counts to human-readable units.
// =============================================================

class UnitConversionHelper {
  /// Converts total small units (pills) to "X Boxes, Y Strips, Z Pills"
  /// format based on conversion factor.
  static String formatQuantity({
    required double totalPills,
    required int pillsPerBox,
  }) {
    if (pillsPerBox <= 1) return "${totalPills.toInt()} وحدة";

    int boxes = totalPills ~/ pillsPerBox;
    int remaining = totalPills.toInt() % pillsPerBox;

    List<String> parts = [];
    if (boxes > 0) parts.add("$boxes علبة");
    if (remaining > 0) parts.add("$remaining وحدة");

    return parts.isEmpty ? "0 وحدة" : parts.join(" و ");
  }
}
