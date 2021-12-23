import '../source.dart';

class DayText extends StatefulWidget {
  const DayText(this.text,
      {required this.showTotalsCallback,
      required this.cancelCallback,
      required this.hasTotals,
      required this.day,
      required this.isSelected,
      Key? key})
      : super(key: key);

  final String text;
  final ValueChanged<int> showTotalsCallback, cancelCallback;
  final bool isSelected, hasTotals;
  final int day;

  @override
  _DayTextState createState() => _DayTextState();
}

class _DayTextState extends State<DayText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.dw, bottom: 5.dh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(widget.text, color: AppColors.textColor2, size: 18.dw),
          _buildActionButtons(),
        ],
      ),
    );
  }

  _buildActionButtons() {
    return widget.isSelected
        ? Container(
            margin: EdgeInsets.only(top: 8.dw),
            width: ScreenSizeConfig.getDeviceSize.width - 30.dw,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildTextButton('${widget.hasTotals ? 'Hide' : 'Show'} totals',
                    isShowingTotals: true),
                _buildTextButton('Close')
              ],
            ),
          )
        : Container();
  }

  _buildTextButton(
    String text, {
    bool isShowingTotals = false,
  }) {
    return AppTextButton(
        text: text,
        borderColor: Colors.transparent,
        textColor: AppColors.primaryColor,
        margin: EdgeInsets.only(left: 8.dw),
        useButtonSizeOnly: false,
        onPressed: isShowingTotals
            ? () => widget.showTotalsCallback(widget.day)
            : () => widget.cancelCallback(-1));
  }
}
