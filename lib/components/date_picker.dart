import 'package:flutter/foundation.dart';

import '../constants/themes/color_scheme.dart';
import '_common_imports.dart';

class TemboDatePicker extends StatefulWidget {
  final DateTime date;
  final String Function(DateTime date)? label;
  final ValueChanged<DateTime> onSelected;
  final AppButtonStyle? style;
  final Widget Function(DateTime date, String lbl)? child;

  final bool enabled;

  String get lbl {
    if (label != null) {
      return label!(date);
    }
    return date.format();
  }

  const TemboDatePicker({
    super.key,
    required this.date,
    this.style,
    this.child,
    this.label,
    required this.onSelected,
    this.enabled = true,
  });

  @override
  State<TemboDatePicker> createState() => _TemboDatePickerState();
}

class _TemboDatePickerState extends State<TemboDatePicker> {
  onSelected(DateTime date) => widget.onSelected(date);

  void showPicker() {
    final p = defaultTargetPlatform;
    if (p == TargetPlatform.iOS || p == TargetPlatform.macOS) {
      return showIOSPicker(context, onSelected);
    }
    if (widget.enabled) {
      return showAndroidPicker(context, onSelected);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = getTemboColorScheme();
    return AppTextButton(
      onPressed: showPicker,
      style: widget.style ??
          AppButtonStyle.outline(
            borderColor: cs.border,
            borderWidth: 1.5,
            foregroundColor: cs.onBackground,
            padding: horizontal() + vertical(12.5),
            borderRadius: kBorderRadius3,
            textStyle: context.textTheme.bodyMedium.bold,
          ),
      child: widget.child != null
          ? widget.child!(widget.date, widget.lbl)
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(widget.lbl),
                const SizedBox(width: 10),
                Icon(
                  LucideIcons.calendar,
                  color: context.colorScheme.onSurface,
                )
              ],
            ),
    );
  }

  void showAndroidPicker(
    BuildContext context,
    ValueChanged<DateTime> onSelected,
  ) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: widget.date,
      firstDate: DateTime.now().subtract(const Duration(days: 366)),
      lastDate: DateTime.now().add(const Duration(days: 366)),
    );

    if (selectedDate != null) onSelected(selectedDate);
  }

  void showIOSPicker(BuildContext context, ValueChanged<DateTime> onSelected) {
    showModalBottomSheet(
      context: context,
      constraints: const BoxConstraints.expand(height: 400),
      builder: (context) {
        return Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppText(
                    "Select Date",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const AppText(
                        "Done",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ))
                ],
              ),
            ),
            Expanded(
              child: CupertinoDatePicker(
                initialDateTime: widget.date,
                minimumDate: DateTime.now().subtract(const Duration(days: 366)),
                maximumDate: DateTime.now().add(const Duration(days: 366)),
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: onSelected,
              ),
            ),
          ],
        );
      },
    );
  }
}
