import 'package:expense_tracker_v2/models/realm/expense.group.dart';
import 'package:realm/realm.dart';

part "expense.category.realm.dart";

@RealmModel()
class $ExpenseCategory {
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;

  late DateTime createdAt;
  late DateTime updatedAt;

  late String name;

  late $ExpenseGroup? group;

  late int? icon;

  late String? notes;
}
