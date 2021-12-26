import '../source.dart';

class OptionCircle extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white.withOpacity(.0),
        child: Row(children: [
          isSelected
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white70),
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(3.dw),
                  child: _buildCircle(isSelected
                      ? AppColors.accentColor
                      : AppColors.textColor2))
              : Container(),
          SizedBox(width: !isSelected ? 0 : 10.dw),
          AppText(
            option,
            size: 15.dw,
            isBolded: true,
            family: kFontFam2,
            color: isSelected ? AppColors.accentColor : AppColors.textColor2,
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
