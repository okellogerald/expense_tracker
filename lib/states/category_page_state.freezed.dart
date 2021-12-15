// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CategoryPageStateTearOff {
  const _$CategoryPageStateTearOff();

  _Loading loading(List<Category> categoryList) {
    return _Loading(
      categoryList,
    );
  }

  _Content content(List<Category> categoryList, String selectedId) {
    return _Content(
      categoryList,
      selectedId,
    );
  }
}

/// @nodoc
const $CategoryPageState = _$CategoryPageStateTearOff();

/// @nodoc
mixin _$CategoryPageState {
  List<Category> get categoryList => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Category> categoryList) loading,
    required TResult Function(List<Category> categoryList, String selectedId)
        content,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Category> categoryList)? loading,
    TResult Function(List<Category> categoryList, String selectedId)? content,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Category> categoryList)? loading,
    TResult Function(List<Category> categoryList, String selectedId)? content,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Content value) content,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryPageStateCopyWith<CategoryPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryPageStateCopyWith<$Res> {
  factory $CategoryPageStateCopyWith(
          CategoryPageState value, $Res Function(CategoryPageState) then) =
      _$CategoryPageStateCopyWithImpl<$Res>;
  $Res call({List<Category> categoryList});
}

/// @nodoc
class _$CategoryPageStateCopyWithImpl<$Res>
    implements $CategoryPageStateCopyWith<$Res> {
  _$CategoryPageStateCopyWithImpl(this._value, this._then);

  final CategoryPageState _value;
  // ignore: unused_field
  final $Res Function(CategoryPageState) _then;

  @override
  $Res call({
    Object? categoryList = freezed,
  }) {
    return _then(_value.copyWith(
      categoryList: categoryList == freezed
          ? _value.categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res>
    implements $CategoryPageStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
  @override
  $Res call({List<Category> categoryList});
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$CategoryPageStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;

  @override
  $Res call({
    Object? categoryList = freezed,
  }) {
    return _then(_Loading(
      categoryList == freezed
          ? _value.categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading(this.categoryList);

  @override
  final List<Category> categoryList;

  @override
  String toString() {
    return 'CategoryPageState.loading(categoryList: $categoryList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loading &&
            const DeepCollectionEquality()
                .equals(other.categoryList, categoryList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(categoryList));

  @JsonKey(ignore: true)
  @override
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Category> categoryList) loading,
    required TResult Function(List<Category> categoryList, String selectedId)
        content,
  }) {
    return loading(categoryList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Category> categoryList)? loading,
    TResult Function(List<Category> categoryList, String selectedId)? content,
  }) {
    return loading?.call(categoryList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Category> categoryList)? loading,
    TResult Function(List<Category> categoryList, String selectedId)? content,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(categoryList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Content value) content,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CategoryPageState {
  const factory _Loading(List<Category> categoryList) = _$_Loading;

  @override
  List<Category> get categoryList;
  @override
  @JsonKey(ignore: true)
  _$LoadingCopyWith<_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ContentCopyWith<$Res>
    implements $CategoryPageStateCopyWith<$Res> {
  factory _$ContentCopyWith(_Content value, $Res Function(_Content) then) =
      __$ContentCopyWithImpl<$Res>;
  @override
  $Res call({List<Category> categoryList, String selectedId});
}

/// @nodoc
class __$ContentCopyWithImpl<$Res> extends _$CategoryPageStateCopyWithImpl<$Res>
    implements _$ContentCopyWith<$Res> {
  __$ContentCopyWithImpl(_Content _value, $Res Function(_Content) _then)
      : super(_value, (v) => _then(v as _Content));

  @override
  _Content get _value => super._value as _Content;

  @override
  $Res call({
    Object? categoryList = freezed,
    Object? selectedId = freezed,
  }) {
    return _then(_Content(
      categoryList == freezed
          ? _value.categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      selectedId == freezed
          ? _value.selectedId
          : selectedId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Content implements _Content {
  const _$_Content(this.categoryList, this.selectedId);

  @override
  final List<Category> categoryList;
  @override
  final String selectedId;

  @override
  String toString() {
    return 'CategoryPageState.content(categoryList: $categoryList, selectedId: $selectedId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Content &&
            const DeepCollectionEquality()
                .equals(other.categoryList, categoryList) &&
            const DeepCollectionEquality()
                .equals(other.selectedId, selectedId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categoryList),
      const DeepCollectionEquality().hash(selectedId));

  @JsonKey(ignore: true)
  @override
  _$ContentCopyWith<_Content> get copyWith =>
      __$ContentCopyWithImpl<_Content>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Category> categoryList) loading,
    required TResult Function(List<Category> categoryList, String selectedId)
        content,
  }) {
    return content(categoryList, selectedId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Category> categoryList)? loading,
    TResult Function(List<Category> categoryList, String selectedId)? content,
  }) {
    return content?.call(categoryList, selectedId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Category> categoryList)? loading,
    TResult Function(List<Category> categoryList, String selectedId)? content,
    required TResult orElse(),
  }) {
    if (content != null) {
      return content(categoryList, selectedId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Content value) content,
  }) {
    return content(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
  }) {
    return content?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    required TResult orElse(),
  }) {
    if (content != null) {
      return content(this);
    }
    return orElse();
  }
}

abstract class _Content implements CategoryPageState {
  const factory _Content(List<Category> categoryList, String selectedId) =
      _$_Content;

  @override
  List<Category> get categoryList;
  String get selectedId;
  @override
  @JsonKey(ignore: true)
  _$ContentCopyWith<_Content> get copyWith =>
      throw _privateConstructorUsedError;
}
