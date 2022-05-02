import 'package:hive/hive.dart';
import '../source.dart';

class PreferencesService {
  static final box = Hive.box(kPreferences);

  static void initPrefs() {
    if (box.isEmpty) {
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

  Map getPreferences() => {kWithTotalsList: box.get(kWithTotalsList)};
}
