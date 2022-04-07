import 'package:freezed_annotation/freezed_annotation.dart';
import '../source.dart';

part 'generated/categories_page_state.freezed.dart';

@freezed
class CategoriesPageState with _$CategoriesPageState {
  const factory CategoriesPageState.loading(List<Category> categoryList, CategoryForm form) = _Loading;
  const factory CategoriesPageState.content(List<Category> categoryList, CategoryForm form) = _Content;
  const factory CategoriesPageState.success(List<Category> categoryList, CategoryForm form) = _Success;

  factory CategoriesPageState.initial() => const CategoriesPageState.content([], CategoryForm());
}
