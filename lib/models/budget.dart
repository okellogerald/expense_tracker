import 'package:hive/hive.dart';
import '../source.dart';

part 'budget.g.dart';

@HiveType(typeId: 1)
class Budget extends HiveObject {
  @HiveField(0)
  final Category category;

  @HiveField(1)
  final double amount;

  @HiveField(2)
  final String id;

  @HiveField(3)
  final int duration;

  Budget({
    required this.category,
    required this.amount,
    required this.id,
    required this.duration,
  });

  static Budget empty() =>
      Budget(category: Category(), amount: 0, id: '-1', duration: 0);

  String get getAmount => Utils.convertToMoneyFormat(amount);

 // double get getPercent => 
}
