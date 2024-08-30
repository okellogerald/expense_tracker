import 'package:flutter/material.dart';

import 'button_styles.dart';

class TemboDatePickerDecoration {
  final AppButtonStyle? buttonStyle;
  final String hint;
  final TextStyle? hintStyle;
  final Widget? icon;

  const TemboDatePickerDecoration({
    this.buttonStyle,
    this.hint = "Pick Date",
    this.hintStyle,
    this.icon,
  });

  TemboDatePickerDecoration copyWith({
    AppButtonStyle? buttonStyle,
    String? hint,
    TextStyle? hintStyle,
    Widget? icon,
  }) {
    return TemboDatePickerDecoration(
      buttonStyle: buttonStyle ?? this.buttonStyle,
      hint: hint ?? this.hint,
      hintStyle: hintStyle ?? this.hintStyle,
      icon: icon ?? this.icon,
    );
  }
}
