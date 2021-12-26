import 'package:flutter/material.dart';

class AppColors {
  static const accentColor = Color(0xffC84B31);
  static const errorColor = Color(0xffBC3A38);
  static const disabledColor = Colors.white54;
  static const highlightColor = Color(0xFFF2F1F0);

  final String currentTheme;
  late Color primaryColor,
      secondaryColor,
      iconColor,
      textColor,
      textColor2,
      textColor3,
      dividerColor,
      backgroundColor,
      backgroundColor2,
      positiveColor,
      negativeColor;

  AppColors(this.currentTheme) {
    final isDark = currentTheme == 'Dark';

    primaryColor = isDark ? const Color(0xff97BFB4) : const Color(0xff1ba891);
    secondaryColor = isDark ? const Color(0xff433D3C) : const Color(0xffE4E5E8);
    iconColor = isDark ? Colors.white70 : Colors.black87;
    positiveColor = isDark ? const Color(0xff77D970) : const Color(0xff013A20);
    negativeColor = isDark ? const Color(0xffF58840) : const Color(0xffD8581C);
    textColor = isDark ? Colors.white : Colors.black;
    textColor2 = isDark ? Colors.white70 : Colors.black87;
    textColor3 = isDark ? Colors.white60 : Colors.black54;
    dividerColor = isDark ? const Color(0xffDBDDD0) : Colors.black45;
    backgroundColor =
        isDark ? const Color(0xff191919) : const Color(0xffF7F8F8);
    backgroundColor2 = isDark ? Colors.white12 : Colors.black12;
  }
}
