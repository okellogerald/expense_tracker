import '../source.dart';

class CategoriesPageBloc extends Cubit<CategoriesPageState> {
  CategoriesPageBloc(this.categoryService, this.prefsService)
      : super(CategoriesPageState.initial()) {
    _handleCategoryStream();
  }

  final CategoriesService categoryService;
  final PreferencesService prefsService;

  static const _dummyId = '-1';

  void init({Category? category}) {
    final isOnEditPage = category != null;

    if (isOnEditPage) {
      _updateSupplements(
          id: category.id,
          title: category.title,
          type: category.type,
          isEditing: true,
          codePoint: category.codePoint);
      return;
    }

    final prefs = prefsService.getPreferences();
    final isAddCategoryTop = prefs?.isAddCategoryWidgetTop ?? true;
    emit(CategoriesPageState.loading(state.categoryList, state.supplements));
    final categoryList = categoryService.getCategories();
    final supplements = state.supplements.copyWith(
      position: isAddCategoryTop
          ? AddCategoryWidgetPosition.top
          : AddCategoryWidgetPosition.bottom,
    );
    emit(CategoriesPageState.content(categoryList, supplements));
  }

  void editCategory() {
    _validate();

    if (state.supplements.errors.isNotEmpty) return;

    final supplements = state.supplements;

    categoryService.edit(supplements.id,
        title: supplements.title,
        codePoint: supplements.codePoint,
        type: supplements.type);
    emit(CategoriesPageState.success(
        state.categoryList, state.supplements.copyWith(id: _dummyId)));
  }

  void addCategory() {
    _validate();

    if (state.supplements.errors.isNotEmpty) return;

    final supplements = state.supplements;

    categoryService.add(
        title: supplements.title,
        type: supplements.type,
        codePoint: supplements.codePoint);
    emit(CategoriesPageState.success(state.categoryList, supplements));
  }

  void deleteCategory() {
    emit(CategoriesPageState.loading(state.categoryList, state.supplements));
    final editedList = categoryService.delete(state.supplements.id);
    emit(CategoriesPageState.content(
        editedList, state.supplements.copyWith(id: _dummyId)));
  }

  void cancel() => _updateSupplements(id: _dummyId);

  void updateId(String id) => _updateSupplements(id: id);

  void updateTitle(String title) => _updateSupplements(title: title.trim());

  void updatecodePoint(int codePoint) =>
      _updateSupplements(codePoint: codePoint);

  void updateType(String type) => _updateSupplements(type: type);

  void updatePosition(AddCategoryWidgetPosition position) =>
      _updateSupplements(position: position);

  void _updateSupplements(
      {String? id,
      String? title,
      String? type,
      AddCategoryWidgetPosition? position,
      int? codePoint,
      bool? isEditing}) {
    final supplements = state.supplements;
    final formattedSupplements = supplements.copyWith(
      id: id ?? supplements.id,
      title: title ?? supplements.title,
      type: type ?? supplements.type,
      isEditing: isEditing ?? supplements.isEditing,
      position: position ?? supplements.position,
      codePoint: codePoint ?? supplements.codePoint,
    );
    if (position != null) {
      final isAddCategoryWidgetTop = position == AddCategoryWidgetPosition.top;
      prefsService.updatePreferences(isAddCategoryTop: isAddCategoryWidgetTop);
    }
    emit(CategoriesPageState.content(state.categoryList, formattedSupplements));
  }

  _validate() {
    emit(CategoriesPageState.loading(state.categoryList, state.supplements));
    var supplements = state.supplements;
    final title = supplements.title;
    final categoryExists =
        categoryService.checkIfExists(title) && !supplements.isEditing;

    if (title.isEmpty) {
      supplements =
          supplements.copyWith(errors: {'title': 'The title can\'t be empty'});
      emit(CategoriesPageState.content(state.categoryList, supplements));
    } else if (categoryExists) {
      supplements = supplements
          .copyWith(errors: {'title': 'This category name already exists'});
      emit(CategoriesPageState.content(state.categoryList, supplements));
    } else {
      supplements = state.supplements.copyWith(errors: {});
      emit(CategoriesPageState.content(state.categoryList, supplements));
    }
  }

  _handleCategoryStream() {
    categoryService.categoryStream.listen((categories) {
      emit(CategoriesPageState.loading(state.categoryList, state.supplements));
      final supplements = state.supplements.copyWith(id: _dummyId);
      emit(CategoriesPageState.content(categories, supplements));
    });
  }
}
