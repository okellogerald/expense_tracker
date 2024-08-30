import '../constants/themes/color_scheme.dart';
import './_common_imports.dart';

class AppSnackbar extends SnackBar {
  final String message;
  final int? durationInSeconds;

  final bool isError;

  AppSnackbar(
    this.message, {
    super.key,
    this.isError = false,
    this.durationInSeconds,
  }) : super(
          content: _Content(message, isError),
        );

  AppSnackbar.error(this.message, {super.key, this.durationInSeconds})
      : isError = true,
        super(
          content: _Content(message, true),
        );

  TemboColorScheme get scheme {
    return getTemboColorScheme();
  }

  @override
  Color? get backgroundColor => isError ? scheme.error : scheme.primary;

  @override
  SnackBarBehavior? get behavior => SnackBarBehavior.floating;

  @override
  ShapeBorder? get shape =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(5));

  @override
  double? get elevation => 0;

  @override
  Duration get duration => Duration(seconds: durationInSeconds ?? 2);
}

class _Content extends StatelessWidget {
  final bool isError;
  final String message;
  const _Content(this.message, this.isError);

  TemboColorScheme get scheme {
    return getTemboColorScheme();
  }

  @override
  Widget build(BuildContext context) {
    return AppText(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: isError ? scheme.onError : scheme.onPrimary,
        fontSize: 14,
      ),
    );
  }
}
