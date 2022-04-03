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
      required User user,
      required int currency}) {
    return _OnBoardingSupplements(
      password: password,
      errors: errors,
      user: user,
      currency: currency,
    );
  }
}

/// @nodoc
const $OnBoardingSupplements = _$OnBoardingSupplementsTearOff();

/// @nodoc
mixin _$OnBoardingSupplements {
  String get password => throw _privateConstructorUsedError;
  Map<String, String> get errors => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  int get currency => throw _privateConstructorUsedError;

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
      {String password, Map<String, String> errors, User user, int currency});

  $UserCopyWith<$Res> get user;
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
    Object? user = freezed,
    Object? currency = freezed,
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
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
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
      {String password, Map<String, String> errors, User user, int currency});

  @override
  $UserCopyWith<$Res> get user;
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
    Object? user = freezed,
    Object? currency = freezed,
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
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_OnBoardingSupplements implements _OnBoardingSupplements {
  const _$_OnBoardingSupplements(
      {required this.password,
      required this.errors,
      required this.user,
      required this.currency});

  @override
  final String password;
  @override
  final Map<String, String> errors;
  @override
  final User user;
  @override
  final int currency;

  @override
  String toString() {
    return 'OnBoardingSupplements(password: $password, errors: $errors, user: $user, currency: $currency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OnBoardingSupplements &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.errors, errors) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.currency, currency));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(errors),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(currency));

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
      required User user,
      required int currency}) = _$_OnBoardingSupplements;

  @override
  String get password;
  @override
  Map<String, String> get errors;
  @override
  User get user;
  @override
  int get currency;
  @override
  @JsonKey(ignore: true)
  _$OnBoardingSupplementsCopyWith<_OnBoardingSupplements> get copyWith =>
      throw _privateConstructorUsedError;
}
