// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reports_page_supplements.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ReportsPageSupplementsTearOff {
  const _$ReportsPageSupplementsTearOff();

  _ReportsPageSupplements call(
      {required TotalRecords totalRecords,
      required CurrentAnalysis currentAnalysis}) {
    return _ReportsPageSupplements(
      totalRecords: totalRecords,
      currentAnalysis: currentAnalysis,
    );
  }
}

/// @nodoc
const $ReportsPageSupplements = _$ReportsPageSupplementsTearOff();

/// @nodoc
mixin _$ReportsPageSupplements {
  TotalRecords get totalRecords => throw _privateConstructorUsedError;
  CurrentAnalysis get currentAnalysis => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReportsPageSupplementsCopyWith<ReportsPageSupplements> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportsPageSupplementsCopyWith<$Res> {
  factory $ReportsPageSupplementsCopyWith(ReportsPageSupplements value,
          $Res Function(ReportsPageSupplements) then) =
      _$ReportsPageSupplementsCopyWithImpl<$Res>;
  $Res call({TotalRecords totalRecords, CurrentAnalysis currentAnalysis});
}

/// @nodoc
class _$ReportsPageSupplementsCopyWithImpl<$Res>
    implements $ReportsPageSupplementsCopyWith<$Res> {
  _$ReportsPageSupplementsCopyWithImpl(this._value, this._then);

  final ReportsPageSupplements _value;
  // ignore: unused_field
  final $Res Function(ReportsPageSupplements) _then;

  @override
  $Res call({
    Object? totalRecords = freezed,
    Object? currentAnalysis = freezed,
  }) {
    return _then(_value.copyWith(
      totalRecords: totalRecords == freezed
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as TotalRecords,
      currentAnalysis: currentAnalysis == freezed
          ? _value.currentAnalysis
          : currentAnalysis // ignore: cast_nullable_to_non_nullable
              as CurrentAnalysis,
    ));
  }
}

/// @nodoc
abstract class _$ReportsPageSupplementsCopyWith<$Res>
    implements $ReportsPageSupplementsCopyWith<$Res> {
  factory _$ReportsPageSupplementsCopyWith(_ReportsPageSupplements value,
          $Res Function(_ReportsPageSupplements) then) =
      __$ReportsPageSupplementsCopyWithImpl<$Res>;
  @override
  $Res call({TotalRecords totalRecords, CurrentAnalysis currentAnalysis});
}

/// @nodoc
class __$ReportsPageSupplementsCopyWithImpl<$Res>
    extends _$ReportsPageSupplementsCopyWithImpl<$Res>
    implements _$ReportsPageSupplementsCopyWith<$Res> {
  __$ReportsPageSupplementsCopyWithImpl(_ReportsPageSupplements _value,
      $Res Function(_ReportsPageSupplements) _then)
      : super(_value, (v) => _then(v as _ReportsPageSupplements));

  @override
  _ReportsPageSupplements get _value => super._value as _ReportsPageSupplements;

  @override
  $Res call({
    Object? totalRecords = freezed,
    Object? currentAnalysis = freezed,
  }) {
    return _then(_ReportsPageSupplements(
      totalRecords: totalRecords == freezed
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as TotalRecords,
      currentAnalysis: currentAnalysis == freezed
          ? _value.currentAnalysis
          : currentAnalysis // ignore: cast_nullable_to_non_nullable
              as CurrentAnalysis,
    ));
  }
}

/// @nodoc

class _$_ReportsPageSupplements implements _ReportsPageSupplements {
  const _$_ReportsPageSupplements(
      {required this.totalRecords, required this.currentAnalysis});

  @override
  final TotalRecords totalRecords;
  @override
  final CurrentAnalysis currentAnalysis;

  @override
  String toString() {
    return 'ReportsPageSupplements(totalRecords: $totalRecords, currentAnalysis: $currentAnalysis)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReportsPageSupplements &&
            const DeepCollectionEquality()
                .equals(other.totalRecords, totalRecords) &&
            const DeepCollectionEquality()
                .equals(other.currentAnalysis, currentAnalysis));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(totalRecords),
      const DeepCollectionEquality().hash(currentAnalysis));

  @JsonKey(ignore: true)
  @override
  _$ReportsPageSupplementsCopyWith<_ReportsPageSupplements> get copyWith =>
      __$ReportsPageSupplementsCopyWithImpl<_ReportsPageSupplements>(
          this, _$identity);
}

abstract class _ReportsPageSupplements implements ReportsPageSupplements {
  const factory _ReportsPageSupplements(
      {required TotalRecords totalRecords,
      required CurrentAnalysis currentAnalysis}) = _$_ReportsPageSupplements;

  @override
  TotalRecords get totalRecords;
  @override
  CurrentAnalysis get currentAnalysis;
  @override
  @JsonKey(ignore: true)
  _$ReportsPageSupplementsCopyWith<_ReportsPageSupplements> get copyWith =>
      throw _privateConstructorUsedError;
}
