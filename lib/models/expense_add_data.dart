import '/models/realm/expense.category.dart';

class ExpenseAddData {
  final double amount;
  final DateTime date;

  final String? notes;
  final ExpenseCategory category;

  const ExpenseAddData({
    required this.amount,
    required this.date,
    required this.category,
    this.notes,
  });
}
