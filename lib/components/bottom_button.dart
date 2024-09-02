import 'package:expense_tracker_v2/constants/themes/color_scheme.dart';
import 'package:flutter/material.dart';

import 'text_button.dart';

class BottomButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPress;
  const BottomButton({this.text, this.onPress, super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: getTemboColorScheme().surface,
      child: AppTextButton.text(
        text: text ?? "Continue",
        onPressed: () {
          onPress?.call();
        },
      ),
    );
  }
}
