import '../source.dart';

class AppTextButton extends StatefulWidget {
  const AppTextButton(
      {this.buttonColor = Colors.transparent,
      this.highlightColor = AppColors.highlightColor,
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
      this.child,
      this.useButtonSizeOnly = true,
      this.isBolded = false,
      this.withIcon = false,
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
  final bool isBolded, withIcon, useButtonSizeOnly;
  final Widget? child;

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
              width: widget.width,
              margin: widget.margin ?? EdgeInsets.zero,
              padding: widget.padding ?? EdgeInsets.zero,
              color: widget.useButtonSizeOnly
                  ? animation.value
                  : Colors.transparent,
              alignment: Alignment.center,
              child: CustomPaint(
                child: child,
                painter: RectTappedRippleEffectPainter(
                    animation.value, widget.useButtonSizeOnly),
              )),
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
                    color: widget.iconColor ?? AppColors.secondaryColor,
                    size: 22.dw),
                SizedBox(width: 15.dw),
                _text(),
              ])
            : _text();
  }

  _text() {
    return AppText(widget.text ?? 'Click Me',
        size: (widget.fontSize ?? 14).dw,
        weight: widget.isBolded ? FontWeight.w600 : FontWeight.w400,
        color: widget.textColor ?? AppColors.textColor);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class RectTappedRippleEffectPainter extends CustomPainter {
  final Color? highlightColor;
  final bool useButtonSizeOnly;
  RectTappedRippleEffectPainter(this.highlightColor, this.useButtonSizeOnly);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final rect = Rect.fromCenter(
        center: center,
        width: size.width * (useButtonSizeOnly ? 0 : 1.45),
        height: size.height * (useButtonSizeOnly ? 0 : 1.25));
    final paint = Paint()..color = highlightColor ?? Colors.transparent;
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
