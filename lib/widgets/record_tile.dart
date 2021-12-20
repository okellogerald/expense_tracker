import '../source.dart';

class RecordTile extends StatefulWidget {
  const RecordTile(this.record, {Key? key}) : super(key: key);

  final Record record;

  @override
  _RecordTileState createState() => _RecordTileState();
}

class _RecordTileState extends State<RecordTile> {
  @override
  Widget build(BuildContext context) {
    final record = widget.record;
    final category = record.category;

    return Padding(
      padding: EdgeInsets.only(bottom: 8.dh),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(record.category.getIcon, color: Colors.white70, size: 18.dw),
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
    );
  }
}
