import '../source.dart';

class OptionCircle extends StatefulWidget {
  const OptionCircle(
      {required this.onTap,
      required this.isSelected,
      required this.option,
      Key? key})
      : super(key: key);

  final VoidCallback onTap;
  final bool isSelected;
  final String option;

  @override
  State<OptionCircle> createState() => _OptionCircleState();
}

class _OptionCircleState extends State<OptionCircle> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        color: Colors.white.withOpacity(.0),
        child: Row(children: [
          widget.isSelected
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.onBackground),
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(3.dw),
                  child: _buildCircle(
                    widget.isSelected ? AppColors.accent : Colors.grey,
                  ))
              : Container(),
          SizedBox(width: !widget.isSelected ? 0 : 10.dw),
          AppText(
            widget.option,
            size: 15.dw,
            isBolded: true,
            color:
                widget.isSelected ? AppColors.accent : AppColors.onBackground2,
          )
        ]),
      ),
    );
  }

  Widget _buildCircle(Color color) {
    return Container(
        height: 8.dw,
        width: 8.dw,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ));
  }
}
