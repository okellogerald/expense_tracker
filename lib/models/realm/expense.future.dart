import 'package:expense_tracker_v2/models/realm/expense.category.dart';
import 'package:realm/realm.dart';

part "expense.future.realm.dart";

@RealmModel()
class $FutureExpense {
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;

  late double amount;
  late DateTime payDate;

  late String? title;
  late String? notes;
  late $ExpenseCategory? category;
}
