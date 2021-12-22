import '../source.dart';

class AppTextField extends StatefulWidget {
  const AppTextField(
      {required this.errors,
      required this.text,
      required this.onChanged,
      this.maxLines = 1,
      required this.hintText,
      required this.keyboardType,
      this.letterSpacing,
      Key? key})
      : super(key: key);

  final Map<String, dynamic> errors;
  final String? text;
  final ValueChanged<String> onChanged;
  final int maxLines;
  final String hintText;
  final double? letterSpacing;
  final TextInputType keyboardType;

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
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
    final hasError = widget.errors.containsKey('text');
    final border = hasError ? errorBorder : _inputBorder;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40.dh,
          child: TextField(
              controller: controller,
              onChanged: widget.onChanged,
              maxLines: widget.maxLines,
              minLines: 1,
              keyboardType: widget.keyboardType,
              textCapitalization: TextCapitalization.sentences,
              style: TextStyle(
                color: AppColors.textColor,
                fontFamily: kFontFam2,
                letterSpacing: widget.letterSpacing,
              ),
              cursorColor: AppColors.textColor,
              decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(
                      color: AppColors.textColor2, fontFamily: kFontFam2),
                  fillColor: Colors.white.withOpacity(.25),
                  filled: true,
                  isDense: true,
                  border: border,
                  focusedBorder: border,
                  enabledBorder: border,
                  contentPadding:
                      EdgeInsets.only(left: 10.dw, top: 12.dw, bottom: 8.dw))),
        ),
        hasError
            ? Padding(
                padding: EdgeInsets.only(top: 8.dw),
                child: AppText(
                  widget.errors['text']!,
                  color: AppColors.errorColor,
                  family: kFontFam2,
                  size: 16.dw,
                ),
              )
            : Container()
      ],
    );
  }

  final _inputBorder = const UnderlineInputBorder(
      borderSide: BorderSide(width: 0.0, color: Colors.transparent),
      borderRadius: BorderRadius.zero);

  final errorBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(width: 1.2, color: Colors.white70));
}
