import 'package:expense_tracker_v2/components/_common_imports.dart';
import 'package:expense_tracker_v2/navigation/global_keys.dart';

import '../components/snack_bar.dart';

Future<T?> push<T>(
  BuildContext context, {
  required Widget page,
  required String routeName,
}) async {
  final navigatorState = Navigator.of(context);
  return await navigatorState.push(MaterialPageRoute(
    builder: (_) => page,
    settings: RouteSettings(name: routeName),
  ));
}

void pop(context, [result]) {
  final navigatorState = Navigator.of(context);
  navigatorState.pop(result);
}

void popUntil(BuildContext context, {required String routeName}) {
  final navigatorState = Navigator.of(context);
  navigatorState.popUntil((route) => route.settings.name == routeName);
}

void pushAndRemoveUntil(BuildContext context, {required Widget page}) {
  final navigatorState = Navigator.of(context);
  navigatorState.pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => page), (route) => false);
}

void showLoadingMaterialBanner([String? message]) {
  rootScaffoldMessengerKey.currentState!.clearMaterialBanners();
  rootScaffoldMessengerKey.currentState!.showMaterialBanner(
    MaterialBanner(
      content: Text(message ?? "Loading..."),
      actions: const [AppLoadingIndicator(), SizedBox(width: 10)],
    ),
  );
}

void showSnackbar(
  String message, {
  bool isError = true,

  /// seconds
  int? duration,
  GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey,
  BuildContext? context,
}) {
  ScaffoldMessengerState? state;
  if (scaffoldMessengerKey != null) state = scaffoldMessengerKey.currentState;
  if (state == null && context != null) state = ScaffoldMessenger.of(context);
  state ??= rootScaffoldMessengerKey.currentState;

  state?.showSnackBar(AppSnackbar(
    message,
    isError: isError,
    durationInSeconds: duration,
  ));
}

void showInfoSnackbar(String message) => showSnackbar(
      message,
      isError: false,
    );
