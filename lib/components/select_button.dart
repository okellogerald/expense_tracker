import '_common_imports.dart';

class AppSelectButton<T> extends StatelessWidget {
  final T? value;
  final String Function(T value) label;
  final String placeholder;
  final VoidCallback onPress;
  final String title;

  const AppSelectButton(
    this.value, {
    required this.label,
    required this.title,
    this.placeholder = "Click here to select",
    required this.onPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppLabel(title),
        AppTextButton(
          onPressed: onPress,
          style: AppButtonStyle.filled(
            backgroundColor: context.colorScheme.secondaryContainer,
            foregroundColor: context.colorScheme.onSecondaryContainer,
          ),
          child: AppText(value != null ? label(value as T) : placeholder),
        ),
      ],
    );
  }
}
