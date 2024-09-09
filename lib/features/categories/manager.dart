import '/features/realm_core.dart';
import '/pages/common_imports.dart';
import 'package:realm/realm.dart';

import '../../models/expense_category_add_data.dart';
import '../../models/realm/expense.category.dart';

typedef AmountedCategory = MapEntry<ExpenseCategory, double>;
typedef AmountedCategories = List<AmountedCategory>;
typedef Categories = List<ExpenseCategory>;

final categoriesManagerProvider = Provider((_) => CategoriesManager());

final class CategoriesManager extends RealmCore {
  CategoriesManager() {
    final config = Configuration.local(
      SCHEMAS,
      shouldDeleteIfMigrationNeeded: true,
    );
    super.init(config);

    _createMiscCategory();
    _load();
  }

  var _categories = <ExpenseCategory>[];
  Stream<List<ExpenseCategory>> get onCategoriesChange =>
      getReactiveList<ExpenseCategory>();

  var _amountedCategories = <AmountedCategory>[];
  final _controller = StreamController<AmountedCategories>.broadcast();
  Stream<AmountedCategories> get onAmountedCategoriesChange =>
      _controller.stream;

  AmountedCategories get amountedCategories => _amountedCategories;
  Categories get categories => _categories;

  void _load() {
    final categories = super.getAll<ExpenseCategory>();
    final expenses = super.getAll<Expense>();

    final AmountedCategories entries = [];

    for (var c in categories) {
      final list = expenses.where((e) => e.category == c);
      final total = list.fold(0.0, (prev, e) => prev + e.amount);
      final entry = MapEntry(c, total);
      entries.add(entry);
    }

    _controller.add(entries);
    _categories = categories;
    _amountedCategories = entries;
  }

  void refresh() {
    _load();
  }

  ExpenseCategory addCategory(ExpenseCategoryAddData data) {
    final input = ExpenseCategory(
      ObjectId(),
      data.name,
      notes: data.notes,
      group: data.group,
      icon: data.icon?.codePoint,
    );

    final category = add(input);
    _load();

    return category;
  }

  ExpenseCategory editCategory(
      ObjectId categoryId, ExpenseCategoryAddData data) {
    final input = ExpenseCategory(
      categoryId,
      data.name,
      notes: data.notes,
      group: data.group,
      icon: data.icon?.codePoint,
    );

    final category = edit(input);
    _load();

    return category;
  }

  bool _checkMISCCategory() {
    return getAll<ExpenseCategory>()
            .where((e) => e.name == "Misc")
            .singleOrNull !=
        null;
  }

  ExpenseCategory getMISCCategory() {
    return _categories.where((e) => e.name == "Misc").single;
  }

  void _createMiscCategory() {
    final exists = _checkMISCCategory();
    if (exists) return;

    const data = ExpenseCategoryAddData(
      name: "Misc",
      icon: LucideIcons.hash,
      notes: "Expense Category for all uncategorized expenses",
    );
    addCategory(data);
  }
}
