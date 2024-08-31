import 'package:expense_tracker_v2/features/manager.dart';
import 'package:expense_tracker_v2/models/realm/expense.category.dart';

import '../common_imports.dart';

class ExpenseCategorySelectPage extends ConsumerStatefulWidget {
  final ExpenseCategory? current;
  const ExpenseCategorySelectPage({this.current, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ExpenseCategoryPageSelectState();

  static const routeName = "/expense-category-select";

  static Future<ExpenseCategory?> to() =>
      router.push<ExpenseCategory>(routeName);

  /// if you knew how to come to this page, then you know how to leave it
  static void pop([ExpenseCategory? c]) => router.pop(c);

  static Widget builder(BuildContext c, GoRouterState state) {
    return const ExpenseCategorySelectPage();
  }
}

class _ExpenseCategoryPageSelectState
    extends ConsumerState<ExpenseCategorySelectPage> with AfterLayoutMixin {
  var categories = <ExpenseCategory>[];
  ExpenseCategory? category;

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    categories = ref.read(expensesManagerProvider).getExpenseCategories();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText("Select Category"),
      ),
      bottomNavigationBar: BottomButton(
        onPressed: done,
      ),
      body: ListView.separated(
        padding: kHorPadding,
        itemCount: categories.length,
        itemBuilder: (_, i) => AppSelectTile(
          value: categories[i],
          label: (p0) => p0.name,
          onSelect: (value) => setState(() {
            category = value;
          }),
          selected: (p0) => p0.id == category?.id,
        ),
        separatorBuilder: (_, __) => vSpace(),
      ),
    );
  }

  void done() {
    ExpenseCategorySelectPage.pop(category);
  }
}
