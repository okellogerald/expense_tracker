import 'package:budgetting_app/source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'theme/app_theme.dart';
import 'utils/navigation_logic.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: ScreenSizeInit(
        designSize: const Size(411.4, 866.3),
        child: MaterialApp(
          title: 'Flutter Demo',
          navigatorKey: navigatorKey,
          theme: AppTheme.theme,
          debugShowCheckedModeBanner: false,
          // home: const PhoneAuthPage(),
          home: const MainPage(),
        ),
      ),
    );
  }
}
