import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import '../source.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await path_provider.getApplicationDocumentsDirectory();

  Hive
    ..init(directory.path)
    ..registerAdapter(CategoryAdapter())
    ..registerAdapter(RecordAdapter())
    ..registerAdapter(BudgetAdapter())
    ..registerAdapter(GrossAmountAdapter())
    ..registerAdapter(TotalRecordsAdapter());

  await Hive.openBox(kCategories);
  await Hive.openBox(kPreferences);
  await Hive.openBox(kTotalRecords);
  await Hive.openBox(kRecords);
  await Hive.openBox(kBudgets);
  await Hive.openBox(kGrossAmounts);

  IconCodePointGenerator.generate(54);

  PreferencesService.initPrefs();

  final myApp = MultiProvider(
    providers: [
      Provider<CategoriesService>(create: (_) => CategoriesService()),
      Provider<PreferencesService>(create: (_) => PreferencesService()),
      Provider<RecordsService>(create: (_) => RecordsService()),
      Provider<BudgetsService>(create: (_) => BudgetsService()),
      Provider<GrossAmountsService>(create: (_) => GrossAmountsService()),
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ],
    child: const MyApp(),
  );

  runApp(myApp);
}
