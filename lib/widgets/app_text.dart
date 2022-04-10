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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0.dw),
      child: Text(widget.data,
          textAlign: widget.alignment,
          maxLines: widget.maxLines ?? 10,
          style: TextStyle(
              fontWeight: widget.isBolded ? FontWeight.w700 : FontWeight.w300,
              fontSize: widget.size ?? 20.dw,
              color: widget.color ?? AppColors.onBackground,
              fontFamily: widget.family,
              height: widget.height,
              letterSpacing: widget.letterSpacing,
              overflow: TextOverflow.ellipsis)),
    );
  }
}
