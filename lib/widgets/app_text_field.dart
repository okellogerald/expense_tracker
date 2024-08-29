import '../source.dart';

class AppTextField extends StatefulWidget {
  const AppTextField(
      {required this.errors,
      required this.text,
      required this.onChanged,
      this.maxLines = 1,
      required this.hintText,
      required this.keyboardType,
      this.textCapitalization = TextCapitalization.sentences,
      required this.errorName,
      this.suffixIcon,
      this.letterSpacing,
      this.textColor,
      super.key});

  final Map<String, dynamic> errors;
  final String? text;
  final ValueChanged<String> onChanged;
  final int maxLines;
  final String hintText, errorName;
  final double? letterSpacing;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final IconData? suffixIcon;
  final Color? textColor;

  @override
  State createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final controller = TextEditingController();

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
    final emptyContainer = Container(width: 0.01);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: 50.dh,
            child: TextFormField(
                controller: controller,
                onChanged: widget.onChanged,
                maxLines: widget.maxLines,
                minLines: 1,
                keyboardType: widget.keyboardType,
                textCapitalization: widget.textCapitalization,
                style: TextStyle(
                    color: widget.textColor ?? AppColors.onBackground,
                    letterSpacing: widget.letterSpacing,
                    fontSize: 16.dw),
                cursorColor: AppColors.onBackground,
                decoration: InputDecoration(
                    hintText: widget.hintText,
                    hintStyle: TextStyle(
                        color: AppColors.onBackground2, fontSize: 14.dw),
                    fillColor: AppColors.textField,
                    suffixIcon: widget.suffixIcon != null
                        ? Icon(widget.suffixIcon,
                            color: AppColors.onBackground2, size: 20.dw)
                        : emptyContainer,
                    filled: true,
                    isDense: true,
                    border: border,
                    focusedBorder: border,
                    enabledBorder: border,
                    contentPadding: EdgeInsets.only(left: 20.dw, top: 16.dw)))),
        _buildError(error)
      ],
    );
  }

  _buildError(String? error) {
    if (error == null) return Container();
    return Padding(
      padding: EdgeInsets.only(top: 10.dh, left: 15.dw),
      child: AppText(
        widget.errors[widget.errorName]!,
        color: AppColors.error,
        size: 15.dw,
      ),
    );
  }

  final _inputBorder = UnderlineInputBorder(
    borderSide: const BorderSide(width: 0.0, color: Colors.transparent),
    borderRadius: BorderRadius.all(Radius.circular(20.dw)),
  );

  final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.dw)),
      borderSide: const BorderSide(width: 1.2, color: Colors.white70));
}
