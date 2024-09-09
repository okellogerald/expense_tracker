import '../../features/expenses/manager.dart';

import 'components/expense_group_card.dart';
import '../common_imports.dart';

class GroupedExpensesList extends ConsumerStatefulWidget {
  const GroupedExpensesList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends ConsumerState<GroupedExpensesList>
    with AfterLayoutMixin {
  DatedExpenses expenses = [];

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    final list = ref.read(expensesManagerProvider).datedExpenses;
    updateCategories(list);

    ref.read(expensesManagerProvider).datedExpensesStream.listen((l) {
      updateCategories(l);
    });
  }

  updateCategories(DatedExpenses list) {
    setState(() => expenses = list);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: expenses.length,
      padding: bottom(80),
      itemBuilder: (_, i) => ExpensesGroupCard(expenses[i]),
      separatorBuilder: (_, i) => vSpace(40),
    );
  }
}
