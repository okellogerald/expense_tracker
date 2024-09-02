import '/pages/expense-add/page.dart';

import '../common_imports.dart';
import '../expense-list/list.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText("Expenses"),
        centerTitle: false,
        actions: [
          AppTextButton(
            onPressed: () {},
            child: Row(
              children: [
                const Icon(LucideIcons.settings),
                hSpace(5),
                const AppText('Settings'),
              ],
            ),
          ),
        ],
        bottom: PreferredSize(
            preferredSize: Size(double.maxFinite, 80),
            child: Container(
              color: Colors.yellow,
              width: double.maxFinite,
              height: 80,
              child: AppText(""),
            )),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: ExpenseAddPage.to,
        child: Icon(LucideIcons.plus),
      ),
      body: Padding(
        padding: top(),
        child: const GroupedExpensesList(),
      ),
    );
  }
}
