import '_common_imports.dart';

class AppSelectTile<T> extends StatelessWidget {
  final T value;
  final ValueChanged<T>? onSelect;
  final String Function(T) label;
  final bool Function(T)? selected;

  const AppSelectTile({
    super.key,
    required this.label,
    required this.value,
    this.selected,
    this.onSelect,
  });

  bool get isSelected {
    if (selected == null) return false;
    return selected!.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: isSelected
          ? context.colorScheme.secondaryContainer
          : context.colorScheme.surfaceBright,
      title: AppText.bodyMedium(
        context,
        label(value),
        color: isSelected
            ? context.colorScheme.onSecondaryContainer
            : context.colorScheme.onSurface,
        weight: isSelected ? FontWeight.bold : null,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius3),
      ),
      onTap: () => onSelect?.call(value),
      trailing: isSelected
          ? Checkbox.adaptive(
              value: isSelected,
              activeColor: context.colorScheme.secondaryContainer,
              checkColor: context.colorScheme.onSecondaryContainer,
              onChanged: (_) {},
            )
          : null,
    );
  }
}
