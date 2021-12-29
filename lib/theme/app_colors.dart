import 'package:flutter/material.dart';

class AppColors {
  static const accentColor = Color(0xffC84B31);
  static const errorColor = Color(0xffBC3A38);
  static const disabledColor = Colors.white54;
  static const highlightColor = Color(0xFFF2F1F0);

  final String currentTheme;
  late Color primaryColor,
      onPrimaryColor,
      secondaryColor,
      iconColor,
      iconColor2,
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

    primaryColor = isDark ? const Color(0xff97BFB4) : const Color(0xff132F70);
    onPrimaryColor = isDark ? Colors.black : Colors.white;
    secondaryColor = isDark ? const Color(0xff433D3C) : Colors.black12;
    iconColor = isDark ? Colors.white : Colors.black;
    iconColor2 = isDark ? Colors.white70 : Colors.black.withOpacity(.70);
    positiveColor = isDark ? const Color(0xff77D970) : const Color(0xff116530);
    negativeColor = const Color(0xffF58840);
    textColor = isDark ? Colors.white : Colors.black;
    textColor2 = isDark ? Colors.white70 : Colors.black.withOpacity(.70);
    textColor3 = isDark ? Colors.white60 : Colors.black54;
    dividerColor = isDark ? const Color(0xffDBDDD0) : Colors.black87;
    backgroundColor = isDark ? const Color(0xff191919) : Colors.white;
    backgroundColor2 = isDark ? Colors.white12 : Colors.grey.shade100;
  }
}
