// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'on_boarding_supplements.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$OnBoardingSupplementsTearOff {
  const _$OnBoardingSupplementsTearOff();

  _OnBoardingSupplements call(
      {required String password,
      required Map<String, String> errors,
      required Map<int, String> otp,
      required User client}) {
    return _OnBoardingSupplements(
      password: password,
      errors: errors,
      otp: otp,
      client: client,
    );
  }
}

/// @nodoc
const $OnBoardingSupplements = _$OnBoardingSupplementsTearOff();

/// @nodoc
mixin _$OnBoardingSupplements {
  String get password => throw _privateConstructorUsedError;
  Map<String, String> get errors => throw _privateConstructorUsedError;
  Map<int, String> get otp => throw _privateConstructorUsedError;
  User get client => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnBoardingSupplementsCopyWith<OnBoardingSupplements> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnBoardingSupplementsCopyWith<$Res> {
  factory $OnBoardingSupplementsCopyWith(OnBoardingSupplements value,
          $Res Function(OnBoardingSupplements) then) =
      _$OnBoardingSupplementsCopyWithImpl<$Res>;
  $Res call(
      {String password,
      Map<String, String> errors,
      Map<int, String> otp,
      User client});
}

/// @nodoc
class _$OnBoardingSupplementsCopyWithImpl<$Res>
    implements $OnBoardingSupplementsCopyWith<$Res> {
  _$OnBoardingSupplementsCopyWithImpl(this._value, this._then);

  final OnBoardingSupplements _value;
  // ignore: unused_field
  final $Res Function(OnBoardingSupplements) _then;

  @override
  $Res call({
    Object? password = freezed,
    Object? errors = freezed,
    Object? otp = freezed,
    Object? client = freezed,
  }) {
    return _then(_value.copyWith(
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      errors: errors == freezed
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      otp: otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
      client: client == freezed
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
abstract class _$OnBoardingSupplementsCopyWith<$Res>
    implements $OnBoardingSupplementsCopyWith<$Res> {
  factory _$OnBoardingSupplementsCopyWith(_OnBoardingSupplements value,
          $Res Function(_OnBoardingSupplements) then) =
      __$OnBoardingSupplementsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String password,
      Map<String, String> errors,
      Map<int, String> otp,
      User client});
}

/// @nodoc
class __$OnBoardingSupplementsCopyWithImpl<$Res>
    extends _$OnBoardingSupplementsCopyWithImpl<$Res>
    implements _$OnBoardingSupplementsCopyWith<$Res> {
  __$OnBoardingSupplementsCopyWithImpl(_OnBoardingSupplements _value,
      $Res Function(_OnBoardingSupplements) _then)
      : super(_value, (v) => _then(v as _OnBoardingSupplements));

  @override
  _OnBoardingSupplements get _value => super._value as _OnBoardingSupplements;

  @override
  $Res call({
    Object? password = freezed,
    Object? errors = freezed,
    Object? otp = freezed,
    Object? client = freezed,
  }) {
    return _then(_OnBoardingSupplements(
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      errors: errors == freezed
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      otp: otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
      client: client == freezed
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$_OnBoardingSupplements implements _OnBoardingSupplements {
  const _$_OnBoardingSupplements(
      {required this.password,
      required this.errors,
      required this.otp,
      required this.client});

  @override
  final String password;
  @override
  final Map<String, String> errors;
  @override
  final Map<int, String> otp;
  @override
  final User client;

  @override
  String toString() {
    return 'OnBoardingSupplements(password: $password, errors: $errors, otp: $otp, client: $client)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OnBoardingSupplements &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.errors, errors) &&
            const DeepCollectionEquality().equals(other.otp, otp) &&
            const DeepCollectionEquality().equals(other.client, client));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(errors),
      const DeepCollectionEquality().hash(otp),
      const DeepCollectionEquality().hash(client));

  @JsonKey(ignore: true)
  @override
  _$OnBoardingSupplementsCopyWith<_OnBoardingSupplements> get copyWith =>
      __$OnBoardingSupplementsCopyWithImpl<_OnBoardingSupplements>(
          this, _$identity);
}

abstract class _OnBoardingSupplements implements OnBoardingSupplements {
  const factory _OnBoardingSupplements(
      {required String password,
      required Map<String, String> errors,
      required Map<int, String> otp,
      required User client}) = _$_OnBoardingSupplements;

  @override
  String get password;
  @override
  Map<String, String> get errors;
  @override
  Map<int, String> get otp;
  @override
  User get client;
  @override
  @JsonKey(ignore: true)
  _$OnBoardingSupplementsCopyWith<_OnBoardingSupplements> get copyWith =>
      throw _privateConstructorUsedError;
}
