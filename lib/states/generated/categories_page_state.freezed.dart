// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../categories_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CategoriesPageStateTearOff {
  const _$CategoriesPageStateTearOff();

  _Loading loading(List<Category> categoryList, CategoryForm form) {
    return _Loading(
      categoryList,
      form,
    );
  }

  _Content content(List<Category> categoryList, CategoryForm form) {
    return _Content(
      categoryList,
      form,
    );
  }

  _Success success(List<Category> categoryList, CategoryForm form) {
    return _Success(
      categoryList,
      form,
    );
  }
}

/// @nodoc
const $CategoriesPageState = _$CategoriesPageStateTearOff();

/// @nodoc
mixin _$CategoriesPageState {
  List<Category> get categoryList => throw _privateConstructorUsedError;
  CategoryForm get form => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Category> categoryList, CategoryForm form)
        loading,
    required TResult Function(List<Category> categoryList, CategoryForm form)
        content,
    required TResult Function(List<Category> categoryList, CategoryForm form)
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Category> categoryList, CategoryForm form)? loading,
    TResult Function(List<Category> categoryList, CategoryForm form)? content,
    TResult Function(List<Category> categoryList, CategoryForm form)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Category> categoryList, CategoryForm form)? loading,
    TResult Function(List<Category> categoryList, CategoryForm form)? content,
    TResult Function(List<Category> categoryList, CategoryForm form)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Content value) content,
    required TResult Function(_Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    TResult Function(_Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoriesPageStateCopyWith<CategoriesPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesPageStateCopyWith<$Res> {
  factory $CategoriesPageStateCopyWith(
          CategoriesPageState value, $Res Function(CategoriesPageState) then) =
      _$CategoriesPageStateCopyWithImpl<$Res>;
  $Res call({List<Category> categoryList, CategoryForm form});

  $CategoryFormCopyWith<$Res> get form;
}

/// @nodoc
class _$CategoriesPageStateCopyWithImpl<$Res>
    implements $CategoriesPageStateCopyWith<$Res> {
  _$CategoriesPageStateCopyWithImpl(this._value, this._then);

  final CategoriesPageState _value;
  // ignore: unused_field
  final $Res Function(CategoriesPageState) _then;

  @override
  $Res call({
    Object? categoryList = freezed,
    Object? form = freezed,
  }) {
    return _then(_value.copyWith(
      categoryList: categoryList == freezed
          ? _value.categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      form: form == freezed
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as CategoryForm,
    ));
  }

  @override
  $CategoryFormCopyWith<$Res> get form {
    return $CategoryFormCopyWith<$Res>(_value.form, (value) {
      return _then(_value.copyWith(form: value));
    });
  }
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res>
    implements $CategoriesPageStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
  @override
  $Res call({List<Category> categoryList, CategoryForm form});

  @override
  $CategoryFormCopyWith<$Res> get form;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    extends _$CategoriesPageStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;

  @override
  $Res call({
    Object? categoryList = freezed,
    Object? form = freezed,
  }) {
    return _then(_Loading(
      categoryList == freezed
          ? _value.categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      form == freezed
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as CategoryForm,
    ));
  }
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading(this.categoryList, this.form);

  @override
  final List<Category> categoryList;
  @override
  final CategoryForm form;

  @override
  String toString() {
    return 'CategoriesPageState.loading(categoryList: $categoryList, form: $form)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loading &&
            const DeepCollectionEquality()
                .equals(other.categoryList, categoryList) &&
            const DeepCollectionEquality().equals(other.form, form));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categoryList),
      const DeepCollectionEquality().hash(form));

  @JsonKey(ignore: true)
  @override
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Category> categoryList, CategoryForm form)
        loading,
    required TResult Function(List<Category> categoryList, CategoryForm form)
        content,
    required TResult Function(List<Category> categoryList, CategoryForm form)
        success,
  }) {
    return loading(categoryList, form);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Category> categoryList, CategoryForm form)? loading,
    TResult Function(List<Category> categoryList, CategoryForm form)? content,
    TResult Function(List<Category> categoryList, CategoryForm form)? success,
  }) {
    return loading?.call(categoryList, form);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Category> categoryList, CategoryForm form)? loading,
    TResult Function(List<Category> categoryList, CategoryForm form)? content,
    TResult Function(List<Category> categoryList, CategoryForm form)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(categoryList, form);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Content value) content,
    required TResult Function(_Success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    TResult Function(_Success value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CategoriesPageState {
  const factory _Loading(List<Category> categoryList, CategoryForm form) =
      _$_Loading;

  @override
  List<Category> get categoryList;
  @override
  CategoryForm get form;
  @override
  @JsonKey(ignore: true)
  _$LoadingCopyWith<_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ContentCopyWith<$Res>
    implements $CategoriesPageStateCopyWith<$Res> {
  factory _$ContentCopyWith(_Content value, $Res Function(_Content) then) =
      __$ContentCopyWithImpl<$Res>;
  @override
  $Res call({List<Category> categoryList, CategoryForm form});

  @override
  $CategoryFormCopyWith<$Res> get form;
}

/// @nodoc
class __$ContentCopyWithImpl<$Res>
    extends _$CategoriesPageStateCopyWithImpl<$Res>
    implements _$ContentCopyWith<$Res> {
  __$ContentCopyWithImpl(_Content _value, $Res Function(_Content) _then)
      : super(_value, (v) => _then(v as _Content));

  @override
  _Content get _value => super._value as _Content;

  @override
  $Res call({
    Object? categoryList = freezed,
    Object? form = freezed,
  }) {
    return _then(_Content(
      categoryList == freezed
          ? _value.categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      form == freezed
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as CategoryForm,
    ));
  }
}

/// @nodoc

class _$_Content implements _Content {
  const _$_Content(this.categoryList, this.form);

  @override
  final List<Category> categoryList;
  @override
  final CategoryForm form;

  @override
  String toString() {
    return 'CategoriesPageState.content(categoryList: $categoryList, form: $form)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Content &&
            const DeepCollectionEquality()
                .equals(other.categoryList, categoryList) &&
            const DeepCollectionEquality().equals(other.form, form));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categoryList),
      const DeepCollectionEquality().hash(form));

  @JsonKey(ignore: true)
  @override
  _$ContentCopyWith<_Content> get copyWith =>
      __$ContentCopyWithImpl<_Content>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Category> categoryList, CategoryForm form)
        loading,
    required TResult Function(List<Category> categoryList, CategoryForm form)
        content,
    required TResult Function(List<Category> categoryList, CategoryForm form)
        success,
  }) {
    return content(categoryList, form);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Category> categoryList, CategoryForm form)? loading,
    TResult Function(List<Category> categoryList, CategoryForm form)? content,
    TResult Function(List<Category> categoryList, CategoryForm form)? success,
  }) {
    return content?.call(categoryList, form);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Category> categoryList, CategoryForm form)? loading,
    TResult Function(List<Category> categoryList, CategoryForm form)? content,
    TResult Function(List<Category> categoryList, CategoryForm form)? success,
    required TResult orElse(),
  }) {
    if (content != null) {
      return content(categoryList, form);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Content value) content,
    required TResult Function(_Success value) success,
  }) {
    return content(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    TResult Function(_Success value)? success,
  }) {
    return content?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (content != null) {
      return content(this);
    }
    return orElse();
  }
}

