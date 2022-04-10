import 'package:flutter/services.dart';

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
          alignment: TextAlign.start,
          color: AppColors.onError,
          size: 14.dw,
          family: kFontFam2)));
}

Future<bool> showExitAppDialog(BuildContext context) async {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.onBackground,
          title: AppText(
            'Are you sure to close the application ?',
            size: 16.dw,
            family: kFontFam2,
            color: AppColors.onPrimary,
          ),
          contentPadding: EdgeInsets.fromLTRB(15.dw, 25.dh, 15.dw, 15.dh),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppTextButton(
                    onPressed: SystemNavigator.pop,
                    text: 'Exit',
                    height: 40.dh,
                    buttonColor: AppColors.disabled),
              ),
              SizedBox(height: 15.dw),
              Expanded(
                child: AppTextButton(
                    onPressed: () => Navigator.pop(context),
                    text: 'Cancel',
                    height: 40.dh,
                    buttonColor: AppColors.primary),
              )
            ],
          ),
        );
      });

  return true;
}
