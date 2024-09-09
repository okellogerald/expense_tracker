import '../../../features/expenses/manager.dart';

import 'expense_tile.dart';
import '../../common_imports.dart';

class ExpensesGroupCard extends ConsumerStatefulWidget {
  final DatedExpense data;
  const ExpensesGroupCard(this.data, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ExpensesGroupCardState();
}

class _ExpensesGroupCardState extends ConsumerState<ExpensesGroupCard> {
  @override
  Widget build(BuildContext context) {
    final expenses = widget.data.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: kHorPadding,
          child: AppText.titleMedium(
            context,
            widget.data.key.format(),
          ),
        ),
        ListView.separated(
          itemCount: expenses.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, i) => ExpenseTile(expenses[i]),
          separatorBuilder: (_, i) => vSpace(2),
        ),
      ],
    );
  }
}
