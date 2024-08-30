import 'package:expense_tracker_v2/pages/expense-add/page.dart';
import 'package:expense_tracker_v2/pages/expense-category-select/page.dart';

import '/navigation/global_keys.dart';

import 'main-page/page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  navigatorKey: rootNavKey,
  routes: [
    GoRoute(
      path: MainPage.routeName,
      builder: MainPage.builder,
    ),
    GoRoute(
      path: ExpenseAddPage.routeName,
      builder: ExpenseAddPage.builder,
    ),
    GoRoute(
      path: ExpenseCategorySelect.routeName,
      builder: ExpenseCategorySelect.builder,
    ),
  ],
);
