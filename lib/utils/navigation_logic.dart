import '../source.dart';
import '../widgets/app_snackbar.dart';
import '../widgets/exit_app_dialog.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void push(Widget page) async => await navigatorKey.currentState
    ?.push(MaterialPageRoute(builder: (_) => page));

void pushAndRemoveUntil(Widget page) async =>
    await navigatorKey.currentState?.pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => page), (route) => false);

void pop() => navigatorKey.currentState?.pop();

///uses either the scaffold key or the context to show the snackbar
void showSnackBar(String message,
    {BuildContext? context, GlobalKey<ScaffoldState>? key, bool isError = true}) {
  if (context != null) _showSnackBarCallback(context, message, isError);
  if (key != null) {
    if (key.currentState == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showSnackBarCallback(key.currentContext!, message, isError);
      });
    } else {
      _showSnackBarCallback(key.currentContext!, message, isError);
    }
  }
}

void _showSnackBarCallback(BuildContext context, String message, bool isError) =>
    ScaffoldMessenger.of(context).showSnackBar(AppSnackBar(message, isError));

Future<bool> showExitAppDialog(BuildContext context) async {
  showDialog(
      context: context,
      builder: (context) {
        return const ExitAppDialog();
      });

  return true;
}
