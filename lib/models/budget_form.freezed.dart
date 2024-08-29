// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BudgetForm {
  int get duration => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  Map<String, dynamic> get errors => throw _privateConstructorUsedError;
  Map<String, String> get values => throw _privateConstructorUsedError;

  /// Create a copy of BudgetForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BudgetFormCopyWith<BudgetForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetFormCopyWith<$Res> {
  factory $BudgetFormCopyWith(
          BudgetForm value, $Res Function(BudgetForm) then) =
      _$BudgetFormCopyWithImpl<$Res, BudgetForm>;
  @useResult
  $Res call(
      {int duration,
      String id,
      Map<String, dynamic> errors,
      Map<String, String> values});
}

/// @nodoc
class _$BudgetFormCopyWithImpl<$Res, $Val extends BudgetForm>
    implements $BudgetFormCopyWith<$Res> {
  _$BudgetFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BudgetForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? id = null,
    Object? errors = null,
    Object? values = null,
  }) {
    return _then(_value.copyWith(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      errors: null == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BudgetFormImplCopyWith<$Res>
    implements $BudgetFormCopyWith<$Res> {
  factory _$$BudgetFormImplCopyWith(
          _$BudgetFormImpl value, $Res Function(_$BudgetFormImpl) then) =
      __$$BudgetFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int duration,
      String id,
      Map<String, dynamic> errors,
      Map<String, String> values});
}

/// @nodoc
class __$$BudgetFormImplCopyWithImpl<$Res>
    extends _$BudgetFormCopyWithImpl<$Res, _$BudgetFormImpl>
    implements _$$BudgetFormImplCopyWith<$Res> {
  __$$BudgetFormImplCopyWithImpl(
      _$BudgetFormImpl _value, $Res Function(_$BudgetFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of BudgetForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? id = null,
    Object? errors = null,
    Object? values = null,
  }) {
    return _then(_$BudgetFormImpl(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      errors: null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      values: null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc

class _$BudgetFormImpl implements _BudgetForm {
  const _$BudgetFormImpl(
      {this.duration = 0,
      this.id = '-1',
      final Map<String, dynamic> errors = const {},
      final Map<String, String> values = const {}})
      : _errors = errors,
        _values = values;

  @override
  @JsonKey()
  final int duration;
  @override
  @JsonKey()
  final String id;
  final Map<String, dynamic> _errors;
  @override
  @JsonKey()
  Map<String, dynamic> get errors {
    if (_errors is EqualUnmodifiableMapView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_errors);
  }

  final Map<String, String> _values;
  @override
  @JsonKey()
  Map<String, String> get values {
    if (_values is EqualUnmodifiableMapView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_values);
  }

  @override
  String toString() {
    return 'BudgetForm(duration: $duration, id: $id, errors: $errors, values: $values)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetFormImpl &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._errors, _errors) &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      duration,
      id,
      const DeepCollectionEquality().hash(_errors),
      const DeepCollectionEquality().hash(_values));

  /// Create a copy of BudgetForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetFormImplCopyWith<_$BudgetFormImpl> get copyWith =>
      __$$BudgetFormImplCopyWithImpl<_$BudgetFormImpl>(this, _$identity);
}

abstract class _BudgetForm implements BudgetForm {
  const factory _BudgetForm(
      {final int duration,
      final String id,
      final Map<String, dynamic> errors,
      final Map<String, String> values}) = _$BudgetFormImpl;

  @override
  int get duration;
  @override
  String get id;
  @override
  Map<String, dynamic> get errors;
  @override
  Map<String, String> get values;

  /// Create a copy of BudgetForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BudgetFormImplCopyWith<_$BudgetFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
