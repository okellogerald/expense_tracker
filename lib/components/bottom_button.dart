import 'package:expense_tracker_v2/constants/themes/color_scheme.dart';
import 'package:flutter/material.dart';

import 'text_button.dart';

class BottomButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  const BottomButton({this.text, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: getTemboColorScheme().surface,
      child: AppTextButton.text(
        text: text ?? "Continue",
        onPressed: () {
          onPressed?.call();
        },
      ),
    );
  }
}
