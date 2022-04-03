// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {@JsonKey(name: 'display_name')
          String displayName = '',
      String email = '',
      @JsonKey(name: 'signup_option')
          String signUpOption = SigningUpOptions.email_password,
      @JsonKey(name: 'photo_url')
          String photoUrl = '',
      @JsonKey(name: 'backup_option')
          String backUpOption = BackUpOptions.on_button_tap,
      @JsonKey(name: 'currency')
          int currencyCodePoint = 0}) {
    return _User(
      displayName: displayName,
      email: email,
      signUpOption: signUpOption,
      photoUrl: photoUrl,
      backUpOption: backUpOption,
      currencyCodePoint: currencyCodePoint,
    );
  }

  User fromJson(Map<String, Object?> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  @JsonKey(name: 'display_name')
  String get displayName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'signup_option')
  String get signUpOption => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo_url')
  String get photoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'backup_option')
  String get backUpOption => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency')
  int get currencyCodePoint => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'display_name') String displayName,
      String email,
      @JsonKey(name: 'signup_option') String signUpOption,
      @JsonKey(name: 'photo_url') String photoUrl,
      @JsonKey(name: 'backup_option') String backUpOption,
      @JsonKey(name: 'currency') int currencyCodePoint});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? displayName = freezed,
    Object? email = freezed,
    Object? signUpOption = freezed,
    Object? photoUrl = freezed,
    Object? backUpOption = freezed,
    Object? currencyCodePoint = freezed,
  }) {
    return _then(_value.copyWith(
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      signUpOption: signUpOption == freezed
          ? _value.signUpOption
          : signUpOption // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      backUpOption: backUpOption == freezed
          ? _value.backUpOption
          : backUpOption // ignore: cast_nullable_to_non_nullable
              as String,
      currencyCodePoint: currencyCodePoint == freezed
          ? _value.currencyCodePoint
          : currencyCodePoint // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'display_name') String displayName,
      String email,
      @JsonKey(name: 'signup_option') String signUpOption,
      @JsonKey(name: 'photo_url') String photoUrl,
      @JsonKey(name: 'backup_option') String backUpOption,
      @JsonKey(name: 'currency') int currencyCodePoint});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? displayName = freezed,
    Object? email = freezed,
    Object? signUpOption = freezed,
    Object? photoUrl = freezed,
    Object? backUpOption = freezed,
    Object? currencyCodePoint = freezed,
  }) {
    return _then(_User(
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      signUpOption: signUpOption == freezed
          ? _value.signUpOption
          : signUpOption // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      backUpOption: backUpOption == freezed
          ? _value.backUpOption
          : backUpOption // ignore: cast_nullable_to_non_nullable
              as String,
      currencyCodePoint: currencyCodePoint == freezed
          ? _value.currencyCodePoint
          : currencyCodePoint // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User extends _User {
  const _$_User(
      {@JsonKey(name: 'display_name')
          this.displayName = '',
      this.email = '',
      @JsonKey(name: 'signup_option')
          this.signUpOption = SigningUpOptions.email_password,
      @JsonKey(name: 'photo_url')
          this.photoUrl = '',
      @JsonKey(name: 'backup_option')
          this.backUpOption = BackUpOptions.on_button_tap,
      @JsonKey(name: 'currency')
          this.currencyCodePoint = 0})
      : super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  @JsonKey(name: 'display_name')
  final String displayName;
  @JsonKey()
  @override
  final String email;
  @override
  @JsonKey(name: 'signup_option')
  final String signUpOption;
  @override
  @JsonKey(name: 'photo_url')
  final String photoUrl;
  @override
  @JsonKey(name: 'backup_option')
  final String backUpOption;
  @override
  @JsonKey(name: 'currency')
  final int currencyCodePoint;

  @override
  String toString() {
    return 'User(displayName: $displayName, email: $email, signUpOption: $signUpOption, photoUrl: $photoUrl, backUpOption: $backUpOption, currencyCodePoint: $currencyCodePoint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            const DeepCollectionEquality()
                .equals(other.displayName, displayName) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.signUpOption, signUpOption) &&
            const DeepCollectionEquality().equals(other.photoUrl, photoUrl) &&
            const DeepCollectionEquality()
                .equals(other.backUpOption, backUpOption) &&
            const DeepCollectionEquality()
                .equals(other.currencyCodePoint, currencyCodePoint));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(displayName),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(signUpOption),
      const DeepCollectionEquality().hash(photoUrl),
      const DeepCollectionEquality().hash(backUpOption),
      const DeepCollectionEquality().hash(currencyCodePoint));

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User extends User {
  const factory _User(
      {@JsonKey(name: 'display_name') String displayName,
      String email,
      @JsonKey(name: 'signup_option') String signUpOption,
      @JsonKey(name: 'photo_url') String photoUrl,
      @JsonKey(name: 'backup_option') String backUpOption,
      @JsonKey(name: 'currency') int currencyCodePoint}) = _$_User;
  const _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  @JsonKey(name: 'display_name')
  String get displayName;
  @override
  String get email;
  @override
  @JsonKey(name: 'signup_option')
  String get signUpOption;
  @override
  @JsonKey(name: 'photo_url')
  String get photoUrl;
  @override
  @JsonKey(name: 'backup_option')
  String get backUpOption;
  @override
  @JsonKey(name: 'currency')
  int get currencyCodePoint;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
