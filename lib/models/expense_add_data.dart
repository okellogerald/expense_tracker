import 'package:expense_tracker_v2/components/_common_imports.dart';
import 'package:expense_tracker_v2/models/realm/expense.category.dart';

class ExpenseAddData {
  final String name;

  final IconData? icon;
  final String? notes;
  final double amount;

  final ExpenseCategory? category;

  const ExpenseAddData({
    required this.name,
    required this.amount,
    this.icon,
    this.notes,
    this.category,
  });
}
