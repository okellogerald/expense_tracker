import 'package:budgetting_app/providers/user_details_provider.dart';
import 'package:budgetting_app/source.dart' hide Consumer;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AmountTextField extends StatefulWidget {
  const AmountTextField(
      {Key? key,
      this.errors = const {},
      required this.text,
      required this.onChanged,
      required this.errorName})
      : super(key: key);

  final Map<String, dynamic> errors;
  final String? text;
  final ValueChanged<String> onChanged;
  final String errorName;

  @override
  State<AmountTextField> createState() => _AmountTextFieldState();
}

class _AmountTextFieldState extends State<AmountTextField> {
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: 50.dh,
            child: TextField(
                controller: controller,
                onChanged: widget.onChanged,
                maxLines: 1,
                minLines: 1,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    color: AppColors.onBackground,
                    fontSize: 16.dw,
                    fontFamily: kFontFam2),
                cursorColor: AppColors.onBackground,
                decoration: InputDecoration(
                    hintText: '0',
                    hintStyle: TextStyle(
                        color: AppColors.onBackground2,
                        fontFamily: kFontFam2,
                        fontSize: 14.dw),
                    fillColor: AppColors.textField,
                    filled: true,
                    isDense: true,
                    border: border,
                    focusedBorder: border,
                    enabledBorder: border,
                    contentPadding: EdgeInsets.only(
                        left: 20.dw, top: 14.dh, bottom: 14.dh)))),
        _buildFormattedAmount(),
        _buildError(error)
      ],
    );
  }

  _buildFormattedAmount() {
    final amount = double.tryParse(widget.text ?? '0');
    if (amount != null) {
      final formattedAmount = Utils.convertToMoneyFormat(amount);
      return Padding(
        padding: EdgeInsets.only(top: 10.dh, right: 12.dw),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final currency = ref.watch(signedInUserProvider)!.currency;
                return AppText('$currency $formattedAmount',
                    color: AppColors.accent, size: 15.dw, family: kFontFam2);
              },
            ),
          ],
        ),
      );
    }
    return Container();
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
