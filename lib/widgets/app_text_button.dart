import '../source.dart';

class AppTextButton extends StatefulWidget {
  const AppTextButton(
      {this.buttonColor = Colors.transparent,
      this.highlightColor = AppColors.highlight,
      this.textColor,
      this.borderColor,
      this.icon,
      this.iconColor,
      this.padding,
      this.margin,
      this.height,
      this.width,
      this.fontSize,
      this.text,
      this.alignment,
      this.child,
      this.isBolded = false,
      this.withIcon = false,
      this.useFullWidth = false,
      required this.onPressed,
      this.duration = const Duration(milliseconds: 200),
      this.borderRadius,
      Key? key})
      : super(key: key);

  final Color buttonColor;
  final Color highlightColor;
  final Color? textColor;
  final IconData? icon;
  final Color? iconColor;
  final double? height;
  final double? width;
  final VoidCallback onPressed;
  final Duration duration;
  final double? borderRadius;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final String? text;
  final double? fontSize;
  final bool isBolded, withIcon, useFullWidth;
  final Widget? child;
  final Alignment? alignment;

  @override
  _AppTextButtonState createState() => _AppTextButtonState();
}

class _AppTextButtonState extends State<AppTextButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<Color?> animation;

  @override
  void initState() {
    controller = AnimationController(
        duration: widget.duration,
        reverseDuration: const Duration(milliseconds: 0),
        vsync: this);
    animation =
        ColorTween(end: Colors.grey.withOpacity(.25), begin: widget.buttonColor)
            .animate(controller)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller.reverse();
              widget.onPressed();
            }
          });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: _child(),
      builder: (context, child) {
        return GestureDetector(
          onTap: () => controller.forward(),
          child: Container(
              height: widget.height,
              width: widget.useFullWidth
                  ? ScreenSizeConfig.getFullWidth
                  : widget.width,
              margin: widget.margin ?? EdgeInsets.zero,
              padding: widget.padding ?? EdgeInsets.zero,
              alignment: widget.alignment ?? Alignment.center,
              decoration: BoxDecoration(
                  color: animation.value,
                  border: Border.all(
                      color: widget.borderColor ?? Colors.transparent),
                  borderRadius: borderRadius),
              child: child),
        );
      },
    );
  }

  _child() {
    final hasProvidedChild = widget.child != null;

    return hasProvidedChild
        ? widget.child
        : widget.withIcon
            ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(widget.icon ?? Icons.share,
                    color: widget.iconColor ?? AppColors.secondary,
                    size: 22.dw),
                SizedBox(width: 15.dw),
                _text(),
              ])
            : _text();
  }

  _text() {
    return AppText(widget.text ?? 'Click Me',
        size: widget.fontSize ?? 15.dw,
        family: kFontFam2,
        isBolded: true,
        color: widget.textColor ?? AppColors.onPrimary);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
