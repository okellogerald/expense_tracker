import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import '../source.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await path_provider.getApplicationDocumentsDirectory();

  Hive
    ..init(directory.path)
    ..registerAdapter(CategoryAdapter());

  await Hive.openBox(cCategoriesBox);

  final myApp = MultiProvider(
    providers: [
      Provider<CategoriesService>(create: (_) => CategoriesService())
    ],
    child: const MyApp(),
  );

  runApp(myApp);
}
