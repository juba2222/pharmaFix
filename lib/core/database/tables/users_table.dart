import 'package:drift/drift.dart';
import '../table_constants.dart';

@DataClassName('UserDbModel')
class UsersTable extends Table {
  @override
  String get tableName => TableConstants.tableNameUsers;

  IntColumn get id => integer().named(TableConstants.colId).autoIncrement()();
  IntColumn get pharmacyId => integer().named(TableConstants.colPharmacyId)();
  TextColumn get name => text().named(TableConstants.colName)();
  TextColumn get email => text().named(TableConstants.colEmail).unique().nullable()(); // Point: Unique Email
  TextColumn get phoneNumber => text().named(TableConstants.colPhoneNumber).nullable()();
  TextColumn get passwordHash => text().named(TableConstants.colPasswordHash)();
  TextColumn get role => text().named(TableConstants.colRole)(); // admin, cashier, pharmacist
  BoolColumn get isActive => boolean().named(TableConstants.colIsActive).withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().named(TableConstants.colCreatedAt).withDefault(currentDateAndTime)();
}
