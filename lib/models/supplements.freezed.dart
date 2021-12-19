// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'supplements.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SupplementsTearOff {
  const _$SupplementsTearOff();

  _Supplements call(
      {String id = '-1',
      String title = '',
      bool isEditing = false,
      String type = kIncome,
      int codePoint = -1,
      AddCategoryWidgetPosition position = AddCategoryWidgetPosition.top,
      Map<String, dynamic> errors = const {}}) {
    return _Supplements(
      id: id,
      title: title,
      isEditing: isEditing,
      type: type,
      codePoint: codePoint,
      position: position,
      errors: errors,
    );
  }
}

/// @nodoc
const $Supplements = _$SupplementsTearOff();

/// @nodoc
mixin _$Supplements {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get isEditing => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get codePoint => throw _privateConstructorUsedError;
  AddCategoryWidgetPosition get position => throw _privateConstructorUsedError;
  Map<String, dynamic> get errors => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SupplementsCopyWith<Supplements> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupplementsCopyWith<$Res> {
  factory $SupplementsCopyWith(
          Supplements value, $Res Function(Supplements) then) =
      _$SupplementsCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String title,
      bool isEditing,
      String type,
      int codePoint,
      AddCategoryWidgetPosition position,
      Map<String, dynamic> errors});
}

/// @nodoc
class _$SupplementsCopyWithImpl<$Res> implements $SupplementsCopyWith<$Res> {
  _$SupplementsCopyWithImpl(this._value, this._then);

  final Supplements _value;
  // ignore: unused_field
  final $Res Function(Supplements) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? isEditing = freezed,
    Object? type = freezed,
    Object? codePoint = freezed,
    Object? position = freezed,
    Object? errors = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isEditing: isEditing == freezed
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      codePoint: codePoint == freezed
          ? _value.codePoint
          : codePoint // ignore: cast_nullable_to_non_nullable
              as int,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as AddCategoryWidgetPosition,
      errors: errors == freezed
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$SupplementsCopyWith<$Res>
    implements $SupplementsCopyWith<$Res> {
  factory _$SupplementsCopyWith(
          _Supplements value, $Res Function(_Supplements) then) =
      __$SupplementsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      bool isEditing,
      String type,
      int codePoint,
      AddCategoryWidgetPosition position,
      Map<String, dynamic> errors});
}

/// @nodoc
class __$SupplementsCopyWithImpl<$Res> extends _$SupplementsCopyWithImpl<$Res>
    implements _$SupplementsCopyWith<$Res> {
  __$SupplementsCopyWithImpl(
      _Supplements _value, $Res Function(_Supplements) _then)
      : super(_value, (v) => _then(v as _Supplements));

  @override
  _Supplements get _value => super._value as _Supplements;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? isEditing = freezed,
    Object? type = freezed,
    Object? codePoint = freezed,
    Object? position = freezed,
    Object? errors = freezed,
  }) {
    return _then(_Supplements(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isEditing: isEditing == freezed
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      codePoint: codePoint == freezed
          ? _value.codePoint
          : codePoint // ignore: cast_nullable_to_non_nullable
              as int,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as AddCategoryWidgetPosition,
      errors: errors == freezed
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$_Supplements implements _Supplements {
  const _$_Supplements(
      {this.id = '-1',
      this.title = '',
      this.isEditing = false,
      this.type = kIncome,
      this.codePoint = -1,
      this.position = AddCategoryWidgetPosition.top,
      this.errors = const {}});

  @JsonKey()
  @override
  final String id;
  @JsonKey()
  @override
  final String title;
  @JsonKey()
  @override
  final bool isEditing;
  @JsonKey()
  @override
  final String type;
  @JsonKey()
  @override
  final int codePoint;
  @JsonKey()
  @override
  final AddCategoryWidgetPosition position;
  @JsonKey()
  @override
  final Map<String, dynamic> errors;

  @override
  String toString() {
    return 'Supplements(id: $id, title: $title, isEditing: $isEditing, type: $type, codePoint: $codePoint, position: $position, errors: $errors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Supplements &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.isEditing, isEditing) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.codePoint, codePoint) &&
            const DeepCollectionEquality().equals(other.position, position) &&
            const DeepCollectionEquality().equals(other.errors, errors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(isEditing),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(codePoint),
      const DeepCollectionEquality().hash(position),
      const DeepCollectionEquality().hash(errors));

  @JsonKey(ignore: true)
  @override
  _$SupplementsCopyWith<_Supplements> get copyWith =>
      __$SupplementsCopyWithImpl<_Supplements>(this, _$identity);
}

abstract class _Supplements implements Supplements {
  const factory _Supplements(
      {String id,
      String title,
      bool isEditing,
      String type,
      int codePoint,
      AddCategoryWidgetPosition position,
      Map<String, dynamic> errors}) = _$_Supplements;

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
  AddCategoryWidgetPosition get position;
  @override
  Map<String, dynamic> get errors;
  @override
  @JsonKey(ignore: true)
  _$SupplementsCopyWith<_Supplements> get copyWith =>
      throw _privateConstructorUsedError;
}
