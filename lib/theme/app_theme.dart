import 'package:expense_tracker/source.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    fontFamily: kFontFam,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme:
        const AppBarTheme(backgroundColor: AppColors.background, elevation: 0),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all(AppColors.onPrimary),
      fillColor: WidgetStateProperty.all(AppColors.primary),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: AppColors.background,
      selectedItemColor: AppColors.primary,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: AppColors.onBackground2,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primary,
      selectionColor: AppColors.primary,
      selectionHandleColor: AppColors.primary,
    ),
    scrollbarTheme: ScrollbarThemeData(
      thickness: WidgetStateProperty.all(5),
      thumbColor: WidgetStateProperty.all(AppColors.accent),
      trackColor: WidgetStateProperty.all(AppColors.accent),
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppColors.primary),
  );
}
