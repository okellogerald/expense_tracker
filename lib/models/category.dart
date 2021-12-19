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
      this.id = 'id',
      this.title = 'Transport',
      this.type = kExpense});

  IconData get getIcon => AppIcons.fromCodePoint(codePoint);

  Category copyWith({String? id, String? title, int? codePoint, String? type}) {
    return Category(
      id: id ?? this.id,
      title: title ?? this.title,
      codePoint: codePoint ?? this.codePoint,
      type: type ?? this.type,
    );
  }
}
