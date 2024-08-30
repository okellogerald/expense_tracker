import '/navigation/global_keys.dart';

import '/constants/source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'navigation/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final app = ProviderScope(
    child: MaterialApp.router(
      routerConfig: router,
      title: 'Expense Tracker',
      debugShowCheckedModeBanner: false,
      theme: defaultDarkTheme,
      themeMode: ThemeMode.dark,
      scaffoldMessengerKey: rootScaffoldMessengerKey,
    ),
  );

  runApp(app);
}
