import '_common_imports.dart';
import 'date_picker.dart';
import 'select_button.dart';

class SelectDateButton extends StatelessWidget {
  final DateTime? value;
  final String placeholder;
  final String title;
  final String format;
  final bool active;

  final ValueChanged<DateTime> onSelect;

  const SelectDateButton(
    this.value, {
    super.key,
    this.title = "Date",
    this.placeholder = "Click to select a date",
    this.format = 'dd/MM/yyyy',
    required this.onSelect,
    this.active = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppSelectButton(
      value,
      label: (e) => e.format(format),
      title: title,
      onPress: () => selectDate(context),
      active: active,
    );
  }

  void selectDate(BuildContext context) {
    if(!active) return;
    showAppDatePicker(context, onSelected: onSelect);
  }
}
