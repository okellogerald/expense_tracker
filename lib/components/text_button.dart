import 'package:flutter/gestures.dart';

import '_common_imports.dart';

class AppTextButton extends StatefulWidget {
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;

  final Widget child;
  final AppButtonStyle? style;

  const AppTextButton({
    super.key,
    required this.onPressed,
    this.onLongPress,
    this.style,
    required this.child,
  });

  AppTextButton.text({
    super.key,
    required String text,
    required this.onPressed,
    this.onLongPress,
    this.style,
  }) : child = AppText.w500(text);

  @override
  State<AppTextButton> createState() => _AppTextButtonState();
}

class _AppTextButtonState extends State<AppTextButton> {
  AppButtonStyle get _style {
    var style = widget.style ?? const AppButtonStyle.filled();
    style = style.applyDefaultThemes(context);
    return style;
  }

  @override
  Widget build(BuildContext context) {
    final height = _style.height;
    final width = _style.width;

    if ((height != null && height <= 35) ||
        (width != null && width <= 35) ||
        _style.imageProvider != null) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: _onPressed,
          onLongPress: _onLongPress,
          child: Container(
            padding: _style.padding ?? kHorPadding,
            width: _style.width?.toDouble(),
            height: _style.height?.toDouble(),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _style.backgroundColor,
              borderRadius: BorderRadius.circular(
                _style.borderRadius?.toDouble() ?? kBorderRadius4,
              ),
              border: Border.all(
                color: _style.borderColor ?? Colors.transparent,
                width: _style.borderWidth?.toDouble() ?? 1,
              ),
              image: _style.imageProvider == null
                  ? null
                  : DecorationImage(
                      image: _style.imageProvider!,
                      fit: BoxFit.fill,
                    ),
            ),
            child: getChild(context),
          ),
        ),
      );
    }

    return TextButton(
      onPressed: _onPressed,
      onLongPress: _onLongPress,
      style: _style.buttonStyle,
      child: getChild(context),
    );
  }

  void _onPressed() {
    widget.onPressed();
  }

  void _onLongPress() {
    if (widget.onLongPress != null) widget.onLongPress!();
  }

  Widget getChild(BuildContext context) {
    return DefaultTextStyle(
      style: _style.getTextStyle ??
          TextStyle(
            color: _style.foregroundColor,
            fontWeight: FontWeight.w500,
          ),
      child: IconTheme(
        data: IconThemeData(color: _style.foregroundColor),
        child: widget.child,
      ),
    );
  }
}

class TemboPlainTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final TextStyle? style;

  final bool _decorated;

  const TemboPlainTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.style,
  }) : _decorated = false;

  const TemboPlainTextButton.decorated({
    super.key,
    required this.onPressed,
    required this.text,
    this.style,
  }) : _decorated = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: RichText(
        text: TextSpan(
          text: text,
          style: (style ?? context.textTheme.bodyMedium.bold).copyWith(
            decoration: _decorated ? TextDecoration.underline : null,
            decorationColor: _decorated ? context.colorScheme.primary : null,
          ),
          recognizer: TapGestureRecognizer()..onTap = onPressed,
        ),
      ),
    );
  }
}
