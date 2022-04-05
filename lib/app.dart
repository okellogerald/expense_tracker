import 'package:budgetting_app/source.dart';

import 'theme/app_theme.dart';
import 'utils/navigation_logic.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenSizeInit(
        designSize: const Size(411.4, 866.3),
        child: MaterialApp(
            title: 'Flutter Demo',
            navigatorKey: navigatorKey,
            theme: AppTheme.theme,
            debugShowCheckedModeBanner: false,
            home: _returnFirstPage(context)));
  }

  Widget _returnFirstPage(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    if (!userService.isUserLoggedIn) return const LoginPage();
    return const MainPage();
  }
}
