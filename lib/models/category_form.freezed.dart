// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoryForm {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get isEditing => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get codePoint => throw _privateConstructorUsedError;
  Map<String, dynamic> get errors => throw _privateConstructorUsedError;
  List<String> get undeletableCategories => throw _privateConstructorUsedError;

  /// Create a copy of CategoryForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryFormCopyWith<CategoryForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryFormCopyWith<$Res> {
  factory $CategoryFormCopyWith(
          CategoryForm value, $Res Function(CategoryForm) then) =
      _$CategoryFormCopyWithImpl<$Res, CategoryForm>;
  @useResult
  $Res call(
      {String id,
      String title,
      bool isEditing,
      String type,
      int codePoint,
      Map<String, dynamic> errors,
      List<String> undeletableCategories});
}

/// @nodoc
class _$CategoryFormCopyWithImpl<$Res, $Val extends CategoryForm>
    implements $CategoryFormCopyWith<$Res> {
  _$CategoryFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? isEditing = null,
    Object? type = null,
    Object? codePoint = null,
    Object? errors = null,
    Object? undeletableCategories = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isEditing: null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      codePoint: null == codePoint
          ? _value.codePoint
          : codePoint // ignore: cast_nullable_to_non_nullable
              as int,
      errors: null == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      undeletableCategories: null == undeletableCategories
          ? _value.undeletableCategories
          : undeletableCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryFormImplCopyWith<$Res>
    implements $CategoryFormCopyWith<$Res> {
  factory _$$CategoryFormImplCopyWith(
          _$CategoryFormImpl value, $Res Function(_$CategoryFormImpl) then) =
      __$$CategoryFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      bool isEditing,
      String type,
      int codePoint,
      Map<String, dynamic> errors,
      List<String> undeletableCategories});
}

/// @nodoc
class __$$CategoryFormImplCopyWithImpl<$Res>
    extends _$CategoryFormCopyWithImpl<$Res, _$CategoryFormImpl>
    implements _$$CategoryFormImplCopyWith<$Res> {
  __$$CategoryFormImplCopyWithImpl(
      _$CategoryFormImpl _value, $Res Function(_$CategoryFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? isEditing = null,
    Object? type = null,
    Object? codePoint = null,
    Object? errors = null,
    Object? undeletableCategories = null,
  }) {
    return _then(_$CategoryFormImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isEditing: null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      codePoint: null == codePoint
          ? _value.codePoint
          : codePoint // ignore: cast_nullable_to_non_nullable
              as int,
      errors: null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      undeletableCategories: null == undeletableCategories
          ? _value._undeletableCategories
          : undeletableCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$CategoryFormImpl implements _CategoryForm {
  const _$CategoryFormImpl(
      {this.id = '-1',
      this.title = '',
      this.isEditing = false,
      this.type = kIncome,
      this.codePoint = -1,
      final Map<String, dynamic> errors = const {},
      final List<String> undeletableCategories = const []})
      : _errors = errors,
        _undeletableCategories = undeletableCategories;

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final bool isEditing;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final int codePoint;
  final Map<String, dynamic> _errors;
  @override
  @JsonKey()
  Map<String, dynamic> get errors {
    if (_errors is EqualUnmodifiableMapView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_errors);
  }

  final List<String> _undeletableCategories;
  @override
  @JsonKey()
  List<String> get undeletableCategories {
    if (_undeletableCategories is EqualUnmodifiableListView)
      return _undeletableCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_undeletableCategories);
  }

  @override
  String toString() {
    return 'CategoryForm(id: $id, title: $title, isEditing: $isEditing, type: $type, codePoint: $codePoint, errors: $errors, undeletableCategories: $undeletableCategories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryFormImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isEditing, isEditing) ||
                other.isEditing == isEditing) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.codePoint, codePoint) ||
                other.codePoint == codePoint) &&
            const DeepCollectionEquality().equals(other._errors, _errors) &&
            const DeepCollectionEquality()
                .equals(other._undeletableCategories, _undeletableCategories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      isEditing,
      type,
      codePoint,
      const DeepCollectionEquality().hash(_errors),
      const DeepCollectionEquality().hash(_undeletableCategories));

  /// Create a copy of CategoryForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryFormImplCopyWith<_$CategoryFormImpl> get copyWith =>
      __$$CategoryFormImplCopyWithImpl<_$CategoryFormImpl>(this, _$identity);
}

abstract class _CategoryForm implements CategoryForm {
  const factory _CategoryForm(
      {final String id,
      final String title,
      final bool isEditing,
      final String type,
      final int codePoint,
      final Map<String, dynamic> errors,
      final List<String> undeletableCategories}) = _$CategoryFormImpl;

  @override
  String get id;
  @override
  String get title;
  @override
  bool get isEditing;
  @override
  String get type;
  @override
  int get codePoint;
  @override
  Map<String, dynamic> get errors;
  @override
  List<String> get undeletableCategories;

  /// Create a copy of CategoryForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryFormImplCopyWith<_$CategoryFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
