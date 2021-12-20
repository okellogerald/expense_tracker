import 'dart:async';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import '../source.dart';

class CategoriesService {
  static final box = Hive.box(kCategoriesBox);
  static var currentCategories = <Category>[];
  static const uuid = Uuid();

  static final categoryController =
      StreamController<List<Category>>.broadcast();
  Stream<List<Category>> get categoryStream => categoryController.stream;

  List<Category> getCategories() {
    if (box.isEmpty) {
      final categoryList = kDefaultCategoriesList;
      for (Category category in categoryList) {
        box.put(category.id, category);
      }
      currentCategories = categoryList;
      return categoryList;
    }

    currentCategories.clear();

    for (var e in box.values) {
      currentCategories.add(e);
    }

    return currentCategories;
  }

  void edit(String id, {String? title, int? codePoint, String? type}) {
    final oldCategory = box.get(id) as Category;
    final editedCategory =
        oldCategory.copyWith(title: title, codePoint: codePoint, type: type);
    final index = currentCategories.indexWhere((e) => e.id == id);
    currentCategories[index] = editedCategory;
    box.put(id, editedCategory);
    categoryController.add(currentCategories);
  }

  void add(
      {required String title, required String type, required int codePoint}) {
    final id = uuid.v4();
    final category =
        Category(title: title, type: type, codePoint: codePoint, id: id);
    box.put(id, category);
    currentCategories.add(category);
    categoryController.add(currentCategories);
  }

  List<Category> delete(String id) {
    final index = currentCategories.indexWhere((e) => e.id == id);
    currentCategories.removeAt(index);
    box.delete(id);
    return currentCategories;
  }

  bool checkIfExists(String title) {
    bool doesExist = false;
    for (Category category in currentCategories) {
      if (category.title == title) {
        doesExist = true;
        break;
      }
    }
    return doesExist;
  }
}
