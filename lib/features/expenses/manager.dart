import 'dart:async';

import '/features/realm_core.dart';
import '/models/realm/expense.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';

import '../../models/expense_add_data.dart';

typedef Expenses = List<Expense>;
typedef DatedExpense = MapEntry<DateTime, Expenses>;
typedef DatedExpenses = List<DatedExpense>;

final expensesManagerProvider = Provider((_) => ExpensesManager());

final class ExpensesManager extends RealmCore {
  ExpensesManager() {
    final config = Configuration.local(
      SCHEMAS,
      shouldDeleteIfMigrationNeeded: true,
    );
    super.init(config);

    _load();
  }

  var _expenses = <Expense>[];
  var _datedExpenses = <DatedExpense>[];
  num _expensesTotal = 0.0;

  final _datedController = StreamController<List<DatedExpense>>.broadcast();
  Stream<DatedExpenses> get datedExpensesStream => _datedController.stream;

  Stream<Expenses> get expensesStream => getReactiveList<Expense>();

  final _totalController = StreamController<num>.broadcast();
  Stream<num> get expenseTotalStream => _totalController.stream;

  Expenses get expenses => _expenses;
  DatedExpenses get datedExpenses => _datedExpenses;
  num get expensesTotal => _expensesTotal;

  void _load() {
    _totalController.add(0);

    final expenses = getAll<Expense>();
    final groups = _groupExpenses(expenses);
    groups.sort((a, b) => b.key.compareTo(a.key));

    final total = groups.fold<num>(
      0,
      (acc, entry) =>
          acc +
          entry.value.fold<num>(
            0,
            (prev, curr) => prev.toDouble() + curr.amount.toDouble(),
          ),
    );

    _totalController.add(total);
    _datedController.add(groups);
    _expenses = expenses;
    _datedExpenses = groups;
    _expensesTotal = total;
  }

  void refresh() {
    _load();
  }

  Expense addExpense(ExpenseAddData data) {
    final input = Expense(
      ObjectId(),
      data.amount,
      DateTime.now(),
      notes: data.notes,
      category: data.category,
      title: data.title,
    );

    final expense = add(input);

    _load();

    return expense;
  }

  Expense editExpense(Expense current, ExpenseEditData data) {
    final input = Expense(
      current.id,
      data.amount,
      current.date,
      notes: data.notes,
      category: data.category,
      title: data.title,
    );

    final expense = edit(input);

    _load();

    return expense;
  }

  void deleteExpense(Expense input) {
    delete(input);
    _load();
  }

  List<DatedExpense> _groupExpenses(List<Expense> expenses) {
    final list = <DatedExpense>[];
    for (var e in expenses) {
      final date = DateTime(e.date.year, e.date.month, e.date.day);
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
