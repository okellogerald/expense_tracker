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

  _OnBoardingSupplements call({required String phone, required Client client}) {
    return _OnBoardingSupplements(
      phone: phone,
      client: client,
    );
  }
}

/// @nodoc
const $OnBoardingSupplements = _$OnBoardingSupplementsTearOff();

/// @nodoc
mixin _$OnBoardingSupplements {
  String get phone => throw _privateConstructorUsedError;
  Client get client => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnBoardingSupplementsCopyWith<OnBoardingSupplements> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnBoardingSupplementsCopyWith<$Res> {
  factory $OnBoardingSupplementsCopyWith(OnBoardingSupplements value,
          $Res Function(OnBoardingSupplements) then) =
      _$OnBoardingSupplementsCopyWithImpl<$Res>;
  $Res call({String phone, Client client});
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
    Object? phone = freezed,
    Object? client = freezed,
  }) {
    return _then(_value.copyWith(
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      client: client == freezed
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as Client,
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
  $Res call({String phone, Client client});
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
    Object? phone = freezed,
    Object? client = freezed,
  }) {
    return _then(_OnBoardingSupplements(
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      client: client == freezed
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as Client,
    ));
  }
}

/// @nodoc

class _$_OnBoardingSupplements implements _OnBoardingSupplements {
  const _$_OnBoardingSupplements({required this.phone, required this.client});

  @override
  final String phone;
  @override
  final Client client;

  @override
  String toString() {
    return 'OnBoardingSupplements(phone: $phone, client: $client)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OnBoardingSupplements &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.client, client));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(client));

  @JsonKey(ignore: true)
  @override
  _$OnBoardingSupplementsCopyWith<_OnBoardingSupplements> get copyWith =>
      __$OnBoardingSupplementsCopyWithImpl<_OnBoardingSupplements>(
          this, _$identity);
}

abstract class _OnBoardingSupplements implements OnBoardingSupplements {
  const factory _OnBoardingSupplements(
      {required String phone,
      required Client client}) = _$_OnBoardingSupplements;

  @override
  String get phone;
  @override
  Client get client;
  @override
  @JsonKey(ignore: true)
  _$OnBoardingSupplementsCopyWith<_OnBoardingSupplements> get copyWith =>
      throw _privateConstructorUsedError;
}
