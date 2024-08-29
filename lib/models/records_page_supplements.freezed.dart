// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'records_page_supplements.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecordsPageSupplements {
  TotalRecords get totalRecords => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  int get day => throw _privateConstructorUsedError;
  List<dynamic> get withTotalsDays => throw _privateConstructorUsedError;
  Map<int, List<double>> get totalsMap => throw _privateConstructorUsedError;
  int get currency => throw _privateConstructorUsedError;

  /// Create a copy of RecordsPageSupplements
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecordsPageSupplementsCopyWith<RecordsPageSupplements> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordsPageSupplementsCopyWith<$Res> {
  factory $RecordsPageSupplementsCopyWith(RecordsPageSupplements value,
          $Res Function(RecordsPageSupplements) then) =
      _$RecordsPageSupplementsCopyWithImpl<$Res, RecordsPageSupplements>;
  @useResult
  $Res call(
      {TotalRecords totalRecords,
      String id,
      int day,
      List<dynamic> withTotalsDays,
      Map<int, List<double>> totalsMap,
      int currency});
}

/// @nodoc
class _$RecordsPageSupplementsCopyWithImpl<$Res,
        $Val extends RecordsPageSupplements>
    implements $RecordsPageSupplementsCopyWith<$Res> {
  _$RecordsPageSupplementsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecordsPageSupplements
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRecords = null,
    Object? id = null,
    Object? day = null,
    Object? withTotalsDays = null,
    Object? totalsMap = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      totalRecords: null == totalRecords
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as TotalRecords,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      withTotalsDays: null == withTotalsDays
          ? _value.withTotalsDays
          : withTotalsDays // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      totalsMap: null == totalsMap
          ? _value.totalsMap
          : totalsMap // ignore: cast_nullable_to_non_nullable
              as Map<int, List<double>>,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecordsPageSupplementsImplCopyWith<$Res>
    implements $RecordsPageSupplementsCopyWith<$Res> {
  factory _$$RecordsPageSupplementsImplCopyWith(
          _$RecordsPageSupplementsImpl value,
          $Res Function(_$RecordsPageSupplementsImpl) then) =
      __$$RecordsPageSupplementsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TotalRecords totalRecords,
      String id,
      int day,
      List<dynamic> withTotalsDays,
      Map<int, List<double>> totalsMap,
      int currency});
}

/// @nodoc
class __$$RecordsPageSupplementsImplCopyWithImpl<$Res>
    extends _$RecordsPageSupplementsCopyWithImpl<$Res,
        _$RecordsPageSupplementsImpl>
    implements _$$RecordsPageSupplementsImplCopyWith<$Res> {
  __$$RecordsPageSupplementsImplCopyWithImpl(
      _$RecordsPageSupplementsImpl _value,
      $Res Function(_$RecordsPageSupplementsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecordsPageSupplements
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRecords = null,
    Object? id = null,
    Object? day = null,
    Object? withTotalsDays = null,
    Object? totalsMap = null,
    Object? currency = null,
  }) {
    return _then(_$RecordsPageSupplementsImpl(
      totalRecords: null == totalRecords
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as TotalRecords,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      withTotalsDays: null == withTotalsDays
          ? _value._withTotalsDays
          : withTotalsDays // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      totalsMap: null == totalsMap
          ? _value._totalsMap
          : totalsMap // ignore: cast_nullable_to_non_nullable
              as Map<int, List<double>>,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RecordsPageSupplementsImpl extends _RecordsPageSupplements {
  const _$RecordsPageSupplementsImpl(
      {required this.totalRecords,
      this.id = '-1',
      this.day = -1,
      final List<dynamic> withTotalsDays = const [],
      final Map<int, List<double>> totalsMap = const {},
      this.currency = 0})
      : _withTotalsDays = withTotalsDays,
        _totalsMap = totalsMap,
        super._();

  @override
  final TotalRecords totalRecords;
  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final int day;
  final List<dynamic> _withTotalsDays;
  @override
  @JsonKey()
  List<dynamic> get withTotalsDays {
    if (_withTotalsDays is EqualUnmodifiableListView) return _withTotalsDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_withTotalsDays);
  }

  final Map<int, List<double>> _totalsMap;
  @override
  @JsonKey()
  Map<int, List<double>> get totalsMap {
    if (_totalsMap is EqualUnmodifiableMapView) return _totalsMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_totalsMap);
  }

  @override
  @JsonKey()
  final int currency;

  @override
  String toString() {
    return 'RecordsPageSupplements(totalRecords: $totalRecords, id: $id, day: $day, withTotalsDays: $withTotalsDays, totalsMap: $totalsMap, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordsPageSupplementsImpl &&
            (identical(other.totalRecords, totalRecords) ||
                other.totalRecords == totalRecords) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.day, day) || other.day == day) &&
            const DeepCollectionEquality()
                .equals(other._withTotalsDays, _withTotalsDays) &&
            const DeepCollectionEquality()
                .equals(other._totalsMap, _totalsMap) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalRecords,
      id,
      day,
      const DeepCollectionEquality().hash(_withTotalsDays),
      const DeepCollectionEquality().hash(_totalsMap),
      currency);

  /// Create a copy of RecordsPageSupplements
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordsPageSupplementsImplCopyWith<_$RecordsPageSupplementsImpl>
      get copyWith => __$$RecordsPageSupplementsImplCopyWithImpl<
          _$RecordsPageSupplementsImpl>(this, _$identity);
}

abstract class _RecordsPageSupplements extends RecordsPageSupplements {
  const factory _RecordsPageSupplements(
      {required final TotalRecords totalRecords,
      final String id,
      final int day,
      final List<dynamic> withTotalsDays,
      final Map<int, List<double>> totalsMap,
      final int currency}) = _$RecordsPageSupplementsImpl;
  const _RecordsPageSupplements._() : super._();

  @override
  TotalRecords get totalRecords;
  @override
  String get id;
  @override
  int get day;
  @override
  List<dynamic> get withTotalsDays;
  @override
  Map<int, List<double>> get totalsMap;
  @override
  int get currency;

  /// Create a copy of RecordsPageSupplements
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordsPageSupplementsImplCopyWith<_$RecordsPageSupplementsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
