import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  double get viewportWidth => MediaQuery.of(this).size.width;

  double get viewportHeight => MediaQuery.of(this).size.height;

  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;
}
