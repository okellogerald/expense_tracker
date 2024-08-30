import 'package:expense_tracker_v2/extensions/source.dart';
import 'package:flutter/material.dart';

import '../constants/source.dart';
import '../constants/themes/color_scheme.dart';

enum TemboBorderStyle { underline, outline }

class TemboTextFieldDecoration {
  final Color? fillColor;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;
  final String? hint, label;
  final double? borderWidth;
  final double? borderRadius;
  final Color? borderColor;
  final bool hasBorder;
  final Size? size;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TemboBorderStyle? borderStyle;
  final EdgeInsets? padding;

  const TemboTextFieldDecoration({
    this.fillColor,
    this.valueStyle,
    this.hintStyle,
    this.hint,
    this.label,
    this.labelStyle,
    this.borderWidth,
    this.borderRadius,
    this.borderColor,
    this.hasBorder = true,
    this.size,
    this.prefixIcon,
    this.suffixIcon,
    this.borderStyle = TemboBorderStyle.outline,
    this.padding,
  });

  TemboTextFieldDecoration copyWith({
    Color? fillColor,
    String? hint,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Color? borderColor,
    TextStyle? hintStyle,
    TextStyle? valueStyle,
  }) {
    return TemboTextFieldDecoration(
      fillColor: fillColor ?? this.fillColor,
      hint: hint ?? this.hint,
      hintStyle: hintStyle ?? this.hintStyle,
      valueStyle: valueStyle ?? this.valueStyle,
      borderColor: borderColor ?? this.borderColor,
      borderRadius: borderRadius,
      borderWidth: borderWidth,
      hasBorder: hasBorder,
      size: size,
      prefixIcon: prefixIcon ?? this.prefixIcon,
      label: label,
      labelStyle: labelStyle,
      borderStyle: borderStyle,
      padding: padding,
      suffixIcon: suffixIcon ?? this.suffixIcon,
    );
  }

  TemboTextFieldDecoration copyFontFamily(String? fontFamily) {
    return copyWith(
      valueStyle: valueStyle?.copyWith(fontFamily: fontFamily),
      hintStyle: hintStyle?.copyWith(fontFamily: fontFamily),
    );
  }

  InputBorder get border {
    final scheme = getTemboColorScheme();
    return hasBorder
        ? borderStyle == TemboBorderStyle.outline
            ? OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(borderRadius ?? kBorderRadius3),
                borderSide: BorderSide(
                  color: borderColor ?? scheme.border,
                  width: borderWidth ?? 1.5,
                ),
              )
            : UnderlineInputBorder(
                borderRadius:
                    BorderRadius.circular(borderRadius ?? kBorderRadius3),
                borderSide: BorderSide(
                  color: borderColor ?? DefaultTemboColors.background,
                  width: borderWidth ?? 1.0,
                ),
              )
        : InputBorder.none;
  }

  InputDecoration get getInputDecoration {
    final scheme = getTemboColorScheme();

    final decoration = InputDecoration(
      isDense: false,
      border: border,
      enabledBorder: border,
      focusedBorder: border.copyWith(
        borderSide: BorderSide(
          color: scheme.primary,
          width: border.borderSide.width,
        ),
      ),
      focusedErrorBorder: border,
      errorBorder: border.copyWith(
        borderSide: BorderSide(
          color: scheme.error,
          width: border.borderSide.width,
        ),
      ),
      disabledBorder: border,
      filled: fillColor != null,
      fillColor: fillColor,
      contentPadding: padding ?? const EdgeInsets.fromLTRB(12, 0, 12, 0),
      hintStyle: hintStyle,
      hintText: hint,
      label: label == null ? null : Text(label!, style: labelStyle),
    );
    if (prefixIcon != null) {
      return decoration.copyWith(
          prefixIcon: IconTheme(
        data: IconThemeData(color: scheme.onBackground),
        child: prefixIcon!,
      ));
    }
    if (suffixIcon != null) {
      return decoration.copyWith(
          suffixIcon: IconTheme(
        data: IconThemeData(color: scheme.onBackground),
        child: suffixIcon!,
      ));
    }
    return decoration;
  }

  static TemboTextFieldDecoration getDefaultAmountDeco(BuildContext context) {
    final scheme = getTemboColorScheme();
    return TemboTextFieldDecoration(
      // size: const Size.fromHeight(60),
      hasBorder: true,
      borderWidth: 2,
      borderStyle: TemboBorderStyle.underline,
      hintStyle: context.textTheme.titleLarge.bold.withColor(scheme.hint),
      valueStyle: context.textTheme.titleLarge.bold.copyWith(
        color: scheme.onBackground,
      ),
      hint: "TZS 0",
      borderColor: scheme.border,
      fillColor: Colors.transparent,
    );
  }

  static TemboTextFieldDecoration getDefaultFilledDeco(BuildContext context) {
    final scheme = getTemboColorScheme();
    return TemboTextFieldDecoration(
      labelStyle: context.textTheme.bodyMedium.bold.withColor(scheme.onBackground),
      hintStyle: context.textTheme.bodyMedium.withColor(scheme.hint),
      valueStyle: context.textTheme.bodyMedium.withFW500.copyWith(
        color: scheme.onBackground,
      ),
      fillColor: scheme.surface,
    );
  }
}
