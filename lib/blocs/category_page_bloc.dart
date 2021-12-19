import '../source.dart';

class CategoryPageBloc extends Cubit<CategoryPageState> {
  CategoryPageBloc(this.service) : super(CategoryPageState.initial()) {
    _handleCategoryStream();
  }

  final CategoryService service;

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
    emit(CategoryPageState.loading(state.categoryList, state.supplements));
    final categoryList = service.getCategories();
    emit(CategoryPageState.content(categoryList, state.supplements));
  }

  void editCategory() {
    _validate();

    if (state.supplements.errors.isNotEmpty) return;

    final supplements = state.supplements;

    service.edit(supplements.id,
        title: supplements.title,
        codePoint: supplements.codePoint,
        type: supplements.type);
    emit(CategoryPageState.success(
        state.categoryList, state.supplements.copyWith(id: _dummyId)));
  }

  void addCategory() {
    _validate();

    if (state.supplements.errors.isNotEmpty) return;

    final supplements = state.supplements;

    service.add(
        title: supplements.title,
        type: supplements.type,
        codePoint: supplements.codePoint);
    emit(CategoryPageState.success(state.categoryList, supplements));
  }

  void deleteCategory() {
    emit(CategoryPageState.loading(state.categoryList, state.supplements));
    final editedList = service.deleteCategory(state.supplements.id);
    emit(CategoryPageState.content(
        editedList, state.supplements.copyWith(id: _dummyId)));
  }

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
    emit(CategoryPageState.content(state.categoryList, formattedSupplements));
  }

  _validate() {
    emit(CategoryPageState.loading(state.categoryList, state.supplements));
    var supplements = state.supplements;
    final title = supplements.title;
    final categoryExists =
        service.checkIfExists(title) && !supplements.isEditing;

    if (title.isEmpty) {
      supplements =
          supplements.copyWith(errors: {'title': 'The title can\'t be empty'});
      emit(CategoryPageState.content(state.categoryList, supplements));
    } else if (categoryExists) {
      supplements = supplements
          .copyWith(errors: {'title': 'This category name already exists'});
      emit(CategoryPageState.content(state.categoryList, supplements));
    } else {
      supplements = state.supplements.copyWith(errors: {});
      emit(CategoryPageState.content(state.categoryList, supplements));
    }
  }

  _handleCategoryStream() {
    service.categoryStream.listen((categories) {
      emit(CategoryPageState.loading(state.categoryList, state.supplements));
      final supplements = state.supplements.copyWith(id: _dummyId);
      emit(CategoryPageState.content(categories, supplements));
    });
  }

  void cancel() => _updateSupplements(id: _dummyId);

  void updateId(String id) => _updateSupplements(id: id);

  void updateTitle(String title) => _updateSupplements(title: title.trim());

  void updatecodePoint(int codePoint) =>
      _updateSupplements(codePoint: codePoint);

  void updateType(String type) => _updateSupplements(type: type);

  void updatePosition(AddCategoryWidgetPosition position) =>
      _updateSupplements(position: position);
}
