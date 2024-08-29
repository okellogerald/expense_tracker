// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_page_supplements.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BudgetPageSupplements {
  List<Budget> get budgetList => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  Map<String, Map<String, int>> get dailyBudgetMap =>
      throw _privateConstructorUsedError;

  /// Create a copy of BudgetPageSupplements
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BudgetPageSupplementsCopyWith<BudgetPageSupplements> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetPageSupplementsCopyWith<$Res> {
  factory $BudgetPageSupplementsCopyWith(BudgetPageSupplements value,
          $Res Function(BudgetPageSupplements) then) =
      _$BudgetPageSupplementsCopyWithImpl<$Res, BudgetPageSupplements>;
  @useResult
  $Res call(
      {List<Budget> budgetList,
      String id,
      Map<String, Map<String, int>> dailyBudgetMap});
}

/// @nodoc
class _$BudgetPageSupplementsCopyWithImpl<$Res,
        $Val extends BudgetPageSupplements>
    implements $BudgetPageSupplementsCopyWith<$Res> {
  _$BudgetPageSupplementsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BudgetPageSupplements
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budgetList = null,
    Object? id = null,
    Object? dailyBudgetMap = null,
  }) {
    return _then(_value.copyWith(
      budgetList: null == budgetList
          ? _value.budgetList
          : budgetList // ignore: cast_nullable_to_non_nullable
              as List<Budget>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      dailyBudgetMap: null == dailyBudgetMap
          ? _value.dailyBudgetMap
          : dailyBudgetMap // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, int>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BudgetPageSupplementsImplCopyWith<$Res>
    implements $BudgetPageSupplementsCopyWith<$Res> {
  factory _$$BudgetPageSupplementsImplCopyWith(
          _$BudgetPageSupplementsImpl value,
          $Res Function(_$BudgetPageSupplementsImpl) then) =
      __$$BudgetPageSupplementsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Budget> budgetList,
      String id,
      Map<String, Map<String, int>> dailyBudgetMap});
}

/// @nodoc
class __$$BudgetPageSupplementsImplCopyWithImpl<$Res>
    extends _$BudgetPageSupplementsCopyWithImpl<$Res,
        _$BudgetPageSupplementsImpl>
    implements _$$BudgetPageSupplementsImplCopyWith<$Res> {
  __$$BudgetPageSupplementsImplCopyWithImpl(_$BudgetPageSupplementsImpl _value,
      $Res Function(_$BudgetPageSupplementsImpl) _then)
      : super(_value, _then);

  /// Create a copy of BudgetPageSupplements
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budgetList = null,
    Object? id = null,
    Object? dailyBudgetMap = null,
  }) {
    return _then(_$BudgetPageSupplementsImpl(
      budgetList: null == budgetList
          ? _value._budgetList
          : budgetList // ignore: cast_nullable_to_non_nullable
              as List<Budget>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      dailyBudgetMap: null == dailyBudgetMap
          ? _value._dailyBudgetMap
          : dailyBudgetMap // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, int>>,
    ));
  }
}

/// @nodoc

class _$BudgetPageSupplementsImpl implements _BudgetPageSupplements {
  const _$BudgetPageSupplementsImpl(
      {required final List<Budget> budgetList,
      required this.id,
      required final Map<String, Map<String, int>> dailyBudgetMap})
      : _budgetList = budgetList,
        _dailyBudgetMap = dailyBudgetMap;

  final List<Budget> _budgetList;
  @override
  List<Budget> get budgetList {
    if (_budgetList is EqualUnmodifiableListView) return _budgetList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_budgetList);
  }

  @override
  final String id;
  final Map<String, Map<String, int>> _dailyBudgetMap;
  @override
  Map<String, Map<String, int>> get dailyBudgetMap {
    if (_dailyBudgetMap is EqualUnmodifiableMapView) return _dailyBudgetMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_dailyBudgetMap);
  }

  @override
  String toString() {
    return 'BudgetPageSupplements(budgetList: $budgetList, id: $id, dailyBudgetMap: $dailyBudgetMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetPageSupplementsImpl &&
            const DeepCollectionEquality()
                .equals(other._budgetList, _budgetList) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._dailyBudgetMap, _dailyBudgetMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_budgetList),
      id,
      const DeepCollectionEquality().hash(_dailyBudgetMap));

  /// Create a copy of BudgetPageSupplements
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetPageSupplementsImplCopyWith<_$BudgetPageSupplementsImpl>
      get copyWith => __$$BudgetPageSupplementsImplCopyWithImpl<
          _$BudgetPageSupplementsImpl>(this, _$identity);
}

abstract class _BudgetPageSupplements implements BudgetPageSupplements {
  const factory _BudgetPageSupplements(
          {required final List<Budget> budgetList,
          required final String id,
          required final Map<String, Map<String, int>> dailyBudgetMap}) =
      _$BudgetPageSupplementsImpl;

  @override
  List<Budget> get budgetList;
  @override
  String get id;
  @override
  Map<String, Map<String, int>> get dailyBudgetMap;

  /// Create a copy of BudgetPageSupplements
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BudgetPageSupplementsImplCopyWith<_$BudgetPageSupplementsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
