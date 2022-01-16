// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'budget_page_supplements.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BudgetPageSupplementsTearOff {
  const _$BudgetPageSupplementsTearOff();

  _BudgetPageSupplements call(
      {required List<Budget> budgetList,
      required String id,
      required Map<String, Map<String, int>> dailyBudgetMap}) {
    return _BudgetPageSupplements(
      budgetList: budgetList,
      id: id,
      dailyBudgetMap: dailyBudgetMap,
    );
  }
}

/// @nodoc
const $BudgetPageSupplements = _$BudgetPageSupplementsTearOff();

/// @nodoc
mixin _$BudgetPageSupplements {
  List<Budget> get budgetList => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  Map<String, Map<String, int>> get dailyBudgetMap =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BudgetPageSupplementsCopyWith<BudgetPageSupplements> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetPageSupplementsCopyWith<$Res> {
  factory $BudgetPageSupplementsCopyWith(BudgetPageSupplements value,
          $Res Function(BudgetPageSupplements) then) =
      _$BudgetPageSupplementsCopyWithImpl<$Res>;
  $Res call(
      {List<Budget> budgetList,
      String id,
      Map<String, Map<String, int>> dailyBudgetMap});
}

/// @nodoc
class _$BudgetPageSupplementsCopyWithImpl<$Res>
    implements $BudgetPageSupplementsCopyWith<$Res> {
  _$BudgetPageSupplementsCopyWithImpl(this._value, this._then);

  final BudgetPageSupplements _value;
  // ignore: unused_field
  final $Res Function(BudgetPageSupplements) _then;

  @override
  $Res call({
    Object? budgetList = freezed,
    Object? id = freezed,
    Object? dailyBudgetMap = freezed,
  }) {
    return _then(_value.copyWith(
      budgetList: budgetList == freezed
          ? _value.budgetList
          : budgetList // ignore: cast_nullable_to_non_nullable
              as List<Budget>,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      dailyBudgetMap: dailyBudgetMap == freezed
          ? _value.dailyBudgetMap
          : dailyBudgetMap // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, int>>,
    ));
  }
}

/// @nodoc
abstract class _$BudgetPageSupplementsCopyWith<$Res>
    implements $BudgetPageSupplementsCopyWith<$Res> {
  factory _$BudgetPageSupplementsCopyWith(_BudgetPageSupplements value,
          $Res Function(_BudgetPageSupplements) then) =
      __$BudgetPageSupplementsCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Budget> budgetList,
      String id,
      Map<String, Map<String, int>> dailyBudgetMap});
}

/// @nodoc
class __$BudgetPageSupplementsCopyWithImpl<$Res>
    extends _$BudgetPageSupplementsCopyWithImpl<$Res>
    implements _$BudgetPageSupplementsCopyWith<$Res> {
  __$BudgetPageSupplementsCopyWithImpl(_BudgetPageSupplements _value,
      $Res Function(_BudgetPageSupplements) _then)
      : super(_value, (v) => _then(v as _BudgetPageSupplements));

  @override
  _BudgetPageSupplements get _value => super._value as _BudgetPageSupplements;

  @override
  $Res call({
    Object? budgetList = freezed,
    Object? id = freezed,
    Object? dailyBudgetMap = freezed,
  }) {
    return _then(_BudgetPageSupplements(
      budgetList: budgetList == freezed
          ? _value.budgetList
          : budgetList // ignore: cast_nullable_to_non_nullable
              as List<Budget>,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      dailyBudgetMap: dailyBudgetMap == freezed
          ? _value.dailyBudgetMap
          : dailyBudgetMap // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, int>>,
    ));
  }
}

/// @nodoc

class _$_BudgetPageSupplements implements _BudgetPageSupplements {
  const _$_BudgetPageSupplements(
      {required this.budgetList,
      required this.id,
      required this.dailyBudgetMap});

  @override
  final List<Budget> budgetList;
  @override
  final String id;
  @override
  final Map<String, Map<String, int>> dailyBudgetMap;

  @override
  String toString() {
    return 'BudgetPageSupplements(budgetList: $budgetList, id: $id, dailyBudgetMap: $dailyBudgetMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BudgetPageSupplements &&
            const DeepCollectionEquality()
                .equals(other.budgetList, budgetList) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.dailyBudgetMap, dailyBudgetMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(budgetList),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(dailyBudgetMap));

  @JsonKey(ignore: true)
  @override
  _$BudgetPageSupplementsCopyWith<_BudgetPageSupplements> get copyWith =>
      __$BudgetPageSupplementsCopyWithImpl<_BudgetPageSupplements>(
          this, _$identity);
}

abstract class _BudgetPageSupplements implements BudgetPageSupplements {
  const factory _BudgetPageSupplements(
          {required List<Budget> budgetList,
          required String id,
          required Map<String, Map<String, int>> dailyBudgetMap}) =
      _$_BudgetPageSupplements;

  @override
  List<Budget> get budgetList;
  @override
  String get id;
  @override
  Map<String, Map<String, int>> get dailyBudgetMap;
  @override
  @JsonKey(ignore: true)
  _$BudgetPageSupplementsCopyWith<_BudgetPageSupplements> get copyWith =>
      throw _privateConstructorUsedError;
}
