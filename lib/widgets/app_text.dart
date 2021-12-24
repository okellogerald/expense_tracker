import '../source.dart';

class AppText extends StatelessWidget {
  const AppText(this.data,
      {this.weight = FontWeight.w400,
      this.size,
      this.family,
      this.color = AppColors.textColor,
      this.alignment = TextAlign.justify,
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
  final Color color;
  final TextAlign alignment;
  final double? height, letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0.dw),
      child: Text(data,
          textAlign: alignment,
          maxLines: maxLines,
          style: TextStyle(
              fontWeight: weight,
              fontSize: size ?? 20.dw,
              color: color,
              fontFamily: family,
              height: height,
              letterSpacing: letterSpacing,
              overflow: TextOverflow.ellipsis)),
    );
  }
}
