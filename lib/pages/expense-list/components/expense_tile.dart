import 'package:expense_tracker_v2/models/realm/expense.category.dart';

import '../../common_imports.dart';

class ExpenseTile extends StatelessWidget {
  final Expense expense;
  const ExpenseTile(this.expense, {super.key});

  int get icon {
    if (category?.icon != null) return category!.icon!;
    return LucideIcons.hash.codePoint;
  }

  ExpenseCategory? get category {
    return expense.category;
  }

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      onPressed: () {},
      style: AppButtonStyle.transparent(
        foregroundColor: context.colorScheme.onSurface,
      ),
      child: Row(
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
                  AppText.bodyMedium(
                    context,
                    category!.name,
                    color: context.colorScheme.onSurface,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
            ],
          )),
          AmountText(expense.amount),
        ],
      ),
    );
  }
}
