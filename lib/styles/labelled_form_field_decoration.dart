import 'package:flutter/material.dart';

class TemboLabelledFormFieldDecoration {
  final TextStyle? labelTextStyle;
  final TextStyle? valueTextStyle;
  final BoxDecoration? boxDecoration;

  const TemboLabelledFormFieldDecoration({
    this.labelTextStyle,
    this.valueTextStyle,
    this.boxDecoration,
  });

  TemboLabelledFormFieldDecoration copyWith({
    TextStyle? labelTextStyle,
    TextStyle? valueTextStyle,
    BoxDecoration? boxDecoration,
  }) {
    return TemboLabelledFormFieldDecoration(
      labelTextStyle: labelTextStyle ?? this.labelTextStyle,
      valueTextStyle: valueTextStyle ?? this.valueTextStyle,
      boxDecoration: boxDecoration ?? this.boxDecoration,
    );
  }
}
