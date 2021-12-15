import 'package:hive/hive.dart';
import '../source.dart';

class CategoriesService {
  static final box = Hive.box(cCategoriesBox);
  static var currentCategories = <Category>[];

  List<Category> getCategories() {
    if (box.isEmpty) {
      final categoryList = cDefaultCategoriesList;
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

  List<Category> editTitle(String newTitle, String id) {
    final oldCategory = box.get(id) as Category;
    final editedCategory = oldCategory.copyWith(title: newTitle);
    final index = currentCategories.indexWhere((e) => e.id == id);
    currentCategories[index] = editedCategory;
    box.put(id, editedCategory);
    return currentCategories;
  }

  List<Category> deleteCategory(String id) {
    final index = currentCategories.indexWhere((e) => e.id == id);
    currentCategories.removeAt(index);
    box.delete(id);
    return currentCategories;
  }
}
