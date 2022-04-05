import '../source.dart';

class RecordTile extends StatefulWidget {
  const RecordTile(this.record,
      {required this.cancelCallback,
      required this.onTap,
      required this.deleteCallback,
      required this.editCallback,
      required this.isSelected,
      Key? key})
      : super(key: key);

  final Record record;
  final bool isSelected;
  final VoidCallback editCallback;
  final ValueChanged<String> onTap, cancelCallback;
  final void Function(String, double) deleteCallback;

  @override
  _RecordTileState createState() => _RecordTileState();
}

class _RecordTileState extends State<RecordTile> {
  bool isShowingMore = false;

  @override
  Widget build(BuildContext context) {
    final record = widget.record;
    final category = record.category;

    return GestureDetector(
      onTap: _onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7.5.dh, horizontal: 15.dw),
        width: ScreenSizeConfig.getFullWidth,
        decoration: BoxDecoration(
            border: Border(
          top: widget.isSelected ? selectedBorder : unSelectedBorder,
          bottom: widget.isSelected ? selectedBorder : unSelectedBorder,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                  child: Row(children: [
                Icon(record.category.getIcon,
                    color: AppColors.onBackground, size: 18.dw),
                SizedBox(width: 20.dw),
                Expanded(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(right: 15.dw),
                        child: AppText(category.title,
                            size: 14.dw,
                            color: AppColors.onBackground2,
                            maxLines: 2)))
              ])),
              AppText(record.getAmount,
                  size: 14.dw,
                  isBolded: true,
                  family: kFontFam2,
                  color: category.type == kIncome
                      ? AppColors.positive
                      : AppColors.negative)
            ]),
            _buildNotes(),
            _buildDate(),
            _buildActionButtons()
          ],
        ),
      ),
    );
  }

  _buildNotes() {
    return isShowingMore && widget.isSelected && widget.record.notes.isNotEmpty
        ? Padding(
            padding: EdgeInsets.only(top: 8.dh),
            child: AppText(
              widget.record.notes,
              color: AppColors.onBackground3,
              size: 14.dw,
            ),
          )
        : Container();
  }

  _buildDate() {
    final date = widget.record.date;
    final hour = date.hour;
    final minutes = date.minute;
    final hasNoNotes = widget.record.notes.isEmpty;
    final time = hour > 0 && hour < 12
        ? 'am'
        : hour == 0 && minutes == 0 || hour == 12 && minutes == 0
            ? ''
            : hour == 0 && minutes > 0
                ? 'am'
                : 'pm';
    final strHour = hour.toString().length == 1 ? '0$hour' : hour;
    final strMinutes = minutes.toString().length == 1 ? '0$minutes' : minutes;

    return isShowingMore && widget.isSelected
        ? Padding(
            padding: EdgeInsets.only(top: hasNoNotes ? 10.dh : 5.dh),
            child: AppText('Created at $strHour : $strMinutes $time.',
                color: AppColors.onBackground3, size: 14.dw))
        : Container();
  }

  _buildActionButtons() {
    return widget.isSelected
        ? Padding(
            padding: EdgeInsets.only(top: 10.dw),
            child: Row(
              children: [
                _buildTextButton(isShowingMore ? 'Less' : 'More',
                    isChangingNotesVisibility: true),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildTextButton('Edit', isEditing: true),
                      _buildTextButton('Delete', isDeleting: true),
                      _buildTextButton('Close')
                    ],
                  ),
                ),
              ],
            ),
          )
        : Container();
  }

  _buildTextButton(String text,
      {bool isEditing = false,
      bool isDeleting = false,
      bool isChangingNotesVisibility = false}) {
    final record = widget.record;
    return AppTextButton(
        text: text,
        margin: EdgeInsets.only(left: isChangingNotesVisibility ? 0 : 20.dw),
        borderColor: Colors.transparent,
        textColor: AppColors.primary,
        onPressed: isEditing
            ? () => widget.editCallback()
            : isDeleting
                ? () => widget.deleteCallback(record.id, record.amount)
                : isChangingNotesVisibility
                    ? _changeNotesVisibility
                    : () => widget.cancelCallback('-1'));
  }

  _onTap() {
    isShowingMore = false;
    setState(() {});
    widget.onTap(widget.record.id);
  }

  void _changeNotesVisibility() {
    isShowingMore = !isShowingMore;
    setState(() {});
  }
}
