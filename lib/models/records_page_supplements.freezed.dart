// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'records_page_supplements.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RecordsPageSupplementsTearOff {
  const _$RecordsPageSupplementsTearOff();

  _RecordsPageSupplements call(
      {required TotalRecords totalRecords,
      dynamic type = kIncome,
      dynamic amount = 0,
      List<Category> categoryList = const [],
      Map<String, dynamic> errors = const {},
      required Category category}) {
    return _RecordsPageSupplements(
      totalRecords: totalRecords,
      type: type,
      amount: amount,
      categoryList: categoryList,
      errors: errors,
      category: category,
    );
  }
}

/// @nodoc
const $RecordsPageSupplements = _$RecordsPageSupplementsTearOff();

/// @nodoc
mixin _$RecordsPageSupplements {
  TotalRecords get totalRecords => throw _privateConstructorUsedError;
  dynamic get type => throw _privateConstructorUsedError;
  dynamic get amount => throw _privateConstructorUsedError;
  List<Category> get categoryList => throw _privateConstructorUsedError;
  Map<String, dynamic> get errors => throw _privateConstructorUsedError;
  Category get category => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecordsPageSupplementsCopyWith<RecordsPageSupplements> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordsPageSupplementsCopyWith<$Res> {
  factory $RecordsPageSupplementsCopyWith(RecordsPageSupplements value,
          $Res Function(RecordsPageSupplements) then) =
      _$RecordsPageSupplementsCopyWithImpl<$Res>;
  $Res call(
      {TotalRecords totalRecords,
      dynamic type,
      dynamic amount,
      List<Category> categoryList,
      Map<String, dynamic> errors,
      Category category});
}

/// @nodoc
class _$RecordsPageSupplementsCopyWithImpl<$Res>
    implements $RecordsPageSupplementsCopyWith<$Res> {
  _$RecordsPageSupplementsCopyWithImpl(this._value, this._then);

  final RecordsPageSupplements _value;
  // ignore: unused_field
  final $Res Function(RecordsPageSupplements) _then;

  @override
  $Res call({
    Object? totalRecords = freezed,
    Object? type = freezed,
    Object? amount = freezed,
    Object? categoryList = freezed,
    Object? errors = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      totalRecords: totalRecords == freezed
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as TotalRecords,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as dynamic,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      categoryList: categoryList == freezed
          ? _value.categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      errors: errors == freezed
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
    ));
  }
}

/// @nodoc
abstract class _$RecordsPageSupplementsCopyWith<$Res>
    implements $RecordsPageSupplementsCopyWith<$Res> {
  factory _$RecordsPageSupplementsCopyWith(_RecordsPageSupplements value,
          $Res Function(_RecordsPageSupplements) then) =
      __$RecordsPageSupplementsCopyWithImpl<$Res>;
  @override
  $Res call(
      {TotalRecords totalRecords,
      dynamic type,
      dynamic amount,
      List<Category> categoryList,
      Map<String, dynamic> errors,
      Category category});
}

/// @nodoc
class __$RecordsPageSupplementsCopyWithImpl<$Res>
    extends _$RecordsPageSupplementsCopyWithImpl<$Res>
    implements _$RecordsPageSupplementsCopyWith<$Res> {
  __$RecordsPageSupplementsCopyWithImpl(_RecordsPageSupplements _value,
      $Res Function(_RecordsPageSupplements) _then)
      : super(_value, (v) => _then(v as _RecordsPageSupplements));

  @override
  _RecordsPageSupplements get _value => super._value as _RecordsPageSupplements;

  @override
  $Res call({
    Object? totalRecords = freezed,
    Object? type = freezed,
    Object? amount = freezed,
    Object? categoryList = freezed,
    Object? errors = freezed,
    Object? category = freezed,
  }) {
    return _then(_RecordsPageSupplements(
      totalRecords: totalRecords == freezed
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as TotalRecords,
      type: type == freezed ? _value.type : type,
      amount: amount == freezed ? _value.amount : amount,
      categoryList: categoryList == freezed
          ? _value.categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      errors: errors == freezed
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
    ));
  }
}

/// @nodoc

class _$_RecordsPageSupplements extends _RecordsPageSupplements {
  const _$_RecordsPageSupplements(
      {required this.totalRecords,
      this.type = kIncome,
      this.amount = 0,
      this.categoryList = const [],
      this.errors = const {},
      required this.category})
      : super._();

  @override
  final TotalRecords totalRecords;
  @JsonKey()
  @override
  final dynamic type;
  @JsonKey()
  @override
  final dynamic amount;
  @JsonKey()
  @override
  final List<Category> categoryList;
  @JsonKey()
  @override
  final Map<String, dynamic> errors;
  @override
  final Category category;

  @override
  String toString() {
    return 'RecordsPageSupplements(totalRecords: $totalRecords, type: $type, amount: $amount, categoryList: $categoryList, errors: $errors, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecordsPageSupplements &&
            const DeepCollectionEquality()
                .equals(other.totalRecords, totalRecords) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality()
                .equals(other.categoryList, categoryList) &&
            const DeepCollectionEquality().equals(other.errors, errors) &&
            const DeepCollectionEquality().equals(other.category, category));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(totalRecords),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(categoryList),
      const DeepCollectionEquality().hash(errors),
      const DeepCollectionEquality().hash(category));

  @JsonKey(ignore: true)
  @override
  _$RecordsPageSupplementsCopyWith<_RecordsPageSupplements> get copyWith =>
      __$RecordsPageSupplementsCopyWithImpl<_RecordsPageSupplements>(
          this, _$identity);
}

abstract class _RecordsPageSupplements extends RecordsPageSupplements {
  const factory _RecordsPageSupplements(
      {required TotalRecords totalRecords,
      dynamic type,
      dynamic amount,
      List<Category> categoryList,
      Map<String, dynamic> errors,
      required Category category}) = _$_RecordsPageSupplements;
  const _RecordsPageSupplements._() : super._();

  @override
  TotalRecords get totalRecords;
  @override
  dynamic get type;
  @override
  dynamic get amount;
  @override
  List<Category> get categoryList;
  @override
  Map<String, dynamic> get errors;
  @override
  Category get category;
  @override
  @JsonKey(ignore: true)
  _$RecordsPageSupplementsCopyWith<_RecordsPageSupplements> get copyWith =>
      throw _privateConstructorUsedError;
}
