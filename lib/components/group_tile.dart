import 'package:expense_tracker_v2/pages/common_imports.dart';

import '/models/source.dart';

import '_common_imports.dart';

class GroupTile extends StatelessWidget {
  final ExpenseGroup group;
  final double? amount;
  const GroupTile(this.group, {this.amount, super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      onPressed: () {},
      style: AppButtonStyle.transparent(
        foregroundColor: context.colorScheme.onSurface,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(group.name),
                if (group.notes != null)
                  AppText.bodyMedium(
                    context,
                    group.notes ?? "",
                    color: context.colorScheme.surface,
                  ),
              ],
            ),
          ),
          if (amount != null) AmountText(amount!),
        ],
      ),
    );
  }
}
