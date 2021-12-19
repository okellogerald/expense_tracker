import 'package:budgetting_app/models/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../source.dart';

part 'category_page_state.freezed.dart';

@freezed
class CategoryPageState with _$CategoryPageState {
  const factory CategoryPageState.loading(List<Category> categoryList, Supplements supplements) = _Loading;
  const factory CategoryPageState.content(List<Category> categoryList, Supplements supplements) = _Content;
  const factory CategoryPageState.success(List<Category> categoryList, Supplements supplements) = _Success;

  factory CategoryPageState.initial() => const CategoryPageState.content([], Supplements());
}
