import 'package:expense_tracker_v2/features/expenses/manager.dart';

import '../common_imports.dart';

class ReportsPage extends ConsumerStatefulWidget {
  const ReportsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();

  static const routeName = "/reports";

  static Future to() => router.push(routeName);

  static void pop() => router.pop();

  static Widget builder(BuildContext c, GoRouterState state) {
    return const ReportsPage();
  }
}

class _State extends ConsumerState<ReportsPage> with AfterLayoutMixin {
  num expensesTotal = 0;

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    expensesTotal = ref.read(expensesManagerProvider).expensesTotal;
    updateTotal(expensesTotal);

    ref.read(expensesManagerProvider).expenseTotalStream.listen(updateTotal);
  }

  void updateTotal(num value) {
    setState(() => expensesTotal = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppText("Reports"),),
      body: ListView(
        children: [
          ListTile(
            title: const AppText("Expenses"),
            trailing: AppText(expensesTotal.format()),
          ),
        ],
      ),
    );
  }
}
