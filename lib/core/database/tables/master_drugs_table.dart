// =============================================================
// File: lib/core/database/tables/master_drugs_table.dart
// Purpose: Global dictionary of drugs to help pharmacists add products faster.
// =============================================================

import 'package:drift/drift.dart';

class MasterDrugsTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()(); // Generic/International name
  TextColumn get barcode => text().nullable()();
  TextColumn get category => text().nullable()();
  TextColumn get description => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class MasterUnitsTable extends Table {
  TextColumn get id => text()();
  TextColumn get masterDrugId => text().references(MasterDrugsTable, #id)();
  TextColumn get unitName => text()(); // e.g., "علبة", "شريط", "حبة"
  RealColumn get conversionFactor => real()();
  
  @override
  Set<Column> get primaryKey => {id};
}
