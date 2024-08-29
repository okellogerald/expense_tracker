import '/source.dart';

class AppCheckBox extends StatefulWidget {
  const AppCheckBox({super.key, required this.onChanged});

  final ValueChanged<bool?> onChanged;

  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  var checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: checkBoxValue,
            onChanged: (value) {
              if (value != null) {
                widget.onChanged(value);
                checkBoxValue = value;
                setState(() {});
              }
            }),
        SizedBox(width: 5.dw),
        AppText('Remember me', size: 16.dw, color: AppColors.onBackground2)
      ],
    );
  }
}
