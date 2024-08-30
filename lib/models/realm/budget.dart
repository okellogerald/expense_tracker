import 'package:realm/realm.dart';

import 'expense.category.dart';
import 'expense.group.dart';

part "budget.realm.dart";

@RealmModel()
class $Budget {
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;

  late DateTime createdAt;
  late DateTime updatedAt;

  /// either category or group shouldn't be null
  late $ExpenseCategory? category;

  /// either category or group shouldn't be null
  late $ExpenseGroup? group;

  late double amount;

  late String? notes;
}
