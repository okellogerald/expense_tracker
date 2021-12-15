import '../source.dart';

class CategoryPageBloc extends Cubit<CategoryPageState> {
  CategoryPageBloc(this.service) : super(CategoryPageState.initial());

  final CategoriesService service;

  static String selectedId = '-1';

  void init() {
    emit(CategoryPageState.loading(state.categoryList));
    final categoryList = service.getCategories();
    emit(CategoryPageState.content(categoryList, selectedId));
  }

  void rename(String newTitle, String id) {
    emit(CategoryPageState.loading(state.categoryList));
    final editedList = service.editTitle(newTitle, id);
    emit(CategoryPageState.content(editedList, '-1'));
  }

  void delete(String id) {
    emit(CategoryPageState.loading(state.categoryList));
    final editedList = service.deleteCategory(id);
    emit(CategoryPageState.content(editedList, '-1'));
  }

  void changeSelectedId(String id) {
    emit(CategoryPageState.loading(state.categoryList));
    selectedId = id;
    emit(CategoryPageState.content(state.categoryList, selectedId));
  }

  void cancel() => changeSelectedId('-1');
}
