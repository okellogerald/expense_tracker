import 'package:hive/hive.dart';
import '../source.dart';

part 'record.g.dart';

@HiveType(typeId: 2)
class Record extends HiveObject {
  @HiveField(0)
  final Category category;

  @HiveField(1)
  final int amount;

  @HiveField(2)
  final DateTime date;

  Record({
    required this.amount,
    required this.category,
    required this.date,
  });

  Record copyWith({int? amount, DateTime? date, Category? category}) => Record(
      amount: amount ?? this.amount,
      category: category ?? this.category,
      date: date ?? this.date);

  String get getAmount => Utils.convertToMoneyFormat(amount);
}
