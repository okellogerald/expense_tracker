import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:supabase/supabase.dart' hide Provider;
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
    ..registerAdapter(TotalRecordsAdapter())
    ..registerAdapter(UserAdapter());

  await Hive.openBox(kCategories);
  await Hive.openBox(kPreferences);
  await Hive.openBox(kTotalRecords);
  await Hive.openBox(kRecords);
  await Hive.openBox(kBudgets);
  await Hive.openBox(kGrossAmounts);
  await Hive.openBox(kUser);

  IconCodePointGenerator.generate();

  PreferencesService.initPrefs();

  final client = SupabaseClient(kSupabaseEndpoint, kSupabaseSecret);
  final userService = UserService(client);

  final myApp = MultiProvider(
    providers: [
      Provider<CategoriesService>(create: (_) => CategoriesService()),
      Provider<PreferencesService>(create: (_) => PreferencesService()),
      Provider<RecordsService>(create: (_) => RecordsService()),
      Provider<BudgetsService>(create: (_) => BudgetsService()),
      Provider<GrossAmountsService>(create: (_) => GrossAmountsService()),
      //  Provider<UserService>(create: (_) => UserService(client)),
      Provider<OnBoardingPageBloc>(
          create: (_) => OnBoardingPageBloc(userService))
    ],
    child: const MyApp(),
  );

  runApp(myApp);
}
