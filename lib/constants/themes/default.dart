import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'color_scheme.dart';

class DefaultTemboColors {
  static const primary = Color(0xFF00308F);
  static const onPrimary = Colors.white;

  static const primaryContainer = Color.fromARGB(255, 221, 234, 243);
  static const onPrimaryContainer = Colors.black87;

  static const secondary = Color(0xff78184A);
  static const onSecondary = Colors.white;

  static const secondaryContainer = Color(0xFFFAE6FA);
  static const onSecondaryContainer = Colors.black;

  static const background = Colors.white;
  static const onBackground = Colors.black;

  static const surfaceContainer = Color(0xffF8F8F8);
  static const onSurfaceContainer = Colors.black54;

  static const surface = Color(0xfff4f5f8);
  static const onSurface = Color.fromARGB(255, 93, 93, 93);

  static const error = Color(0xff841617);
  static const onError = Colors.white;

  static const success = Color(0xff50C878);
  static const onSuccess = Colors.white;

  static const border = Colors.black26;
  static const hint = Color.fromARGB(255, 140, 140, 140);
}

class DarkTemboColors {
  static const primary = Colors.lightBlueAccent;
  static const onPrimary = Colors.black87;

  static const primaryContainer = Color.fromARGB(255, 159, 127, 218);
  static const onPrimaryContainer = Colors.white;

  static const secondary = Color(0xff5000F0);
  static const onSecondary = Colors.white;

  static const secondaryContainer = Color(0xFFFAE6FA);
  static const onSecondaryContainer = Colors.black;

  static const background = Colors.black45;
  static const onBackground = Colors.white;

  static const text = Colors.white;
  static const text2 = Colors.white70;
  static const text3 = Colors.white54;
  static const text4 = Colors.white30;
  static const text5 = Colors.white10;

  static const surfaceContainer = Color(0xff3D3D3D);
  static const onSurfaceContainer = Colors.white;

  static const surface = Color.fromARGB(255, 27, 26, 26);
  static const onSurface = Color.fromARGB(255, 241, 241, 241);

  static const success = Color(0xff006400);
  static const onSuccess = Colors.white;

  static const error = Colors.red;
  static const onError = Colors.white;

  static const border = Colors.white12;
  static const hint = Colors.white12;
}

final defaultLightTheme = defaultLightFlexColorScheme.toTheme.copyWith(
  textTheme: defaultLightFlexColorScheme.toTheme.textTheme.apply(
    bodyColor: defaultLightColorScheme.onBackground,
    displayColor: defaultLightColorScheme.onBackground,
    fontFamily: kFontFamily,
  ),
);

const defaultLightColorScheme = TemboColorScheme.light(
  primary: DefaultTemboColors.primary,
  onPrimary: DefaultTemboColors.onPrimary,
  primaryContainer: DefaultTemboColors.primaryContainer,
  onPrimaryContainer: DefaultTemboColors.onPrimaryContainer,
  secondaryContainer: DefaultTemboColors.secondaryContainer,
  onSecondaryContainer: DefaultTemboColors.onSecondaryContainer,
  secondary: DefaultTemboColors.secondary,
  onSecondary: DefaultTemboColors.onSecondary,
  background: DefaultTemboColors.background,
  onBackground: DefaultTemboColors.onBackground,
  surface: DefaultTemboColors.surface,
  onSurface: DefaultTemboColors.onSurface,
  error: DefaultTemboColors.error,
  onError: DefaultTemboColors.onError,
  success: DefaultTemboColors.success,
  onSuccess: DefaultTemboColors.onSuccess,
  surfaceContainer: DefaultTemboColors.surfaceContainer,
  onSurfaceContainer: DefaultTemboColors.onSurfaceContainer,
  border: DefaultTemboColors.border,
  hint: DefaultTemboColors.hint,
);
final defaultLightFlexColorScheme = FlexColorScheme.light(
  fontFamily: kFontFamily,
  appBarBackground: defaultLightColorScheme.background,
  primary: defaultLightColorScheme.primary,
  onPrimary: defaultLightColorScheme.onPrimary,
  primaryContainer: defaultLightColorScheme.primaryContainer,
  onPrimaryContainer: defaultLightColorScheme.onPrimaryContainer,
  secondary: defaultLightColorScheme.secondary,
  onSecondary: defaultLightColorScheme.onSecondary,
  secondaryContainer: defaultLightColorScheme.secondaryContainer,
  onSecondaryContainer: defaultLightColorScheme.onSecondaryContainer,
  error: defaultLightColorScheme.error,
  onError: defaultLightColorScheme.onError,
  background: defaultLightColorScheme.background,
  onBackground: defaultLightColorScheme.onBackground,
  scaffoldBackground: defaultLightColorScheme.background,
  surface: defaultLightColorScheme.surface,
  onSurface: defaultLightColorScheme.onSurface,
  useMaterial3: true,
  useMaterial3ErrorColors: true,
  appBarStyle: FlexAppBarStyle.material,
  subThemesData: const FlexSubThemesData(
    elevatedButtonSchemeColor: SchemeColor.background,
    appBarBackgroundSchemeColor: SchemeColor.background,
  ),
);

