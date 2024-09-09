import '/models/realm/expense.category.dart';

class ExpenseAddData {
  final double amount;
  final DateTime date;

  final String? notes;
  final String? title;

  final ExpenseCategory category;

  const ExpenseAddData({
    required this.amount,
    required this.date,
    required this.category,
    this.title,
    this.notes,
  });
}

class ExpenseEditData {
  final double amount;
  final String? notes;
  final String? title;
  final ExpenseCategory category;

  const ExpenseEditData({
    required this.amount,
    required this.category,
    this.notes,
    this.title,
  });
}
