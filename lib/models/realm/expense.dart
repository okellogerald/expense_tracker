import 'package:realm/realm.dart';

import 'expense.category.dart';

part "expense.realm.dart";

@RealmModel()
class $Expense {
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;

  late DateTime createdAt;
  late DateTime updatedAt;

  late $ExpenseCategory? category;

  late String name;

  late double amount;

  late String? notes;

  late int? icon;

  late DateTime datePaid;
}
