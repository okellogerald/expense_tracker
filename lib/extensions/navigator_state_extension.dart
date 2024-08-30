import 'package:flutter/material.dart';

extension NavigatorExtension on GlobalKey<NavigatorState> {
  Future<T?> push<T>(Widget page, {String? routeName}) async {
    return await currentState?.push<T>(_createRouteFor(page, routeName));
  }

  dynamic pop([result]) {
    currentState?.pop(result);
  }

  void popUntil(bool Function(Route r) predicate) {
    currentState?.popUntil(predicate);
  }

  void popToFirstPage() {
    currentState?.popUntil((route) => route.isFirst);
  }

  Future<T?> removeAllAndPush<T>(Widget page) async {
    return await currentState?.pushAndRemoveUntil<T>(
      _createRouteFor<T>(page),
      (route) => false,
    );
  }
}

PageRouteBuilder<T> _createRouteFor<T>(Widget page, [String? name]) {
  return _SlideRightRoute<T>(page: page, name: name);
}

class _SlideRightRoute<T> extends PageRouteBuilder<T> {
  _SlideRightRoute({required Widget page, String? name})
      : super(
          settings: RouteSettings(name: name),
          pageBuilder: (_, __, ___) {
            return page;
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(10.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}
