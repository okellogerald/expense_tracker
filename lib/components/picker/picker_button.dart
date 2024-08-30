import '../_common_imports.dart';
import 'options_dialog.dart';

class AppPickerButton<T> extends StatefulWidget {
  final T? initialvalue;
  final List<T> options;
  final ValueChanged<T> onSelected;
  final String dropDownTitle;
  final String? hint;
  final bool canSearch;
  final String Function(T option) nameGetter;
  final AppButtonStyle? buttonStyle;

  const AppPickerButton({
    this.initialvalue,
    required this.options,
    required this.dropDownTitle,
    required this.onSelected,
    this.buttonStyle,
    this.hint,
    this.canSearch = false,
    super.key,
    required this.nameGetter,
  });

  @override
  State<AppPickerButton<T>> createState() => _AppPickerButtonState<T>();
}

class _AppPickerButtonState<T> extends State<AppPickerButton<T>> {
  T? _currentValue;

  onSelected(T value) {
    _currentValue = value;
    widget.onSelected(value);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialvalue;
  }

  @override
  Widget build(BuildContext context) {
    final name = _currentValue == null
        ? widget.hint ?? widget.dropDownTitle
        // ignore: null_check_on_nullable_type_parameter
        : widget.nameGetter(_currentValue!);

    return AppTextButton(
      onPressed: () {
        showOptions(context, widget.options);
      },
      style: widget.buttonStyle,
      child: Row(
        children: [
          Expanded(
            child: AppText(
              name,
              maxLines: 1,
              style: widget.buttonStyle?.getTextStyle?.copyWith(
                color: _currentValue == null ? Colors.grey : null,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Icon(
            Icons.expand_more_rounded,
            color: context.colorScheme.onSurface,
          ),
        ],
      ),
    );
  }

  void showOptions(
    BuildContext context,
    List<T> options,
  ) async {
    final value = await showOptionsDialog(
      context: context,
      options: options,
      dropdownTitle: widget.dropDownTitle,
      currentValue: _currentValue,
      nameGetter: widget.nameGetter,
    );
    if (value != null) {
      onSelected(value);
    }
  }
}
