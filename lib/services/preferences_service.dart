import 'package:hive/hive.dart';
import '../source.dart';

class PreferencesService {
  static final box = Hive.box(kPreferences);

  static void initPrefs() {
    if (box.isEmpty) {
      box.put(kAddCategoryPosition, true);
      box.put(kWithTotalsList, <int>[]);
    }
  }

  List _editWithTotalsPrefs(int day, bool isAdding) {
    final withTotalDays = box.get(kWithTotalsList);
    if (isAdding) withTotalDays.add(day);
    if (!isAdding) withTotalDays.remove(day);
    box.put(kWithTotalsList, withTotalDays);
    return withTotalDays;
  }

  List addDayToWithTotalsPrefs(int day) => _editWithTotalsPrefs(day, true);

  List removeFromWithTotalsPrefs(int day) => _editWithTotalsPrefs(day, false);

  void updatePreferences({bool? isAddCategoryTop}) {
    final prefs = getPreferences();
    box.put(
        kAddCategoryPosition, isAddCategoryTop ?? prefs[kAddCategoryPosition]);
  }

  Map getPreferences() => {
        kAddCategoryPosition: box.get(kAddCategoryPosition),
        kWithTotalsList: box.get(kWithTotalsList)
      };
}
