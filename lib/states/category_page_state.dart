import 'package:budgetting_app/models/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_page_state.freezed.dart';

@freezed
class CategoryPageState with _$CategoryPageState {
  const factory CategoryPageState.loading(List<Category> categoryList) = _Loading;
  const factory CategoryPageState.content(List<Category> categoryList, String selectedId) = _Content;

  factory CategoryPageState.initial() => const CategoryPageState.content([], '-1');
}
