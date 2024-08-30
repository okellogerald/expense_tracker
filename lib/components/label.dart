import './_common_imports.dart';

class AppLabel extends StatelessWidget {
  final String label;
  final double? bottomSpacing;
  final TextStyle? style;

  const AppLabel(
    this.label, {
    this.bottomSpacing = 10.0,
    this.style,
    super.key,
  });

  static TextStyle getDefaultTextStyle(BuildContext c) {
    return c.textTheme.bodyMedium.withFW500.withColor(c.colorScheme.onSurface);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: bottom(bottomSpacing),
      child: AppText(
        label,
        style: style ??
            context.textTheme.bodyMedium.withFW500.withColor(
              context.colorScheme.onSurface,
            ),
        maxLines: 1,
      ),
    );
  }
}
