import 'package:budgetting_app/services/budgets_service.dart';
import 'package:budgetting_app/services/gross_amounts_service.dart';
import 'package:budgetting_app/services/preferences_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';
import 'app.dart';
import 'constants.dart';
import 'models/models_source.dart';
import 'services/categories_service.dart';
import 'services/records_service.dart';

//todo: write tests
//todo: modify app-text-field-widget, to have its own error widget
//*by using the formstate validate method to call the validator, and when it 
//*does, it checks for any errors which will be added to the value notifier
//*and hence displayed to the user. But the error style will have a text size of
//* 0 so that it is not shown as well as doesn't take space. That space is 
//*occupied by a custom error widget.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  await Hive.openBox(kUser);

  PreferencesService.initPrefs();

  final myApp = MultiProvider(providers: [
    ChangeNotifierProvider<CategoriesService>(
        create: (_) => CategoriesService()),
    Provider<PreferencesService>(create: (_) => PreferencesService()),
    Provider<RecordsService>(create: (_) => RecordsService()),
    Provider<BudgetsService>(create: (_) => BudgetsService()),
    Provider<GrossAmountsService>(create: (_) => GrossAmountsService()),
  ], child: const MyApp());

  runApp(myApp);
}
