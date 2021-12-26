import '../source.dart';

class AppText extends StatefulWidget {
  const AppText(this.data,
      {this.size,
      this.family,
      this.color,
      this.alignment = TextAlign.justify,
      this.isBolded = false,
      this.maxLines,
      this.height,
      this.letterSpacing,
      key})
      : super(key: key);

  final double? size;
  final int? maxLines;
  final bool isBolded;
  final String data;
  final String? family;
  final Color? color;
  final TextAlign alignment;
  final double? height, letterSpacing;

  @override
  State<AppText> createState() => _AppTextState();
}

class _AppTextState extends State<AppText> {
  
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
    
    return Padding(
      padding: EdgeInsets.only(top: 0.dw),
      child: Text(widget.data,
          textAlign: widget.alignment,
          maxLines: widget.maxLines ?? 10,
          style: TextStyle(
              fontWeight: widget.isBolded ? FontWeight.w600 : FontWeight.w400,
              fontSize: widget.size ?? 20.dw,
              color: widget.color ?? appColors.textColor,
              fontFamily: widget.family,
              height: widget.height,
              letterSpacing: widget.letterSpacing,
              overflow: TextOverflow.ellipsis)),
    );
  }
}
