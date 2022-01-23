import 'package:budgetting_app/source.dart';
import 'package:hive/hive.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenSizeInit(
      designSize: const Size(411.4, 866.3),
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: kFontFam,
            scaffoldBackgroundColor: AppColors.background,
          ),
          home: _returnFirstpage()),
    );
  }

  _returnFirstpage() {
    final user = Hive.box(kUser).get(kUser) as User?;

    if (user == null) {
      return const LoginPage();
    } else if (user.isProfileComplete) {
      return const RecordsPage();
    } else if (!user.isProfileComplete) {
      return AdditionalInfoPage(user: user);
    }
  }
}
