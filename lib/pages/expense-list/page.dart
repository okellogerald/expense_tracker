import 'package:expense_tracker_v2/pages/expense-add/page.dart';
import 'package:lucide_icons/lucide_icons.dart';

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
        title: const AppText("Records"),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: ExpenseAddPage.to,
        child: Icon(LucideIcons.plus),
      ),
      body: ListView(
        padding: kHorPadding,
        children: [],
      ),
    );
  }
}
