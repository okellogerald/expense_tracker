import 'dart:async';

import 'package:expense_tracker_v2/features/realm_core.dart';
import 'package:expense_tracker_v2/models/expense_category_add_data.dart';
import 'package:expense_tracker_v2/models/realm/budget.dart';
import 'package:expense_tracker_v2/models/realm/expense.category.dart';
import 'package:expense_tracker_v2/models/realm/expense.dart';
import 'package:expense_tracker_v2/models/realm/expense.group.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:realm/realm.dart';

import '../models/expense_add_data.dart';

typedef DatedExpenses = MapEntry<DateTime, List<Expense>>;

final expensesManagerProvider = Provider((_) => _Manager());

final class _Manager extends RealmCore {
  _Manager() {
    final config = Configuration.local([
      Expense.schema,
      ExpenseGroup.schema,
      ExpenseCategory.schema,
      Budget.schema,
    ]);
    super.init(config);
    _createMiscCategory();
    _listenToExpensesChanges();
  }

  final _expensesController = StreamController<List<DatedExpenses>>();
  Stream<List<DatedExpenses>> get expensesStream => _expensesController.stream;

  Stream<List<ExpenseCategory>> get categoriesStream =>
      getReactiveList<ExpenseCategory>();

  void _listenToExpensesChanges() {
    final stream = getStream<Expense>();
    stream.listen((e) {
      _expensesController.add(_groupExpenses(getExpenses()));
    });
  }

  void _createMiscCategory() {
    final exists = _getMISCCategory() != null;
    if (exists) return;

    const data = ExpenseCategoryAddData(
      name: "Misc",
      icon: LucideIcons.hash,
      notes: "Expense Category for all uncategorized expenses",
    );
    addCategory(data);
  }

  List<ExpenseCategory> getExpenseCategories() {
    return getAll<ExpenseCategory>();
  }

  List<Expense> getExpenses() {
    return getAll<Expense>();
  }

  void clearExpenses() => clearAll<Expense>();

  getExpenseStream() {}

  Expense addExpense(ExpenseAddData data) {
    final miscCategory = _getMISCCategory()!;

    final input = Expense(
      ObjectId(),
      data.name,
      data.amount,
      DateTime.now(),
      notes: data.notes,
      icon: data.icon?.codePoint,
      category: data.category ?? miscCategory,
    );

    return add(input);
  }

  ExpenseCategory addCategory(ExpenseCategoryAddData data) {
    final input = ExpenseCategory(
      ObjectId(),
      data.name,
      notes: data.notes,
      group: data.group,
      icon: data.icon?.codePoint,
    );

    return add(input);
  }

  ExpenseCategory? _getMISCCategory() {
    return getExpenseCategories().where((e) => e.name == "Misc").singleOrNull;
  }

  List<DatedExpenses> _groupExpenses(List<Expense> expenses) {
    final list = <DatedExpenses>[];
    for (var e in expenses) {
      final date = DateTime(e.datePaid.year, e.datePaid.month, e.datePaid.day);
      final index = list.indexWhere((e) => e.key == date);
      if (index == -1) {
        list.add(MapEntry(date, [e]));
      } else {
        list[index] = MapEntry(date, list[index].value..add(e));
      }
    }

    return list;
  }
}
