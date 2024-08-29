// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reports_page_supplements.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReportsPageSupplements {
  TotalRecords get totalRecords => throw _privateConstructorUsedError;
  CurrentAnalysis get currentAnalysis => throw _privateConstructorUsedError;
  List<Record> get records => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;

  /// Create a copy of ReportsPageSupplements
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportsPageSupplementsCopyWith<ReportsPageSupplements> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportsPageSupplementsCopyWith<$Res> {
  factory $ReportsPageSupplementsCopyWith(ReportsPageSupplements value,
          $Res Function(ReportsPageSupplements) then) =
      _$ReportsPageSupplementsCopyWithImpl<$Res, ReportsPageSupplements>;
  @useResult
  $Res call(
      {TotalRecords totalRecords,
      CurrentAnalysis currentAnalysis,
      List<Record> records,
      int index});
}

/// @nodoc
class _$ReportsPageSupplementsCopyWithImpl<$Res,
        $Val extends ReportsPageSupplements>
    implements $ReportsPageSupplementsCopyWith<$Res> {
  _$ReportsPageSupplementsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportsPageSupplements
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRecords = null,
    Object? currentAnalysis = null,
    Object? records = null,
    Object? index = null,
  }) {
    return _then(_value.copyWith(
      totalRecords: null == totalRecords
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as TotalRecords,
      currentAnalysis: null == currentAnalysis
          ? _value.currentAnalysis
          : currentAnalysis // ignore: cast_nullable_to_non_nullable
              as CurrentAnalysis,
      records: null == records
          ? _value.records
          : records // ignore: cast_nullable_to_non_nullable
              as List<Record>,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportsPageSupplementsImplCopyWith<$Res>
    implements $ReportsPageSupplementsCopyWith<$Res> {
  factory _$$ReportsPageSupplementsImplCopyWith(
          _$ReportsPageSupplementsImpl value,
          $Res Function(_$ReportsPageSupplementsImpl) then) =
      __$$ReportsPageSupplementsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TotalRecords totalRecords,
      CurrentAnalysis currentAnalysis,
      List<Record> records,
      int index});
}

/// @nodoc
class __$$ReportsPageSupplementsImplCopyWithImpl<$Res>
    extends _$ReportsPageSupplementsCopyWithImpl<$Res,
        _$ReportsPageSupplementsImpl>
    implements _$$ReportsPageSupplementsImplCopyWith<$Res> {
  __$$ReportsPageSupplementsImplCopyWithImpl(
      _$ReportsPageSupplementsImpl _value,
      $Res Function(_$ReportsPageSupplementsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportsPageSupplements
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRecords = null,
    Object? currentAnalysis = null,
    Object? records = null,
    Object? index = null,
  }) {
    return _then(_$ReportsPageSupplementsImpl(
      totalRecords: null == totalRecords
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as TotalRecords,
      currentAnalysis: null == currentAnalysis
          ? _value.currentAnalysis
          : currentAnalysis // ignore: cast_nullable_to_non_nullable
              as CurrentAnalysis,
      records: null == records
          ? _value._records
          : records // ignore: cast_nullable_to_non_nullable
              as List<Record>,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ReportsPageSupplementsImpl implements _ReportsPageSupplements {
  const _$ReportsPageSupplementsImpl(
      {required this.totalRecords,
      required this.currentAnalysis,
      required final List<Record> records,
      required this.index})
      : _records = records;

  @override
  final TotalRecords totalRecords;
  @override
  final CurrentAnalysis currentAnalysis;
  final List<Record> _records;
  @override
  List<Record> get records {
    if (_records is EqualUnmodifiableListView) return _records;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_records);
  }

  @override
  final int index;

  @override
  String toString() {
    return 'ReportsPageSupplements(totalRecords: $totalRecords, currentAnalysis: $currentAnalysis, records: $records, index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportsPageSupplementsImpl &&
            (identical(other.totalRecords, totalRecords) ||
                other.totalRecords == totalRecords) &&
            (identical(other.currentAnalysis, currentAnalysis) ||
                other.currentAnalysis == currentAnalysis) &&
            const DeepCollectionEquality().equals(other._records, _records) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totalRecords, currentAnalysis,
      const DeepCollectionEquality().hash(_records), index);

  /// Create a copy of ReportsPageSupplements
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportsPageSupplementsImplCopyWith<_$ReportsPageSupplementsImpl>
      get copyWith => __$$ReportsPageSupplementsImplCopyWithImpl<
          _$ReportsPageSupplementsImpl>(this, _$identity);
}

abstract class _ReportsPageSupplements implements ReportsPageSupplements {
  const factory _ReportsPageSupplements(
      {required final TotalRecords totalRecords,
      required final CurrentAnalysis currentAnalysis,
      required final List<Record> records,
      required final int index}) = _$ReportsPageSupplementsImpl;

  @override
  TotalRecords get totalRecords;
  @override
  CurrentAnalysis get currentAnalysis;
  @override
  List<Record> get records;
  @override
  int get index;

  /// Create a copy of ReportsPageSupplements
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportsPageSupplementsImplCopyWith<_$ReportsPageSupplementsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
