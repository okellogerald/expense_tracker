// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'budget_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BudgetFormTearOff {
  const _$BudgetFormTearOff();

  _BudgetForm call(
      {int duration = 0,
      String id = '-1',
      Map<String, dynamic> errors = const {},
      Map<String, String> values = const {}}) {
    return _BudgetForm(
      duration: duration,
      id: id,
      errors: errors,
      values: values,
    );
  }
}

/// @nodoc
const $BudgetForm = _$BudgetFormTearOff();

/// @nodoc
mixin _$BudgetForm {
  int get duration => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  Map<String, dynamic> get errors => throw _privateConstructorUsedError;
  Map<String, String> get values => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BudgetFormCopyWith<BudgetForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetFormCopyWith<$Res> {
  factory $BudgetFormCopyWith(
          BudgetForm value, $Res Function(BudgetForm) then) =
      _$BudgetFormCopyWithImpl<$Res>;
  $Res call(
      {int duration,
      String id,
      Map<String, dynamic> errors,
      Map<String, String> values});
}

/// @nodoc
class _$BudgetFormCopyWithImpl<$Res> implements $BudgetFormCopyWith<$Res> {
  _$BudgetFormCopyWithImpl(this._value, this._then);

  final BudgetForm _value;
  // ignore: unused_field
  final $Res Function(BudgetForm) _then;

  @override
  $Res call({
    Object? duration = freezed,
    Object? id = freezed,
    Object? errors = freezed,
    Object? values = freezed,
  }) {
    return _then(_value.copyWith(
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      errors: errors == freezed
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      values: values == freezed
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
abstract class _$BudgetFormCopyWith<$Res> implements $BudgetFormCopyWith<$Res> {
  factory _$BudgetFormCopyWith(
          _BudgetForm value, $Res Function(_BudgetForm) then) =
      __$BudgetFormCopyWithImpl<$Res>;
  @override
  $Res call(
      {int duration,
      String id,
      Map<String, dynamic> errors,
      Map<String, String> values});
}

/// @nodoc
class __$BudgetFormCopyWithImpl<$Res> extends _$BudgetFormCopyWithImpl<$Res>
    implements _$BudgetFormCopyWith<$Res> {
  __$BudgetFormCopyWithImpl(
      _BudgetForm _value, $Res Function(_BudgetForm) _then)
      : super(_value, (v) => _then(v as _BudgetForm));

  @override
  _BudgetForm get _value => super._value as _BudgetForm;

  @override
  $Res call({
    Object? duration = freezed,
    Object? id = freezed,
    Object? errors = freezed,
    Object? values = freezed,
  }) {
    return _then(_BudgetForm(
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      errors: errors == freezed
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      values: values == freezed
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc

class _$_BudgetForm implements _BudgetForm {
  const _$_BudgetForm({
    this.duration = 0,
    this.id = '-1',
    this.errors = const {},
    this.values = const {},
  });

  @JsonKey()
  @override
  final int duration;
  @JsonKey()
  @override
  final String id;
  @JsonKey()
  @override
  final Map<String, dynamic> errors;
  @JsonKey()
  @override
  final Map<String, String> values;

  @override
  String toString() {
    return 'BudgetForm(duration: $duration, id: $id, errors: $errors, values: $values)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BudgetForm &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.errors, errors) &&
            const DeepCollectionEquality().equals(other.values, values));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(errors),
      const DeepCollectionEquality().hash(values));

  @JsonKey(ignore: true)
  @override
  _$BudgetFormCopyWith<_BudgetForm> get copyWith =>
      __$BudgetFormCopyWithImpl<_BudgetForm>(this, _$identity);
}

abstract class _BudgetForm implements BudgetForm {
  const factory _BudgetForm(
      {int duration,
      String id,
      Map<String, dynamic> errors,
      Map<String, String> values}) = _$_BudgetForm;

  @override
  int get duration;
  @override
  String get id;
  @override
  Map<String, dynamic> get errors;
  @override
  Map<String, String> get values;
  @override
  @JsonKey(ignore: true)
  _$BudgetFormCopyWith<_BudgetForm> get copyWith =>
      throw _privateConstructorUsedError;
}
