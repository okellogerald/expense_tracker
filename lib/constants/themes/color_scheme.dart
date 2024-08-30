import 'dart:ui';

import 'default.dart';

class TemboColorScheme {
  final Color primary,
      onPrimary,
      primaryContainer,
      onPrimaryContainer,
      secondary,
      onSecondary,
      secondaryContainer,
      onSecondaryContainer,
      border,
      hint,
      background,
      onBackground,
      surface,
      onSurface,
      surfaceContainer,
      onSurfaceContainer,
      success,
      onSuccess,
      error,
      onError;

  const TemboColorScheme({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.border,
    required this.background,
    required this.onBackground,
    required this.surfaceContainer,
    required this.onSurfaceContainer,
    required this.error,
    required this.onError,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.surface,
    required this.onSurface,
    required this.success,
    required this.onSuccess,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.hint,
  });

  const TemboColorScheme.light({
    this.primary = DefaultTemboColors.primary,
    this.onPrimary = DefaultTemboColors.onPrimary,
    this.primaryContainer = DefaultTemboColors.primaryContainer,
    this.onPrimaryContainer = DefaultTemboColors.onPrimaryContainer,
    this.secondaryContainer = DefaultTemboColors.primaryContainer,
    this.onSecondaryContainer = DefaultTemboColors.onPrimaryContainer,
    this.secondary = DefaultTemboColors.secondary,
    this.onSecondary = DefaultTemboColors.onSecondary,
    this.border = DefaultTemboColors.border,
    this.background = DefaultTemboColors.background,
    this.onBackground = DefaultTemboColors.onBackground,
    this.surfaceContainer = DefaultTemboColors.surfaceContainer,
    this.onSurfaceContainer = DefaultTemboColors.onSurfaceContainer,
    this.error = DefaultTemboColors.error,
    this.onError = DefaultTemboColors.onError,
    this.surface = DefaultTemboColors.surface,
    this.onSurface = DefaultTemboColors.onSurface,
    this.success = DefaultTemboColors.success,
    this.onSuccess = DefaultTemboColors.onSuccess,
    this.hint = DefaultTemboColors.hint,
  });

  const TemboColorScheme.dark({
    this.primary = DarkTemboColors.primary,
    this.onPrimary = DarkTemboColors.onPrimary,
    this.primaryContainer = DarkTemboColors.primaryContainer,
    this.onPrimaryContainer = DarkTemboColors.onPrimaryContainer,
    this.secondaryContainer = DarkTemboColors.primaryContainer,
    this.onSecondaryContainer = DarkTemboColors.onPrimaryContainer,
    this.secondary = DarkTemboColors.secondary,
    this.onSecondary = DarkTemboColors.onSecondary,
    this.border = DarkTemboColors.border,
    this.background = DarkTemboColors.background,
    this.onBackground = DarkTemboColors.onBackground,
    this.surfaceContainer = DarkTemboColors.surfaceContainer,
    this.onSurfaceContainer = DarkTemboColors.onSurfaceContainer,
    this.error = DarkTemboColors.error,
    this.onError = DarkTemboColors.onError,
    this.surface = DarkTemboColors.surface,
    this.onSurface = DarkTemboColors.onSurface,
    this.success = DarkTemboColors.success,
    this.onSuccess = DarkTemboColors.onSuccess,
    this.hint = DarkTemboColors.hint,
  });

  @override
  String toString() {
    return 'TemboColorScheme(primary: $primary, onPrimary: $onPrimary, primaryContainer: $primaryContainer, onPrimaryContainer: $onPrimaryContainer, secondary: $secondary  , onSecondary: $onSecondary, secondaryContainer: $secondaryContainer, onSecondaryContainer: $onSecondaryContainer , border: $border, background: $background, onBackground: $onBackground, surfaceContainer: $surfaceContainer, onSurfaceContainer: $onSurfaceContainer, error: $error, onError: $onError, border: $border)';
  }
}

TemboColorScheme getTemboColorScheme() {
  return defaultDarkColorScheme;
}
