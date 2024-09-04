import 'package:expense_tracker_v2/features/manager.dart';

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
        title: const AppText("Tracker"),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              LucideIcons.settings,
              color: context.colorScheme.primary,
            ),
          ),
        ],
        bottom: PreferredSize(
            preferredSize: const Size(double.maxFinite, 90),
            child: Container(
              color: context.colorScheme.surface,
              width: double.maxFinite,
              height: 80,
              child: Row(
                children: [
                  buildBalance("Income", 30000),
                  StreamBuilder<num>(
                    stream:
                        ref.read(expensesManagerProvider).expensesTotalsStream,
                    builder: (context, snapshot) {
                      return buildBalance(
                          "Expenses", snapshot.data?.toDouble() ?? 0);
                    },
                  ),
                  buildBalance("Balance", 30000),
                ],
              ),
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

  Widget buildBalance(String text, double amount) {
    final isOutflow = text == 'Expenses' || amount.isNegative;

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            // color: context.colorScheme.secondary,
            // borderRadius: ,
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text,
            ),
            const SizedBox(height: 5),
            AmountText(
              amount,
              color: !isOutflow ? AppColors.POSITIVE : AppColors.NEGATIVE,
            )
          ],
        ),
      ),
    );
  }
}
