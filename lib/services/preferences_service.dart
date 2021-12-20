import 'package:hive/hive.dart';
import '../source.dart';

class PreferencesService {
  static final box = Hive.box(kPreferencesBox);

  void updatePreferences({bool? isAddCategoryTop}) {
    final prefs = box.get(kPrefs) as Preferences?;
    if (prefs == null) {
      box.put(kPrefs,
          Preferences(isAddCategoryWidgetTop: isAddCategoryTop ?? true));
      return;
    }
    box.put(kPrefs, prefs.copyWith(isAddCategoryWidgetTop: isAddCategoryTop));
  }

  Preferences? getPreferences() => box.get(kPrefs) as Preferences?;
}
