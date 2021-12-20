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
    ..registerAdapter(TotalRecordsAdapter())
    ..registerAdapter(PreferencesAdapter());

  await Hive.openBox(kCategoriesBox);
  await Hive.openBox(kPreferencesBox);
  await Hive.openBox(kRecords);
  await Hive.openBox(kTotalRecords);

  IconCodePointGenerator.generate(54);

  final myApp = MultiProvider(
    providers: [
      Provider<CategoriesService>(create: (_) => CategoriesService()),
      Provider<PreferencesService>(create: (_) => PreferencesService()),
      Provider<RecordsService>(create: (_) => RecordsService()),
    ],
    child: const MyApp(),
  );

  runApp(myApp);
}
