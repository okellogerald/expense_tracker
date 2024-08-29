import '../source.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key, this.height, this.margin, this.color, this.width});

  factory AppDivider.withVerticalMargin(value) =>
      AppDivider(margin: EdgeInsets.symmetric(vertical: value));

  AppDivider.onDocumentPage({super.key})
      : height = null,
        width = null,
        margin = EdgeInsets.zero,
        color = AppColors.divider.withOpacity(.35);

  final double? height, width;
  final EdgeInsets? margin;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 1,
      width: width,
      margin: margin ?? EdgeInsets.symmetric(vertical: 5.dh),
      color: color ?? AppColors.divider,
    );
  }
}
