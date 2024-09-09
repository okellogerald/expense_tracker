import 'package:expense_tracker_v2/features/delete_manager.dart';
import 'package:expense_tracker_v2/pages/expense-edit/page.dart';

import '/models/realm/expense.category.dart';

import '../../common_imports.dart';

final _selectedExpenseProvider = StateProvider<Expense?>((_) => null);

class ExpenseTile extends ConsumerStatefulWidget {
  final Expense expense;
  const ExpenseTile(this.expense, {super.key});

  @override
  ConsumerState<ExpenseTile> createState() => _State();
}

class _State extends ConsumerState<ExpenseTile> {
  int get icon {
    if (category?.icon != null) return category!.icon!;
    return LucideIcons.hash.codePoint;
  }

  Expense get expense {
    return widget.expense;
  }

  ExpenseCategory? get category {
    return widget.expense.category;
  }

  void selectExpense() {
    ref.read(_selectedExpenseProvider.notifier).state = widget.expense;
  }

  void unselectExpense() {
    ref.read(_selectedExpenseProvider.notifier).state = null;
  }

  void editExpense() async {
    await ExpenseEditPage.to(expense);
    unselectExpense();
  }

  void deleteExpense() async {
    ref.read(deleteManagerProvider).deleteExpense(expense);
    unselectExpense();
  }

  @override
  Widget build(BuildContext context) {
    final selectedExp = ref.watch(_selectedExpenseProvider);
    final selected = selectedExp?.id == widget.expense.id;

    return selected ? selectedWidget() : unselectedWidget();
  }

  Widget unselectedWidget() {
    return AppTextButton(
      onPressed: selectExpense,
      style: AppButtonStyle.transparent(
        foregroundColor: context.colorScheme.onSurface,
      ),
      child: firstRow(),
    );
  }

  Widget firstRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Row(
          children: [
            Padding(
              padding: right(10),
              child: AppLucideIconAvatar(icon),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (expense.title == null)
                  AppText.bodyMedium(
                    context,
                    category!.name,
                    color: context.colorScheme.onSurface,
                    weight: FontWeight.bold,
                  ),
              ],
            ),
            if (expense.title != null)
              AppText.bodyMedium(
                context,
                expense.title!,
                color: context.colorScheme.onSurface,
                weight: FontWeight.bold,
              ),
          ],
        )),
        AmountText(widget.expense.amount),
      ],
    );
  }

  Widget selectedWidget() {
    return AppTextButton(
      onPressed: unselectExpense,
      style: AppButtonStyle.outline(
          foregroundColor: context.colorScheme.secondaryContainer,
          borderColor: context.colorScheme.surface,
          borderRadius: kBorderRadius3,
          padding: all()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          firstRow(),
          if (expense.notes != null)
            Padding(
              padding: top(10),
              child: AppText.bodyMedium(
                context,
                expense.notes!,
                color: context.colorScheme.text2,
              ),
            ),
          OverflowBar(
            alignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: editExpense,
                color: context.colorScheme.primary,
                icon: const Icon(LucideIcons.edit),
              ),
              IconButton(
                icon: const Icon(LucideIcons.trash),
                color: context.colorScheme.error,
                onPressed: deleteExpense,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
