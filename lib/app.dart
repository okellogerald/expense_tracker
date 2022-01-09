import 'package:budgetting_app/source.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final appColors = AppColors(themeProvider.getCurrentTheme);

    return ScreenSizeInit(
      designSize: const Size(411.4, 866.3),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: kFontFam,
          scaffoldBackgroundColor: appColors.backgroundColor,
        ),
        home: const Homepage(),
      ),
    );
  }
}
