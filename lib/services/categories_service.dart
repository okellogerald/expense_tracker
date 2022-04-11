import 'package:hive/hive.dart';
import '../source.dart';

class CategoriesService extends ChangeNotifier {
  static final categoriesBox = Hive.box(kCategories);
  static var _currentCategories = <Category>[];

  List<Category> get getCategories => _currentCategories;

  List<Category> getAll() {
    if (categoriesBox.isEmpty) {
      final categoryList = kDefaultCategoriesList;
      for (Category category in categoryList) {
        categoriesBox.put(category.id, category);
      }
      _currentCategories = categoryList;
      return categoryList;
    }

    _currentCategories.clear();

    for (var e in categoriesBox.values) {
      _currentCategories.add(e);
    }

    return _currentCategories;
  }

  void edit(String id, {String? title, int? codePoint, String? type}) {
    final oldCategory = categoriesBox.get(id) as Category;
    final editedCategory =
        oldCategory.copyWith(title: title, codePoint: codePoint, type: type);
    final index = _currentCategories.indexWhere((e) => e.id == id);
    _currentCategories[index] = editedCategory;
    categoriesBox.put(id, editedCategory);
    notifyListeners();
  }

  void add(
      {required String title,
      required String type,
      required int codePoint,
      required String id}) {
    final category =
        Category(title: title, type: type, codePoint: codePoint, id: id);
    categoriesBox.put(id, category);
    _currentCategories.add(category);
    notifyListeners();
  }

  List<Category> delete(String id) {
    final index = _currentCategories.indexWhere((e) => e.id == id);
    _currentCategories.removeAt(index);
    categoriesBox.delete(id);
    return _currentCategories;
  }

  bool checkIfExists(String title) {
    bool doesExist = false;
    for (Category category in _currentCategories) {
      if (category.title == title) {
        doesExist = true;
        break;
      }
    }
    return doesExist;
  }
}
