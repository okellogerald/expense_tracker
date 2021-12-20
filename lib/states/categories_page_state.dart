import 'package:freezed_annotation/freezed_annotation.dart';
import '../source.dart';

part 'categories_page_state.freezed.dart';

@freezed
class CategoriesPageState with _$CategoriesPageState {
  const factory CategoriesPageState.loading(List<Category> categoryList, Supplements supplements) = _Loading;
  const factory CategoriesPageState.content(List<Category> categoryList, Supplements supplements) = _Content;
  const factory CategoriesPageState.success(List<Category> categoryList, Supplements supplements) = _Success;

  factory CategoriesPageState.initial() => const CategoriesPageState.content([], Supplements());
}
