import 'package:expense_tracker_v2/models/realm/expense.category.dart';
import 'package:realm/realm.dart';

part "expense.future.realm.dart";

@RealmModel()
class $FutureExpense {
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

  late DateTime? expectedPayingDate;
}
