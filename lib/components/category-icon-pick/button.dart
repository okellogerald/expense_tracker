import 'package:expense_tracker_v2/components/category-icon-pick/page.dart';

import '../_common_imports.dart';

class CategoryIconPickButton extends StatefulWidget {
  final IconData? icon;
  final ValueChanged<IconData>? onChange;
  final String? label;

  const CategoryIconPickButton({
    super.key,
    this.icon,
    this.onChange,
    this.label,
  });

  IconData get defaultIcon {
    return icon ?? LucideIcons.hash;
  }

  @override
  State<CategoryIconPickButton> createState() => _CategoryIconPickButtonState();
}

class _CategoryIconPickButtonState extends State<CategoryIconPickButton> {
  IconData? selectedIcon;

  @override
  void initState() {
    super.initState();

    selectedIcon = widget.defaultIcon;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppLabel(
          widget.label ?? "Expense Icon",
          bottomSpacing: 0,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              child: Icon(selectedIcon),
            ),
            hSpace(5),
            IconButton(
              onPressed: _onPress,
              icon: const Icon(LucideIcons.chevronRight),
            )
          ],
        ),
      ],
    );
  }

  void _onPress() async {
    final icon = await ExpenseCategoryIconSelectPage.to(selectedIcon);
    if (icon != null) {
      setState(() {
        selectedIcon = icon;
        widget.onChange?.call(icon);
      });
    }
  }
}
