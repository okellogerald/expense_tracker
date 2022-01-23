import '../source.dart';

class VerificationTextField extends StatefulWidget {
  final void Function(int, int) onChanged;
  final int id;
  final bool hasNextFocus;

  const VerificationTextField(
      {required this.id,
      required this.onChanged,
      this.hasNextFocus = true,
      Key? key})
      : super(key: key);

  @override
  State<VerificationTextField> createState() => _VerificationTextFieldState();
}

class _VerificationTextFieldState extends State<VerificationTextField> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.only(right: widget.id == 5 ? 0 : 5.dw),
      child: TextField(
          controller: controller,
          style: TextStyle(
            color: AppColors.onBackground,
            fontFamily: kFontFam2,
            fontSize: 18.dw,
          ),
          keyboardType: TextInputType.number,
          textInputAction:
              widget.hasNextFocus ? TextInputAction.next : TextInputAction.done,
          cursorColor: AppColors.primary,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 10.dh),
              filled: true,
              fillColor: AppColors.surface,
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary)),
              border: const OutlineInputBorder(),
              hintText: '#',
              hintStyle:
                  TextStyle(color: AppColors.onBackground2, fontSize: 15.dw)),
          onChanged: (value) {
            if (value.length == 1) {
              widget.onChanged(widget.id, int.parse(value));
              if (widget.hasNextFocus) {
                FocusScope.of(context).nextFocus();
              } else {
                FocusScope.of(context).unfocus();
              }
            }
          }),
    ));
  }
}