final defaultDarkTheme = defaultDarkFlexColorScheme.toTheme.copyWith(
  textTheme: defaultDarkFlexColorScheme.toTheme.textTheme.apply(
    bodyColor: defaultDarkColorScheme.onBackground,
    displayColor: defaultDarkColorScheme.onBackground,
    fontFamily: kFontFamily,
  ),
  brightness: Brightness.dark,
);

final defaultDarkFlexColorScheme = FlexColorScheme.dark(
  fontFamily: kFontFamily,
  appBarBackground: defaultDarkColorScheme.background,
  primary: defaultDarkColorScheme.primary,
  onPrimary: defaultDarkColorScheme.onPrimary,
  primaryContainer: defaultDarkColorScheme.primaryContainer,
  onPrimaryContainer: defaultDarkColorScheme.onPrimaryContainer,
  secondary: defaultDarkColorScheme.secondary,
  onSecondary: defaultDarkColorScheme.onSecondary,
  secondaryContainer: defaultDarkColorScheme.secondaryContainer,
  onSecondaryContainer: defaultDarkColorScheme.onSecondaryContainer,
  error: defaultDarkColorScheme.error,
  onError: defaultDarkColorScheme.onError,
  background: defaultDarkColorScheme.background,
  onBackground: defaultDarkColorScheme.onBackground,
  scaffoldBackground: defaultDarkColorScheme.background,
  surface: defaultDarkColorScheme.surface,
  onSurface: defaultDarkColorScheme.onSurface,
  useMaterial3: true,
  useMaterial3ErrorColors: true,
  appBarStyle: FlexAppBarStyle.material,
  subThemesData: const FlexSubThemesData(
    elevatedButtonSchemeColor: SchemeColor.background,
    appBarBackgroundSchemeColor: SchemeColor.background,
  ),
);

const defaultDarkColorScheme = TemboColorScheme.dark(
  primary: DarkTemboColors.primary,
  onPrimary: DarkTemboColors.onPrimary,
  primaryContainer: DarkTemboColors.primaryContainer,
  onPrimaryContainer: DarkTemboColors.onPrimaryContainer,
  secondaryContainer: DarkTemboColors.secondaryContainer,
  onSecondaryContainer: DarkTemboColors.onSecondaryContainer,
  secondary: DarkTemboColors.secondary,
  onSecondary: DarkTemboColors.onSecondary,
  background: DarkTemboColors.background,
  onBackground: DarkTemboColors.onBackground,
  surface: DarkTemboColors.surface,
  onSurface: DarkTemboColors.onSurface,
  error: DarkTemboColors.error,
  onError: DarkTemboColors.onError,
  success: DarkTemboColors.success,
  onSuccess: DarkTemboColors.onSuccess,
  surfaceContainer: DarkTemboColors.surfaceContainer,
  onSurfaceContainer: DarkTemboColors.onSurfaceContainer,
  border: DarkTemboColors.border,
  hint: DarkTemboColors.hint,
);

extension TemboColorSchemeExt on ColorScheme {
  Color get surfaceContainer => DefaultTemboColors.surfaceContainer;
  Color get onSurfaceContainer => DefaultTemboColors.onSurfaceContainer;

  Color get success => DefaultTemboColors.success;
  Color get onSuccess => DefaultTemboColors.onSuccess;

  Color get border => DefaultTemboColors.border;
  Color get hint => DefaultTemboColors.hint;

  Color get text => DarkTemboColors.text;
  Color get text2 => DarkTemboColors.text2;
  Color get text3 => DarkTemboColors.text3;
  Color get text4 => DarkTemboColors.text4;
  Color get text5 => DarkTemboColors.text5;
}
