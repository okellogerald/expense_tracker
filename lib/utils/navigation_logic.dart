import '../source.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void push(Widget page) async => await navigatorKey.currentState
    ?.push(MaterialPageRoute(builder: (_) => page));

void pushAndRemoveUntil(Widget page) async =>
    await navigatorKey.currentState?.pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => page), (route) => false);

void pop() => navigatorKey.currentState?.pop();

void showSnackBar(String message,
    {BuildContext? context, GlobalKey<ScaffoldState>? scaffoldKey}) {
  assert((context == null && scaffoldKey == null),
      "Either context or scaffold Key should be provided");
  if (context != null) _showSnackBarCallback(context, message);
  if (scaffoldKey != null) {
    if (scaffoldKey.currentState == null) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        _showSnackBarCallback(scaffoldKey.currentContext!, message);
      });
    } else {
      _showSnackBarCallback(scaffoldKey.currentContext!, message);
    }
  }
}

void _showSnackBarCallback(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 0,
      dismissDirection: DismissDirection.none,
      backgroundColor: AppColors.error,
      content: AppText(message,
          color: AppColors.onError, size: 14.dw, family: kFontFam2)));
}
