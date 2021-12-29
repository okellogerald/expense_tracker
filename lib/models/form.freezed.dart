// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RecordEditPageFormTearOff {
  const _$RecordEditPageFormTearOff();

  _RecordEditPageForm call(
      {String amount = '',
      String notes = '',
      String id = '',
      required DateTime date,
      Map<String, dynamic> errors = const {}}) {
    return _RecordEditPageForm(
      amount: amount,
      notes: notes,
      id: id,
      date: date,
      errors: errors,
    );
  }
}

/// @nodoc
const $RecordEditPageForm = _$RecordEditPageFormTearOff();

/// @nodoc
mixin _$RecordEditPageForm {
  String get amount => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  Map<String, dynamic> get errors => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecordEditPageFormCopyWith<RecordEditPageForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordEditPageFormCopyWith<$Res> {
  factory $RecordEditPageFormCopyWith(
          RecordEditPageForm value, $Res Function(RecordEditPageForm) then) =
      _$RecordEditPageFormCopyWithImpl<$Res>;
  $Res call(
      {String amount,
      String notes,
      String id,
      DateTime date,
      Map<String, dynamic> errors});
}

/// @nodoc
class _$RecordEditPageFormCopyWithImpl<$Res>
    implements $RecordEditPageFormCopyWith<$Res> {
  _$RecordEditPageFormCopyWithImpl(this._value, this._then);

  final RecordEditPageForm _value;
  // ignore: unused_field
  final $Res Function(RecordEditPageForm) _then;

  @override
  $Res call({
    Object? amount = freezed,
    Object? notes = freezed,
    Object? id = freezed,
    Object? date = freezed,
    Object? errors = freezed,
  }) {
    return _then(_value.copyWith(
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      errors: errors == freezed
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$RecordEditPageFormCopyWith<$Res>
    implements $RecordEditPageFormCopyWith<$Res> {
  factory _$RecordEditPageFormCopyWith(
          _RecordEditPageForm value, $Res Function(_RecordEditPageForm) then) =
      __$RecordEditPageFormCopyWithImpl<$Res>;
  @override
  $Res call(
      {String amount,
      String notes,
      String id,
      DateTime date,
      Map<String, dynamic> errors});
}

/// @nodoc
class __$RecordEditPageFormCopyWithImpl<$Res>
    extends _$RecordEditPageFormCopyWithImpl<$Res>
    implements _$RecordEditPageFormCopyWith<$Res> {
  __$RecordEditPageFormCopyWithImpl(
      _RecordEditPageForm _value, $Res Function(_RecordEditPageForm) _then)
      : super(_value, (v) => _then(v as _RecordEditPageForm));

  @override
  _RecordEditPageForm get _value => super._value as _RecordEditPageForm;

  @override
  $Res call({
    Object? amount = freezed,
    Object? notes = freezed,
    Object? id = freezed,
    Object? date = freezed,
    Object? errors = freezed,
  }) {
    return _then(_RecordEditPageForm(
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      errors: errors == freezed
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$_RecordEditPageForm implements _RecordEditPageForm {
  const _$_RecordEditPageForm(
      {this.amount = '',
      this.notes = '',
      this.id = '',
      required this.date,
      this.errors = const {}});

  @JsonKey()
  @override
  final String amount;
  @JsonKey()
  @override
  final String notes;
  @JsonKey()
  @override
  final String id;
  @override
  final DateTime date;
  @JsonKey()
  @override
  final Map<String, dynamic> errors;

  @override
  String toString() {
    return 'RecordEditPageForm(amount: $amount, notes: $notes, id: $id, date: $date, errors: $errors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecordEditPageForm &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.notes, notes) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.errors, errors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(notes),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(errors));

  @JsonKey(ignore: true)
  @override
  _$RecordEditPageFormCopyWith<_RecordEditPageForm> get copyWith =>
      __$RecordEditPageFormCopyWithImpl<_RecordEditPageForm>(this, _$identity);
}

abstract class _RecordEditPageForm implements RecordEditPageForm {
  const factory _RecordEditPageForm(
      {String amount,
      String notes,
      String id,
      required DateTime date,
      Map<String, dynamic> errors}) = _$_RecordEditPageForm;

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
  @override
  @JsonKey(ignore: true)
  _$RecordEditPageFormCopyWith<_RecordEditPageForm> get copyWith =>
      throw _privateConstructorUsedError;
}
