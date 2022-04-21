import 'package:uuid/uuid.dart';
import '../source.dart';

class CategoriesPageBloc extends Cubit<CategoriesPageState> {
  CategoriesPageBloc(
    this.categoryService,
    this.prefsService,
    this.recordsService,
    this.budgetsService,
  ) : super(CategoriesPageState.initial()) {
    categoryService.addListener(() => _handleCategoryUpdates());
  }

  final CategoriesService categoryService;
  final PreferencesService prefsService;
  final RecordsService recordsService;
  final BudgetsService budgetsService;

  static const _dummyId = '-1';
  static const uuid = Uuid();

  void init({Category? category}) {
    final isOnEditPage = category != null;
    final idsList1 = recordsService.getCategoryIds();
    final idsList2 = budgetsService.getCategoryIds();
    final idsList = <String>{...idsList1, ...idsList2}.toList();

    if (isOnEditPage) {
      _updateForm(
          id: category.id,
          title: category.title,
          type: category.type,
          isEditing: true,
          idsList: idsList,
          codePoint: category.codePoint);
      return;
    }

    emit(CategoriesPageState.loading(state.categoryList, state.form));
    final categoryList = categoryService.getAll();
    final prefs = prefsService.getPreferences();
    final isAddCategoryTop = prefs[kAddCategoryPosition];
    final form = state.form.copyWith(
      undeletableCategories: idsList,
      position: isAddCategoryTop
          ? AddCategoryWidgetPosition.top
          : AddCategoryWidgetPosition.bottom,
    );
    emit(CategoriesPageState.content(categoryList, form));
  }

  void editCategory() {
    _validate();

    if (state.form.errors.isNotEmpty) return;

    final form = state.form;

    final category = Category(
      codePoint: form.codePoint,
      title: form.title,
      type: form.type,
      id: form.id,
    );

    categoryService.edit(form.id,
        title: form.title, codePoint: form.codePoint, type: form.type);
    recordsService.editSimilarCategories(category);
    budgetsService.editSimilarCategories(category);
    emit(CategoriesPageState.success(
        state.categoryList, state.form.copyWith(id: _dummyId)));
  }

  void addCategory() {
    _validate();

    if (state.form.errors.isNotEmpty) return;

    final form = state.form;
    final id = uuid.v4();

    categoryService.add(
        id: id, title: form.title, type: form.type, codePoint: form.codePoint);
    emit(CategoriesPageState.success(state.categoryList, form));
  }

  void deleteCategory() {
    emit(CategoriesPageState.loading(state.categoryList, state.form));
    final id = state.form.id;
    final editedList = categoryService.delete(id);
    emit(CategoriesPageState.content(
        editedList, state.form.copyWith(id: _dummyId)));
  }

  void cancel() => _updateForm(id: _dummyId);

  void updateId(String id) => _updateForm(id: id);

  void updateTitle(String title) => _updateForm(title: title.trim());

  void updatecodePoint(int codePoint) => _updateForm(codePoint: codePoint);

  void updateType(String type) => _updateForm(type: type);

  void updatePosition(AddCategoryWidgetPosition position) =>
      _updateForm(position: position);

  void _updateForm(
      {String? id,
      String? type,
      AddCategoryWidgetPosition? position,
      String? title,
      int? codePoint,
      List<String>? idsList,
      bool? isEditing}) {
    emit(CategoriesPageState.loading(state.categoryList, state.form));
    final form = state.form;
    final formattedSupplements = form.copyWith(
      id: id ?? form.id,
      type: type ?? form.type,
      isEditing: isEditing ?? form.isEditing,
      title: title ?? form.title,
      position: position ?? form.position,
      codePoint: codePoint ?? form.codePoint,
      undeletableCategories: idsList ?? form.undeletableCategories,
    );
    if (position != null) {
      final isAddCategoryWidgetTop = position == AddCategoryWidgetPosition.top;
      prefsService.updatePreferences(isAddCategoryTop: isAddCategoryWidgetTop);
    }
    emit(CategoriesPageState.content(state.categoryList, formattedSupplements));
  }

  _validate() {
    emit(CategoriesPageState.loading(state.categoryList, state.form));
    var supplements = state.form;
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
      supplements = state.form.copyWith(errors: {});
      emit(CategoriesPageState.content(state.categoryList, supplements));
    }
  }

  _handleCategoryUpdates() {
    emit(CategoriesPageState.loading(state.categoryList, state.form));
    final supplements = state.form.copyWith(id: _dummyId);
    final categories = categoryService.getCategories;
    log('updates');
    log('${categories.length}');
    emit(CategoriesPageState.content(categories, supplements));
  }
}
