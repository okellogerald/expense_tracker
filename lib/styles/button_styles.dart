import 'package:expense_tracker_v2/extensions/source.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

enum _ButtonStyle { filled, outline, transparent }

class AppButtonStyle {
  final Color? backgroundColor, borderColor, foregroundColor;
  final num? elevation, width, height, borderWidth, borderRadius;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final bool? useContinuousBorder;

  final ImageProvider? imageProvider;

  final _ButtonStyle? _style;

  const AppButtonStyle({
    this.backgroundColor,
    this.borderColor,
    this.foregroundColor,
    this.borderWidth,
    this.borderRadius,
    this.elevation,
    this.width,
    this.padding,
    this.height,
    this.textStyle,
    this.useContinuousBorder = false,
    this.imageProvider,
  }) : _style = null;

  TextStyle? get getTextStyle => textStyle?.copyWith(color: foregroundColor);

  const AppButtonStyle.filled({
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
    this.elevation,
    this.width,
    this.height,
    this.padding,
    this.textStyle,
    this.imageProvider,
    this.useContinuousBorder = false,
  })  : _style = _ButtonStyle.filled,
        borderColor = Colors.transparent,
        borderWidth = 0;

  const AppButtonStyle.outline({
    this.foregroundColor,
    this.borderColor,
    this.borderWidth = 1.5,
    this.borderRadius = kBorderRadius4,
    this.width,
    this.height,
    this.padding,
    this.textStyle,
  })  : _style = _ButtonStyle.outline,
        useContinuousBorder = false,
        elevation = 0,
        backgroundColor = Colors.transparent,
        imageProvider = null;

  const AppButtonStyle.transparent({
    this.foregroundColor,
    this.width,
    this.height,
    this.padding,
    this.textStyle,
  })  : _style = _ButtonStyle.transparent,
        borderRadius = kBorderRadius4,
        useContinuousBorder = false,
        elevation = 0,
        backgroundColor = Colors.transparent,
        borderColor = Colors.transparent,
        borderWidth = 0,
        imageProvider = null;

  Size? get _size {
    if (width != null && height != null) {
      return Size(width!.toDouble(), height!.toDouble());
    }
    if (width != null && height == null) {
      return Size(width!.toDouble(), 50);
    }
    if (width == null && height != null) {
      return Size.fromHeight(height!.toDouble());
    }
    /*   if (width == null && height == null) {
      return const Size.fromHeight(50);
    } */
    return null;
  }

  AppButtonStyle copyWith({
    Color? backgroundColor,
    Color? borderColor,
    Color? foregroundColor,
    num? elevation,
    num? width,
    num? height,
    num? borderWidth,
    num? borderRadius,
    EdgeInsets? padding,
    TextStyle? textStyle,
    bool? useContinuousBorder,
  }) {
    return AppButtonStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      elevation: elevation ?? this.elevation,
      width: width ?? this.width,
      height: height ?? this.height,
      borderRadius: borderRadius ?? this.borderRadius,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      padding: padding ?? this.padding,
      textStyle: textStyle ?? this.textStyle,
      useContinuousBorder: useContinuousBorder ?? this.useContinuousBorder,
      imageProvider: imageProvider,
    );
  }

  AppButtonStyle merge(AppButtonStyle other) {
    return AppButtonStyle(
      backgroundColor: other.backgroundColor ?? backgroundColor,
      elevation: other.elevation ?? elevation,
      width: other.width ?? width,
      height: other.height ?? height,
      borderRadius: other.borderRadius ?? borderRadius,
      foregroundColor: other.foregroundColor ?? foregroundColor,
      borderColor: other.borderColor ?? borderColor,
      borderWidth: other.borderWidth ?? borderWidth,
      padding: other.padding ?? padding,
      // textStyle: other.textStyle ?? textStyle,
      useContinuousBorder: other.useContinuousBorder ?? useContinuousBorder,
      imageProvider: imageProvider,
    );
  }

  AppButtonStyle applyDefaultThemes(BuildContext context) {
    final scheme = context.colorScheme;
    return AppButtonStyle(
      backgroundColor: backgroundColor ??
          (_style == _ButtonStyle.filled ? scheme.primary : null),
      foregroundColor: foregroundColor ??
          (_style == _ButtonStyle.filled ? scheme.onPrimary : scheme.primary),
      borderColor: borderColor ??
          (_style == _ButtonStyle.outline ? scheme.primary : null),
      elevation: elevation,
      width: width,
      height: height,
      borderRadius: borderRadius,
      borderWidth: borderWidth,
      padding: padding,
      textStyle: textStyle,
      useContinuousBorder: useContinuousBorder,
      imageProvider: imageProvider,
    );
  }

  AppButtonStyle mergeWithColors({
    Color? backgroundColor,
    Color? borderColor,
    Color? foregroundColor,
  }) {
    return AppButtonStyle(
      backgroundColor: this.backgroundColor ?? backgroundColor,
      foregroundColor: this.foregroundColor ?? foregroundColor,
      borderColor: this.borderColor ?? borderColor,

      elevation: elevation,
      width: width,
      height: height,
      borderRadius: borderRadius,
      borderWidth: borderWidth,
      padding: padding,
      // textStyle: other.textStyle ?? textStyle,
      useContinuousBorder: useContinuousBorder,
      imageProvider: imageProvider,
    );
  }

  bool get _usesContinuousBorder =>
      useContinuousBorder == null || useContinuousBorder == true;

  ButtonStyle get buttonStyle {
    return ElevatedButton.styleFrom(
      elevation: elevation?.toDouble() ?? 0,
      backgroundColor: backgroundColor,
      shape: _usesContinuousBorder
          ? ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(
                  borderRadius?.toDouble() ?? kBorderRadius4),
              side: BorderSide(
                color: borderColor ?? Colors.grey,
                width: borderWidth?.toDouble() ?? 1.0,
              ),
            )
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  borderRadius?.toDouble() ?? kBorderRadius4),
              side: BorderSide(
                color: borderColor ?? Colors.grey,
                width: borderWidth?.toDouble() ?? 1.0,
              ),
            ),
      textStyle: getTextStyle,
      fixedSize: _size,
      padding: _size == null && padding == null
          ? horizontal() + vertical(8)
          : padding,
    );
  }

  @override
  String toString() {
    return 'TemboButtonStyle(foregroundColor: $foregroundColor, backgroundColor: $backgroundColor, borderRadius: $borderRadius, padding: $padding, textStyle: $textStyle, useContinuousBorder: $useContinuousBorder, _style: $_style)';
  }
}
