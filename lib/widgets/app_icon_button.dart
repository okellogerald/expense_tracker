import '../source.dart';

class AppIconButton extends StatefulWidget {
  const AppIconButton(
      {this.icon,
      this.iconColor,
      this.height,
      this.width,
      this.margin,
      this.buttonColor,
      this.spreadRadius,
      this.iconSize,
      required this.onPressed,
      super.key});

  final IconData? icon;
  final Color? iconColor;
  final Color? buttonColor;
  final EdgeInsetsGeometry? margin;
  final double? spreadRadius, height, width;
  final double? iconSize;
  final VoidCallback onPressed;

  @override
  State<AppIconButton> createState() => _AppIconButtonState();
}

class _AppIconButtonState extends State<AppIconButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse().then((value) => widget.onPressed());
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        child: Icon(
          widget.icon ?? Icons.home,
          color: widget.iconColor ?? Colors.black,
          size: widget.iconSize,
        ),
        builder: (context, child) {
          final shouldHideRipple =
              controller.isCompleted || controller.isDismissed;

          return GestureDetector(
            onTap: () => controller.forward(),
            child: Container(
              margin: widget.margin,
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: controller.value == 0
                    ? widget.buttonColor
                    : Colors.transparent,
              ),
              child: CustomPaint(
                painter: TappedRippleEffectPainter(
                    shouldHideRipple ? 0 : widget.spreadRadius ?? 20.dw),
                child: child,
              ),
            ),
          );
        });
  }
}

class TappedRippleEffectPainter extends CustomPainter {
  final double radius;
  TappedRippleEffectPainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()..color = Colors.grey.withOpacity(.25);
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
