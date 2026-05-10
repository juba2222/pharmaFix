import 'package:drift/drift.dart';

@DataClassName('ExpenseDbModel')
class ExpensesTable extends Table {
  TextColumn get id => text()();
  TextColumn get pharmacyId => text()();
  TextColumn get category => text()(); // e.g., 'Rent', 'Salaries', 'Electricity'
  RealColumn get amount => real()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
