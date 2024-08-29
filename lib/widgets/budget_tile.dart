import '../source.dart';

class BudgetTile extends StatefulWidget {
  const BudgetTile(
      {required this.budget,
      required this.selectedId,
      required this.updateIdCallback,
      required this.deleteCallback,
      required this.editCallback,
      super.key});

  final Budget budget;
  final String selectedId;
  final ValueChanged<String> updateIdCallback, deleteCallback;
  final void Function(Budget) editCallback;

  @override
  State<BudgetTile> createState() => _BudgetTileState();
}

class _BudgetTileState extends State<BudgetTile> {
  @override
  Widget build(BuildContext context) {
    final budget = widget.budget;

    return GestureDetector(
      onTap: () => widget.updateIdCallback(widget.budget.id),
      child: Container(
        padding:
            EdgeInsets.only(left: 15.dw, bottom: 5.dh, right: 15.dw, top: 5.dh),
        width: ScreenSizeConfig.getFullWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            _buildBudgetAmounts(
                'Budget', budget.getAmount, AppColors.onBackground2),
            _buildBudgetAmounts('Used', budget.getUsed, AppColors.negative),
            _buildBudgetAmounts(
              'Balance',
              budget.getBalance,
              AppColors.positive,
              balancePercent: budget.getBalanceAsPercentage,
            ),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  _buildTitle() {
    final budget = widget.budget;
    final category = budget.category;
    final isSelected = budget.id == widget.selectedId;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Row(children: [
          Icon(AppIcons.getIcon(category.codePoint),
              color: AppColors.onBackground, size: 18.dw),
          SizedBox(width: 15.dw),
          Expanded(
              child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(right: 15.dw),
                  child: AppText(widget.budget.category.title.toUpperCase(),
                      size: 14.dw, color: AppColors.onBackground, maxLines: 2)))
        ])),
        isSelected
            ? Container()
            : AppIconButton(
                onPressed: () => widget.updateIdCallback(budget.id),
                icon: Icons.more_horiz,
                iconColor: AppColors.onBackground,
                spreadRadius: 25.dw,
              )
      ],
    );
  }

  _buildActionButtons() {
    final isTapped = widget.budget.id == widget.selectedId;

    return isTapped
        ? Container(
            margin: EdgeInsets.only(top: 10.dw),
            padding: EdgeInsets.only(top: 5.dh),
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(width: 1.5, color: AppColors.divider))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildTextButton('Edit', isEditing: true),
                _buildTextButton('Delete', isDeleting: true),
                _buildTextButton('Close')
              ],
            ),
          )
        : Container();
  }

  _buildTextButton(String text,
      {bool isEditing = false,
      bool isDeleting = false,
      bool isChangingNotesVisibility = false}) {
    return AppTextButton(
        text: text,
        margin: EdgeInsets.only(left: isChangingNotesVisibility ? 0 : 20.dw),
        borderColor: Colors.transparent,
        textColor: AppColors.primary,
        onPressed: isEditing
            ? () => widget.editCallback(widget.budget)
            : isDeleting
                ? () => widget.deleteCallback(widget.budget.id)
                : () => widget.updateIdCallback('-1'));
  }

  _buildBudgetAmounts(String title, String amount, Color color,
      {String balancePercent = ''}) {
    final isBalance = balancePercent.trim().isNotEmpty;
    return Padding(
        padding: EdgeInsets.only(top: 4.dh),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
              width: 220.dw,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(title, size: 14.dw, color: AppColors.onBackground2),
                    AppText(isBalance ? '$balancePercent %' : '',
                        size: 13.dw, color: color, family: kFontFam2)
                  ])),
          AppText(amount, size: 13.dw, color: color, family: kFontFam2)
        ]));
  }
}
