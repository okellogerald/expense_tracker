import '_common_imports.dart';

class AppSelectButton<T> extends StatelessWidget {
  final T? value;
  final String Function(T value)? label;
  final Widget Function(T value)? child;
  final String placeholder;
  final VoidCallback onPress;
  final String title;

  const AppSelectButton(
    this.value, {
    this.label,
    this.child,
    required this.title,
    this.placeholder = "Click here to select",
    required this.onPress,
    super.key,
  }) /* : assert(label != null && child != null) */;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppLabel(title),
        Row(
          children: [
            AppTextButton(
              onPressed: onPress,
              style: AppButtonStyle.filled(
                backgroundColor: context.colorScheme.secondaryContainer,
                foregroundColor: context.colorScheme.onSecondaryContainer,
              ),
              child: value == null
                  ? AppText(placeholder)
                  : label != null
                      ? AppText(label!(value as T))
                      : child!(value as T),
            ),
            const Spacer(),
            if (value != null)
              IconButton(
                onPressed: onPress,
                icon: const Icon(LucideIcons.arrowRight),
              )
          ],
        ),
      ],
    );
  }
}
