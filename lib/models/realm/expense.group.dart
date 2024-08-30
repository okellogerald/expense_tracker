import 'package:realm/realm.dart';

part "expense.group.realm.dart";

@RealmModel()
class $ExpenseGroup {
  @PrimaryKey()
  late ObjectId id;

  late String name;

  late int? icon;

  late String? notes;
}
