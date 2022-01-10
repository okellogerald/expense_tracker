import '../source.dart';

class BudgetTile extends StatefulWidget {
  const BudgetTile(
      {required this.budget,
      required this.selectedId,
      required this.updateIdCallback,
      required this.deleteCallback,
      required this.editCallback,
      Key? key})
      : super(key: key);

  final Budget budget;
  final String selectedId;
  final ValueChanged<String> updateIdCallback, deleteCallback;
  final void Function(Budget) editCallback;

  @override
  _BudgetTileState createState() => _BudgetTileState();
}

class _BudgetTileState extends State<BudgetTile> {
  static var themeProvider = ThemeProvider();
  static var appColors = AppColors('Light');

  @override
  void didChangeDependencies() {
    themeProvider = Provider.of<ThemeProvider>(context);
    appColors = AppColors(themeProvider.getCurrentTheme);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final budget = widget.budget;

    return GestureDetector(
      onTap: () => widget.updateIdCallback(widget.budget.id),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(.0),
            border: Border(
                bottom: BorderSide(
                    width: 1.5,
                    color: appColors.dividerColor.withOpacity(.5)))),
        padding:
            EdgeInsets.only(left: 15.dw, bottom: 5.dh, right: 15.dw, top: 5.dh),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            _buildBudgetAmounts(
                'Budget', budget.getAmount, appColors.textColor),
            _buildBudgetAmounts(
                'Used', budget.getUsed, appColors.negativeColor),
            _buildBudgetAmounts(
              'Balance',
              budget.getBalance,
              appColors.positiveColor,
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
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 5.dw),
              child: Icon(
                AppIcons.getIcon(category.codePoint),
                color: appColors.iconColor,
                size: 20.dw,
              ),
            ),
            SizedBox(width: 15.dw),
            AppText(
              widget.budget.category.title.toUpperCase(),
              size: 15.dw,
              color: appColors.textColor2,
              isBolded: true,
            ),
          ],
        ),
        isSelected
            ? Container()
            : AppIconButton(
                onPressed: () => widget.updateIdCallback(budget.id),
                icon: Icons.more_horiz,
                iconColor: appColors.iconColor,
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
            decoration: BoxDecoration(
                border: Border(
                    top:
                        BorderSide(width: 1.5, color: appColors.dividerColor))),
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
        textColor: appColors.primaryColor,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 200.dw,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  title,
                  size: 15.dw,
                  color: appColors.textColor2,
                ),
                AppText(
                  isBalance ? '$balancePercent %' : '',
                  size: 16.dw,
                  color: color,
                  family: kFontFam2,
                ),
              ],
            ),
          ),
          AppText(
            amount,
            size: 16.dw,
            color: color,
            family: kFontFam2,
          )
        ],
      ),
    );
  }
}
