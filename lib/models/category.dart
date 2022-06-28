import 'package:budgetting_app/source.dart';
import 'package:hive/hive.dart';

part 'category.g.dart';

@HiveType(typeId: 0)
class Category extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final int codePoint;

  @HiveField(3)
  final String type;

  Category(
      {this.codePoint = 0xe800,
      this.id = '-1',
      this.title = 'Transport',
      this.type = kIncome});

  factory Category.empty() => Category();

  IconData get getIcon => AppIcons.getIcon(codePoint);

  Category copyWith({String? id, String? title, int? codePoint, String? type}) {
    return Category(
      id: id ?? this.id,
      title: title ?? this.title,
      codePoint: codePoint ?? this.codePoint,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {"id": id, "title": title, "codePoint": codePoint, "type": type};
  }
}
