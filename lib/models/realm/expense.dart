import 'package:realm/realm.dart';

import 'expense.category.dart';

part "expense.realm.dart";

@RealmModel()
class $Expense {
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;

  late double amount;
  late DateTime date;

  late String? notes;
  late $ExpenseCategory? category;
}
