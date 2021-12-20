import 'package:hive/hive.dart';

part 'preferences.g.dart';

@HiveType(typeId: 1)
class Preferences extends HiveObject {
  @HiveField(0)
  final bool isAddCategoryWidgetTop;

  Preferences({this.isAddCategoryWidgetTop = true});

  Preferences copyWith({bool? isAddCategoryWidgetTop}) {
    return Preferences(
        isAddCategoryWidgetTop:
            isAddCategoryWidgetTop ?? this.isAddCategoryWidgetTop);
  }
}
