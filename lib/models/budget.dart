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

  @HiveField(4)
  final double used;

  Budget({
    required this.category,
    required this.amount,
    required this.id,
    required this.duration,
    this.used = 0.0,
  });

  static Budget empty() =>
      Budget(category: Category(), amount: 0, id: '-1', duration: 0);

  Budget copyWith(
          {double? used, int? duration, Category? category, double? amount}) =>
      Budget(
          amount: amount ?? this.amount,
          category: category ?? this.category,
          duration: duration ?? this.duration,
          id: id,
          used: used ?? this.used);

  String get getAmount => Utils.convertToMoneyFormat(amount);

  String get getUsed => Utils.convertToMoneyFormat(used);

  String get getBalance => Utils.convertToMoneyFormat(amount - used);

  String get getBalanceAsPercentage =>
      ((1 - (used / amount)) * 100).toStringAsFixed(2);
}
