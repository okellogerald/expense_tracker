import '../source.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField(
      {required this.errors,
      required this.text,
      required this.onChanged,
      this.hintText = 'Password',
      this.errorName = 'password',
      this.suffixIcon,
      this.letterSpacing,
      this.textColor,
      this.isLoginPassword = false,
      super.key});

  final Map<String, dynamic> errors;
  final String? text;
  final ValueChanged<String> onChanged;
  final String? hintText, errorName;
  final double? letterSpacing;
  final IconData? suffixIcon;
  final Color? textColor;
  final bool isLoginPassword;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final controller = TextEditingController();
  final isVisibleNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    final text = widget.text ?? '';
    final isEditing = text.trim().isNotEmpty;
    if (isEditing) {
      controller.text = text;
      controller.selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final error = widget.errors[widget.errorName];
    final border = error != null ? errorBorder : _inputBorder;
    final hasNoText = controller.text.isEmpty;
    final emptyContainer = Container(width: 0.01);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50.dh,
          child: ValueListenableBuilder<bool>(
              valueListenable: isVisibleNotifier,
              builder: (context, isVisible, snapshot) {
                return TextField(
                    controller: controller,
                    onChanged: widget.onChanged,
                    maxLines: 1,
                    minLines: 1,
                    keyboardType: TextInputType.visiblePassword,
                    textCapitalization: TextCapitalization.none,
                    style: TextStyle(
                        color: widget.textColor ?? AppColors.onBackground,
                        letterSpacing: widget.letterSpacing,
                        fontSize: 16.dw),
                    cursorColor: AppColors.onBackground,
                    obscureText: widget.isLoginPassword ? true : !isVisible,
                    decoration: InputDecoration(
                        hintText: widget.hintText,
                        hintStyle: TextStyle(
                            color: AppColors.onBackground2, fontSize: 14.dw),
                        fillColor: AppColors.textField,
                        suffixIcon: widget.suffixIcon != null
                            ? Icon(widget.suffixIcon,
                                color: AppColors.onBackground2, size: 20.dw)
                            : hasNoText
                                ? emptyContainer
                                : GestureDetector(
                                    onTap: () =>
                                        isVisibleNotifier.value = !isVisible,
                                    child: Icon(
                                        !isVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        size: 16.dw,
                                        color: AppColors.accent),
                                  ),
                        filled: true,
                        isDense: true,
                        border: border,
                        focusedBorder: border,
                        enabledBorder: border,
                        contentPadding:
                            EdgeInsets.only(left: 20.dw, top: 16.dw)));
              }),
        ),
        _buildError(error)
      ],
    );
  }

  _buildError(String? error) {
    if (error == null) return Container();
    return Padding(
        padding: EdgeInsets.only(top: 10.dh, left: 15.dw),
        child: AppText(widget.errors[widget.errorName]!,
            color: AppColors.error, size: 15.dw));
  }

  final _inputBorder = UnderlineInputBorder(
    borderSide: const BorderSide(width: 0.0, color: Colors.transparent),
    borderRadius: BorderRadius.all(Radius.circular(20.dw)),
  );

  final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.dw)),
      borderSide: const BorderSide(width: 1.2, color: Colors.white70));
}
