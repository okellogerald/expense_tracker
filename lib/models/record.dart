import 'package:hive/hive.dart';
import '../source.dart';

part 'g_models/record.g.dart';

@HiveType(typeId: 2)
class Record extends HiveObject {
  @HiveField(0)
  final Category category;

  @HiveField(1)
  final double amount;

  @HiveField(2)
  final DateTime date;

  @HiveField(3)
  final String id;

  @HiveField(4)
  final String notes;

  Record({
    required this.id,
    required this.amount,
    required this.category,
    required this.date,
    required this.notes,
  });

  Record copyWith(
          {double? amount,
          DateTime? date,
          Category? category,
          String? id,
          String? notes}) =>
      Record(
        amount: amount ?? this.amount,
        category: category ?? this.category,
        date: date ?? this.date,
        id: id ?? this.id,
        notes: notes ?? this.notes,
      );

  factory Record.empty() => Record(
      id: '-1',
      amount: 0.0,
      category: Category(),
      date: DateTime.now(),
      notes: '');

  String get getAmount => Utils.convertToMoneyFormat(amount);
}
