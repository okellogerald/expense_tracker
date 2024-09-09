import 'package:expense_tracker_v2/pages/reports/page.dart';

import '/pages/expense-add/page.dart';

import '../common_imports.dart';
import '../expense-list/list.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText("Tracker"),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: ReportsPage.to,
            icon: Icon(
              LucideIcons.barChart,
              color: context.colorScheme.primary,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              LucideIcons.settings,
              color: context.colorScheme.primary,
            ),
          ),
        ],
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(
              text: "Paid",
            ),
            Tab(
              text: "Planned",
            ),
          ],
        ),
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
