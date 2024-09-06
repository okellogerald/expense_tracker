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
      tileColor: context.colorScheme.surfaceBright,
      title: AppText(label(value)),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius3)),
      onTap: () => onSelect?.call(value),
      trailing: isSelected
          ? Checkbox.adaptive(
              value: isSelected,
              onChanged: (_) {},
            )
          : null,
    );
  }
}
