import 'package:expense_tracker_v2/features/realm_core.dart';
import 'package:expense_tracker_v2/pages/common_imports.dart';
import 'package:realm/realm.dart';

import '../../models/realm/expense.category.dart';

typedef Categories = List<MapEntry<ExpenseCategory, double>>;

final categoriesManagerProvider = Provider((_) => _CategoriesManager());

final class _CategoriesManager extends RealmCore {
  _CategoriesManager() {
    final config = Configuration.local(
      [
        Expense.schema,
        ExpenseCategory.schema,
        ExpenseGroup.schema,
      ],
      // shouldDeleteIfMigrationNeeded: true,
    );
    super.init(config);
    _load();
  }

  final _controller = StreamController<Categories>.broadcast();
  Stream<Categories> get categoriesStream => _controller.stream;

  void refresh() {
    _load();
  }

  void _load() {
    final categories = super.getAll<ExpenseCategory>();
    final expenses = super.getAll<Expense>();

    final Categories entries = [];

    for (var c in categories) {
      final list = expenses.where((e) => e.category == c);
      final total = list.fold(0.0, (prev, e) => prev + e.amount);
      final entry = MapEntry(c, total);
      entries.add(entry);
    }

    _controller.add(entries);
  }
}
