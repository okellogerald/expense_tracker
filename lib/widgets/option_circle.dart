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
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        color: Colors.white.withOpacity(.0),
        child: Row(children: [
          widget.isSelected
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: appColors.iconColor),
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(3.dw),
                  child: _buildCircle(
                    widget.isSelected
                        ? AppColors.accentColor
                        : Colors.grey,
                  ))
              : Container(),
          SizedBox(width: !widget.isSelected ? 0 : 10.dw),
          AppText(
            widget.option,
            size: 15.dw,
            isBolded: true,
            family: kFontFam2,
            color: widget.isSelected
                ? AppColors.accentColor
                : appColors.textColor2,
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
