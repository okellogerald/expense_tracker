import 'package:realm/realm.dart';

@RealmModel()
class $Income {
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;

  late DateTime createdAt;
  late DateTime updatedAt;

  late String name;

  late double amount;

  late String? notes;

  late int? icon;

  late DateTime datePaid;
}
