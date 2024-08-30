import 'package:expense_tracker_v2/models/realm/budget.dart';
import 'package:expense_tracker_v2/models/realm/expense.category.dart';
import 'package:expense_tracker_v2/models/realm/expense.dart';
import 'package:expense_tracker_v2/models/realm/expense.group.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';

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
}
