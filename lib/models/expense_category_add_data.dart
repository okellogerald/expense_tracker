import '/components/_common_imports.dart';
import '/models/source.dart';

class ExpenseCategoryAddData {
  final String name;

  final IconData? icon;
  final String? notes;
  final ExpenseGroup? group;

  const ExpenseCategoryAddData({
    required this.name,
    this.icon,
    this.notes,
    this.group,
  });
}
