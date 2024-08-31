import 'package:expense_tracker_v2/pages/category-add/page.dart';
import 'package:expense_tracker_v2/pages/expense-add/page.dart';
import 'package:expense_tracker_v2/components/category-icon-pick/page.dart';
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
      path: CategoryAddPage.routeName,
      builder: CategoryAddPage.builder,
    ),
    GoRoute(
      path: ExpenseCategoryIconSelectPage.routeName,
      builder: ExpenseCategoryIconSelectPage.builder,
    ),
    GoRoute(
      path: ExpenseCategorySelectPage.routeName,
      builder: ExpenseCategorySelectPage.builder,
    ),
  ],
);
