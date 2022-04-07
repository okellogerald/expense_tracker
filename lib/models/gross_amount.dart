import 'package:hive/hive.dart';

part 'gross_amount.g.dart';

@HiveType(typeId: 5)
class GrossAmount extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final double amount;

  @HiveField(2)
  final DateTime lastDate;

  @HiveField(3)
  final String title;

  GrossAmount(
      {required this.id,
      required this.amount,
      required this.lastDate,
      required this.title});

  factory GrossAmount.empty() =>
      GrossAmount(id: '-1', amount: 0, lastDate: DateTime.now(), title: '');

  GrossAmount copyWith(
          {String? id, double? amount, DateTime? lastDate, String? title}) =>
      GrossAmount(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        title: title ?? this.title,
        lastDate: lastDate ?? this.lastDate,
      );
}
