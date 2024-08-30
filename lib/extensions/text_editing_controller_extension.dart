import 'package:flutter/material.dart';

extension TextEditingControllerExt on TextEditingController {
  String? get compactText {
    return text.trim().isEmpty ? null : text.trim();
  }

  double? get compactAmount {
    final amount = compactText?.replaceAll(",", "");
    if (amount == null) return null;
    return double.tryParse(amount);
  }
}
