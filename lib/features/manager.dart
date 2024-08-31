import 'package:expense_tracker_v2/models/expense_category_add_data.dart';
import 'package:expense_tracker_v2/models/realm/budget.dart';
import 'package:expense_tracker_v2/models/realm/expense.category.dart';
import 'package:expense_tracker_v2/models/realm/expense.dart';
import 'package:expense_tracker_v2/models/realm/expense.group.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';

import '../models/expense_add_data.dart';

final expensesManagerProvider = Provider((_) => _Manager());

class _Manager {
  late final Realm realm;

  void init() {
    final config = Configuration.local([
      Expense.schema,
      ExpenseGroup.schema,
      ExpenseCategory.schema,
      Budget.schema,
    ]);

    realm = Realm(config);
  }

  Expense addExpense(ExpenseAddData data) {
    final input = Expense(
      ObjectId(),
      data.name,
      data.amount,
      DateTime.now(),
      notes: data.notes,
      icon: data.icon?.codePoint,
      category: data.category,
    );
    return realm.add(input);
  }

  ExpenseCategory addCategory(ExpenseCategoryAddData data) {
    final input = ExpenseCategory(
      ObjectId(),
      data.name,
      notes: data.notes,
      group: data.group,
      icon: data.icon?.codePoint,
    );

    late ExpenseCategory c;
    realm.write(() {
      c = realm.add(input);
    });

    return c;
  }

  List<ExpenseCategory> getExpenseCategories() {
    final result = realm.all<ExpenseCategory>();
    return result.indexed.map((e) => e.$2).toList();
  }
}
