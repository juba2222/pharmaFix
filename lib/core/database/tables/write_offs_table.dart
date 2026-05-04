// =============================================================
// File: lib/core/database/tables/write_offs_table.dart
// Purpose: Tracks inventory write-offs (damage, expired, etc.)
// Layer: Core (Database Tables)
// =============================================================

import 'package:drift/drift.dart';
import '../table_constants.dart';

class WriteOffsTable extends Table {
  @override
  String get tableName => TableConstants.tableNameWriteOffs;

  TextColumn get id => text()();
  TextColumn get pharmacyId => text().withLength(min: 1, max: 50)();
  TextColumn get productId => text().withLength(min: 1, max: 50)();
  TextColumn get batchId => text().withLength(min: 1, max: 50)();
  TextColumn get unitId => text().withLength(min: 1, max: 50)();
  RealColumn get quantity => real()();
  TextColumn get reason => text().withLength(min: 1, max: 200)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Index> get indexes => [
        Index(productId, 'idx_write_off_product'),
        Index(batchId, 'idx_write_off_batch'),
      ];
}
