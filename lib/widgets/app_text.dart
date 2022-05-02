import '../source.dart';

class AppText extends StatefulWidget {
  const AppText(this.data,
      {this.size,
      this.family,
      this.color,
      this.alignment = TextAlign.justify,
      this.weight = FontWeight.w300,
      this.maxLines,
      this.height,
      this.letterSpacing,
      key})
      : super(key: key);

  final double? size;
  final int? maxLines;
  final FontWeight weight;
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
              fontWeight: widget.weight,
              fontSize: widget.size ?? 20.dw,
              color: widget.color ?? AppColors.onBackground,
              fontFamily: widget.family,
              height: widget.height,
              letterSpacing: widget.letterSpacing,
              overflow: TextOverflow.ellipsis)),
    );
  }
}
