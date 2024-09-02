import 'package:expense_tracker_v2/features/manager.dart';

import 'components/expense_group_card.dart';
import '../common_imports.dart';

class GroupedExpensesList extends ConsumerStatefulWidget {
  const GroupedExpensesList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends ConsumerState<GroupedExpensesList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DatedExpenses>>(
        stream: ref.read(expensesManagerProvider).expensesStream,
        builder: (context, snapshot) {
          final data = snapshot.data ?? [];
          return ListView.separated(
            itemCount: data.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, i) => ExpensesGroupCard(data[i]),
            separatorBuilder: (_, i) => vSpace(2),
          );
        });
  }
}
