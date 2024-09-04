import '/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class AppText extends StatelessWidget {
  const AppText(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _weight = null;

  final FontWeight? _weight;

  const AppText.center(
    this.data, {
    super.key,
    this.style,
    this.overflow,
    this.maxLines,
  })  : textAlign = TextAlign.center,
        _weight = null;

  const AppText.bold(
    this.data, {
    super.key,
    this.textAlign,
    this.style,
    this.overflow,
    this.maxLines,
  }) : _weight = FontWeight.bold;

  const AppText.w300(
    this.data, {
    super.key,
    this.textAlign,
    this.style,
    this.overflow,
    this.maxLines,
  }) : _weight = FontWeight.w300;

  const AppText.w400(
    this.data, {
    super.key,
    this.textAlign,
    this.style,
    this.overflow,
    this.maxLines,
  }) : _weight = FontWeight.w400;

  const AppText.w500(
    this.data, {
    super.key,
    this.textAlign,
    this.style,
    this.overflow,
    this.maxLines,
  }) : _weight = FontWeight.w500;

  AppText.headlineMedium(
    BuildContext context,
    this.data, {
    super.key,
    this.textAlign,
    this.overflow,
    this.maxLines,
    FontWeight? weight,
    Color? color,
  })  : style = context.textTheme.displayMedium?.copyWith(color: color),
        _weight = weight;

  AppText.bodyLarge(
    BuildContext context,
    this.data, {
    super.key,
    this.textAlign,
    this.overflow,
    this.maxLines,
    FontWeight? weight,
    Color? color,
  })  : style = context.textTheme.bodyLarge?.copyWith(color: color),
        _weight = weight;

  AppText.titleLarge(
    BuildContext context,
    this.data, {
    super.key,
    this.textAlign,
    this.overflow,
    this.maxLines,
    FontWeight? weight,
    Color? color,
  })  : style = context.textTheme.titleLarge?.copyWith(color: color),
        _weight = weight;

  AppText.titleMedium(
    BuildContext context,
    this.data, {
    super.key,
    this.textAlign,
    this.overflow,
    this.maxLines,
    FontWeight? weight,
    Color? color,
  })  : style = context.textTheme.titleMedium?.copyWith(color: color),
        _weight = weight;

  AppText.bodyMedium(
    BuildContext context,
    this.data, {
    super.key,
    this.textAlign,
    this.overflow,
    this.maxLines,
    FontWeight? weight,
    String? fontFamily,
    Color? color,
  })  : style = context.textTheme.bodyMedium?.copyWith(
          color: color,
          fontFamily: fontFamily,
        ),
        _weight = weight;

  final String data;

  final TextStyle? style;

  final TextAlign? textAlign;

  final TextOverflow? overflow;

  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final textstyle = style ?? DefaultTextStyle.of(context).style;
    final ff = textstyle.fontFamily ?? fonts.jost;

    return Text(
      data,
      style: textstyle.copyWith(fontWeight: _weight, fontFamily: ff),
      textAlign: textAlign,
      overflow: maxLines != null && maxLines != 0 && overflow == null
          ? TextOverflow.ellipsis
          : overflow,
      maxLines: maxLines,
      textScaler: const TextScaler.linear(1.0),
    );
  }
}
