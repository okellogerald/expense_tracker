import 'package:expense_tracker_v2/constants/themes/color_scheme.dart';
import 'package:expense_tracker_v2/pages/expense-category-select/page.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../_common_imports.dart';

class CategoryIconPickButton extends StatefulWidget {
  final IconData? icon;
  final String placeholderText;

  final ValueChanged<IconData>? onChange;

  const CategoryIconPickButton({
    super.key,
    this.icon,
    this.onChange,
    this.placeholderText = "Select category icon",
  });

  @override
  State<CategoryIconPickButton> createState() => _CategoryIconPickButtonState();
}

class _CategoryIconPickButtonState extends State<CategoryIconPickButton> {
  IconData? selectedIcon;

  @override
  void initState() {
    super.initState();

    selectedIcon = widget.icon;
  }

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      onPressed: _onPress,
      style: AppButtonStyle.outline(
        width: double.maxFinite,
        borderRadius: kBorderRadius3,
        foregroundColor: getTemboColorScheme().onBackground,
        borderColor: context.colorScheme.surface,
      ),
      child: _child(),
    );
  }

  Widget _child() {
    if (selectedIcon == null) {
      return AppText(widget.placeholderText);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const AppText("Icon"),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              selectedIcon,
              size: 24,
              color: context.colorScheme.secondary,
            ),
            hSpace(5),
            const Icon(LucideIcons.chevronRight)
          ],
        ),
      ],
    );
  }

  void _onPress() async {
    final icon = await ExpenseCategorySelect.to(selectedIcon);
    if (icon != null) {
      setState(() {
        selectedIcon = icon;
        widget.onChange?.call(icon);
      });
    }
  }
}
