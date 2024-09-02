import 'package:expense_tracker_v2/features/manager.dart';
import 'package:expense_tracker_v2/pages/expense-add/page.dart';

import '../../components/expense_tile.dart';
import '../common_imports.dart';

class ExpensesPage extends ConsumerStatefulWidget {
  const ExpensesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends ConsumerState<ExpensesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText("Expenses"),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: ExpenseAddPage.to,
        child: Icon(LucideIcons.plus),
      ),
      body: StreamBuilder<List<Expense>>(
          stream: ref.read(expensesManagerProvider).expensesStream,
          builder: (context, snapshot) {
            final data = snapshot.data ?? [];
            return ListView.separated(
              padding: kHorPadding,
              itemCount: data.length,
              itemBuilder: (_, i) => ExpenseTile(data[i]),
              separatorBuilder: (_, i) => vSpace(2),
            );
          }),
    );
  }
}