abstract class _Content implements CategoriesPageState {
  const factory _Content(List<Category> categoryList, CategoryForm form) =
      _$_Content;

  @override
  List<Category> get categoryList;
  @override
  CategoryForm get form;
  @override
  @JsonKey(ignore: true)
  _$ContentCopyWith<_Content> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SuccessCopyWith<$Res>
    implements $CategoriesPageStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) then) =
      __$SuccessCopyWithImpl<$Res>;
  @override
  $Res call({List<Category> categoryList, CategoryForm form});

  @override
  $CategoryFormCopyWith<$Res> get form;
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    extends _$CategoriesPageStateCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(_Success _value, $Res Function(_Success) _then)
      : super(_value, (v) => _then(v as _Success));

  @override
  _Success get _value => super._value as _Success;

  @override
  $Res call({
    Object? categoryList = freezed,
    Object? form = freezed,
  }) {
    return _then(_Success(
      categoryList == freezed
          ? _value.categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      form == freezed
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as CategoryForm,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success(this.categoryList, this.form);

  @override
  final List<Category> categoryList;
  @override
  final CategoryForm form;

  @override
  String toString() {
    return 'CategoriesPageState.success(categoryList: $categoryList, form: $form)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Success &&
            const DeepCollectionEquality()
                .equals(other.categoryList, categoryList) &&
            const DeepCollectionEquality().equals(other.form, form));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categoryList),
      const DeepCollectionEquality().hash(form));

  @JsonKey(ignore: true)
  @override
  _$SuccessCopyWith<_Success> get copyWith =>
      __$SuccessCopyWithImpl<_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Category> categoryList, CategoryForm form)
        loading,
    required TResult Function(List<Category> categoryList, CategoryForm form)
        content,
    required TResult Function(List<Category> categoryList, CategoryForm form)
        success,
  }) {
    return success(categoryList, form);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Category> categoryList, CategoryForm form)? loading,
    TResult Function(List<Category> categoryList, CategoryForm form)? content,
    TResult Function(List<Category> categoryList, CategoryForm form)? success,
  }) {
    return success?.call(categoryList, form);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Category> categoryList, CategoryForm form)? loading,
    TResult Function(List<Category> categoryList, CategoryForm form)? content,
    TResult Function(List<Category> categoryList, CategoryForm form)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(categoryList, form);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Content value) content,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    TResult Function(_Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements CategoriesPageState {
  const factory _Success(List<Category> categoryList, CategoryForm form) =
      _$_Success;

  @override
  List<Category> get categoryList;
  @override
  CategoryForm get form;
  @override
  @JsonKey(ignore: true)
  _$SuccessCopyWith<_Success> get copyWith =>
      throw _privateConstructorUsedError;
}
