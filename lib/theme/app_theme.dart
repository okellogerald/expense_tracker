import 'package:budgetting_app/source.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
      fontFamily: kFontFam,
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background, elevation: 0),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: AppColors.background,
          selectedItemColor: AppColors.primary,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: AppColors.onBackground2),
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.primary,
          selectionColor: AppColors.primary,
          selectionHandleColor: AppColors.primary),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: AppColors.primary));
}
