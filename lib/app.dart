import 'package:budgetting_app/providers/user_details_provider.dart';
import 'package:budgetting_app/source.dart' hide Consumer;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'theme/app_theme.dart';
import 'utils/navigation_logic.dart';

//todo solve facebook integration errors
//todo change icon and on-boarding images' colors

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
              home: _getFirstPage())),
    );
  }

  Widget _getFirstPage() {
    return Consumer(
      builder: (_, ref, child) {
        final user = ref.read(signedInUserProvider);
        if (user == null) return const LoginPage();
        return const MainPage();
      },
    );
  }
}
