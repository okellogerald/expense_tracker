import '../common_imports.dart';
import 'tab.expense.dart';
import 'tab.future_expense.dart';

class ExpenseAddPage extends ConsumerStatefulWidget {
  const ExpenseAddPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();

  static const routeName = "/expense-add";

  static void to() => router.push(routeName);

  static void pop() => router.pop();

  static Widget builder(BuildContext c, GoRouterState state) {
    return const ExpenseAddPage();
  }
}

class _State extends ConsumerState<ExpenseAddPage>
    with SingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText("Add Expense"),
      ),
      body: Column(
        children: [
          TabBar.secondary(
            controller: controller,
            tabs: const [
              Tab(
                text: "Now",
              ),
              Tab(
                text: "Future",
              )
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: const [
                ExpenseAddTab(),
                FutureExpenseAddTab(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
