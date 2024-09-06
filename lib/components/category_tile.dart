import 'package:expense_tracker_v2/models/realm/expense.category.dart';

import '_common_imports.dart';
import 'amount_text.dart';

class CategoryTile extends StatelessWidget {
  final ExpenseCategory category;
  const CategoryTile(this.category, {super.key});

  int get icon {
    if (category.icon != null) return category.icon!;
    return LucideIcons.hash.codePoint;
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
                  AppText(category.name),
                  if (category.group != null)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const AppText("in "),
                        AppText.bodyMedium(
                          context,
                          category.group!.name,
                          color: context.colorScheme.onSurface,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                ],
              ),
            ],
          )),
        ],
      ),
    );
  }
}

class AmountedCategoryTile extends StatelessWidget {
  final ExpenseCategory category;
  final double amount;
  const AmountedCategoryTile(this.category, this.amount, {super.key});

  int get icon {
    if (category.icon != null) return category.icon!;
    return LucideIcons.hash.codePoint;
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
                  AppText(category.name),
                  if (category.group != null)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const AppText("in "),
                        AppText.bodyMedium(
                          context,
                          category.group!.name,
                          color: context.colorScheme.onSurface,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                ],
              ),
            ],
          )),
          AmountText(
            amount,
            color: context.colorScheme.onSurface,
          ),
        ],
      ),
    );
  }
}
