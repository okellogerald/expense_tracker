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
  final ValueChanged<String> onTap, deleteCallback, cancelCallback;

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
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(.0),
            border: Border(
              top: widget.isSelected ? _selectedBorder : _unSelectedBorder,
              bottom: widget.isSelected ? _selectedBorder : _unSelectedBorder,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(record.category.getIcon,
                        color: Colors.white70, size: 18.dw),
                    SizedBox(width: 10.dw),
                    AppText(
                      category.title,
                      family: kFontFam2,
                      size: 16.dw,
                      color: AppColors.textColor2,
                    )
                  ],
                ),
                AppText(
                  record.getAmount,
                  family: kFontFam2,
                  size: 16.dw,
                  color: category.type == kIncome
                      ? AppColors.positive
                      : AppColors.negative,
                )
              ],
            ),
            _buildNotes(),
            _buildDate(),
            _buildActionButtons(),
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
              color: AppColors.textColor3,
              size: 16.dw,
              family: kFontFam4,
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
            child: AppText(
              'Created at $strHour : $strMinutes $time.',
              color: AppColors.textColor3,
              size: 14.dw,
              family: kFontFam4,
            ),
          )
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
    return AppTextButton(
        text: text,
        margin: EdgeInsets.only(left: isChangingNotesVisibility ? 0 : 20.dw),
        borderColor: Colors.transparent,
        textColor: AppColors.primaryColor,
        useButtonSizeOnly: false,
        onPressed: isEditing
            ? () => widget.editCallback()
            : isDeleting
                ? () => widget.deleteCallback(widget.record.id)
                : isChangingNotesVisibility
                    ? _changeNotesVisibility
                    : () => widget.cancelCallback('-1'));
  }

  _onTap() {
    setState(() {
      isShowingMore = false;
    });
    widget.onTap(widget.record.id);
  }

  void _changeNotesVisibility() {
    setState(() {
      isShowingMore = !isShowingMore;
    });
  }

  static const _selectedBorder = BorderSide(width: 1.0, color: Colors.white54);
  static const _unSelectedBorder =
      BorderSide(width: 0.0, color: Colors.transparent);
}
