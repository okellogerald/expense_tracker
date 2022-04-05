import 'package:hive/hive.dart';

part 'g_models/total_records.g.dart';

@HiveType(typeId: 3)
class TotalRecords extends HiveObject {
  @HiveField(0)
  final double totalExpenses;

  @HiveField(1)
  final double totalIncome;

  @HiveField(2)
  final double budget;

  TotalRecords({
    this.budget = 0,
    this.totalExpenses = 0,
    this.totalIncome = 0,
  });

  TotalRecords copyWith(
          {double? budget, double? totalIncome, double? totalExpenses}) =>
      TotalRecords(
        budget: budget ?? this.budget,
        totalExpenses: totalExpenses ?? this.totalExpenses,
        totalIncome: totalIncome ?? this.totalIncome,
      );

/*  String get getIncome => Utils.convertToMoneyFormat(totalIncome);
  String get getExpenses => Utils.convertToMoneyFormat(totalExpenses);
  String get getBudget => Utils.convertToMoneyFormat(budget);*/
  double get balance => totalIncome - totalExpenses;
}
