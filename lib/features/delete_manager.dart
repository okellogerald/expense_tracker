import '/models/realm/expense.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'expenses/manager.dart';
import 'categories/manager.dart';
import 'groups/manager.dart';

final deleteManagerProvider = Provider((ref) => _Manager(
      expensesManager: ref.read(expensesManagerProvider),
      categoriesManager: ref.read(categoriesManagerProvider),
      groupsManager: ref.read(groupsManagerProvider),
    ));

final class _Manager {
  final ExpensesManager expensesManager;
  final CategoriesManager categoriesManager;
  final GroupsManager groupsManager;

  _Manager({
    required this.categoriesManager,
    required this.groupsManager,
    required this.expensesManager,
  });

  void deleteExpense(Expense expense) {
    expensesManager.delete(expense);

    categoriesManager.refresh();
    groupsManager.refresh();
  }
}
