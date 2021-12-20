import 'package:hive/hive.dart';
import '../source.dart';

part 'total_records.g.dart';

@HiveType(typeId: 3)
class TotalRecords extends HiveObject {
  @HiveField(0)
  final int totalExpenses;

  @HiveField(1)
  final int totalIncome;

  @HiveField(2)
  final int budget;

  TotalRecords({
    this.budget = 0,
    this.totalExpenses = 0,
    this.totalIncome = 0,
  });

  TotalRecords copyWith({int? budget, int? totalIncome, int? totalExpenses}) =>
      TotalRecords(
        budget: budget ?? this.budget,
        totalExpenses: totalExpenses ?? this.totalExpenses,
        totalIncome: totalIncome ?? this.totalIncome,
      );

  String get getIncome => Utils.convertToMoneyFormat(totalIncome);
  String get getExpenses => Utils.convertToMoneyFormat(totalExpenses);
  String get getBudget => Utils.convertToMoneyFormat(budget);
}
