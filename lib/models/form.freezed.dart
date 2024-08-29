// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecordEditPageForm {
  String get amount => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  Map<String, dynamic> get errors => throw _privateConstructorUsedError;

  /// Create a copy of RecordEditPageForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecordEditPageFormCopyWith<RecordEditPageForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordEditPageFormCopyWith<$Res> {
  factory $RecordEditPageFormCopyWith(
          RecordEditPageForm value, $Res Function(RecordEditPageForm) then) =
      _$RecordEditPageFormCopyWithImpl<$Res, RecordEditPageForm>;
  @useResult
  $Res call(
      {String amount,
      String notes,
      String id,
      DateTime date,
      Map<String, dynamic> errors});
}

/// @nodoc
class _$RecordEditPageFormCopyWithImpl<$Res, $Val extends RecordEditPageForm>
    implements $RecordEditPageFormCopyWith<$Res> {
  _$RecordEditPageFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecordEditPageForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? notes = null,
    Object? id = null,
    Object? date = null,
    Object? errors = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      errors: null == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecordEditPageFormImplCopyWith<$Res>
    implements $RecordEditPageFormCopyWith<$Res> {
  factory _$$RecordEditPageFormImplCopyWith(_$RecordEditPageFormImpl value,
          $Res Function(_$RecordEditPageFormImpl) then) =
      __$$RecordEditPageFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String amount,
      String notes,
      String id,
      DateTime date,
      Map<String, dynamic> errors});
}

/// @nodoc
class __$$RecordEditPageFormImplCopyWithImpl<$Res>
    extends _$RecordEditPageFormCopyWithImpl<$Res, _$RecordEditPageFormImpl>
    implements _$$RecordEditPageFormImplCopyWith<$Res> {
  __$$RecordEditPageFormImplCopyWithImpl(_$RecordEditPageFormImpl _value,
      $Res Function(_$RecordEditPageFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecordEditPageForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? notes = null,
    Object? id = null,
    Object? date = null,
    Object? errors = null,
  }) {
    return _then(_$RecordEditPageFormImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      errors: null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$RecordEditPageFormImpl implements _RecordEditPageForm {
  const _$RecordEditPageFormImpl(
      {this.amount = '',
      this.notes = '',
      this.id = '',
      required this.date,
      final Map<String, dynamic> errors = const {}})
      : _errors = errors;

  @override
  @JsonKey()
  final String amount;
  @override
  @JsonKey()
  final String notes;
  @override
  @JsonKey()
  final String id;
  @override
  final DateTime date;
  final Map<String, dynamic> _errors;
  @override
  @JsonKey()
  Map<String, dynamic> get errors {
    if (_errors is EqualUnmodifiableMapView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_errors);
  }

  @override
  String toString() {
    return 'RecordEditPageForm(amount: $amount, notes: $notes, id: $id, date: $date, errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordEditPageFormImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount, notes, id, date,
      const DeepCollectionEquality().hash(_errors));

  /// Create a copy of RecordEditPageForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordEditPageFormImplCopyWith<_$RecordEditPageFormImpl> get copyWith =>
      __$$RecordEditPageFormImplCopyWithImpl<_$RecordEditPageFormImpl>(
          this, _$identity);
}

abstract class _RecordEditPageForm implements RecordEditPageForm {
  const factory _RecordEditPageForm(
      {final String amount,
      final String notes,
      final String id,
      required final DateTime date,
      final Map<String, dynamic> errors}) = _$RecordEditPageFormImpl;

  @override
  String get amount;
  @override
  String get notes;
  @override
  String get id;
  @override
  DateTime get date;
  @override
  Map<String, dynamic> get errors;

  /// Create a copy of RecordEditPageForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordEditPageFormImplCopyWith<_$RecordEditPageFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
