import '../source.dart';

class AppTextField extends StatefulWidget {
  const AppTextField(
      {required this.errors,
      required this.text,
      required this.onChanged,
      this.maxLines = 1,
      required this.hintText,
      required this.keyboardType,
      this.errorName = 'title',
      this.letterSpacing,
      Key? key})
      : super(key: key);

  final Map<String, dynamic> errors;
  final String? text;
  final ValueChanged<String> onChanged;
  final int maxLines;
  final String hintText, errorName;
  final double? letterSpacing;
  final TextInputType keyboardType;

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final controller = TextEditingController();

  
  static var themeProvider = ThemeProvider();
  static var appColors = AppColors('Light');

  @override
  void didChangeDependencies() {
    themeProvider = Provider.of<ThemeProvider>(context);
    appColors = AppColors(themeProvider.getCurrentTheme);
    super.didChangeDependencies();
  }

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
    final hasError = widget.errors.containsKey(widget.errorName);
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
                color: appColors.textColor,
                fontFamily: kFontFam2,
                letterSpacing: widget.letterSpacing,
                fontSize: 14.dw,
              ),
              cursorColor: appColors.textColor,
              decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    color: appColors.textColor2,
                    fontFamily: kFontFam2,
                    fontSize: 14.dw,
                  ),
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
                  widget.errors[widget.errorName]!,
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
