// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'budget_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BudgetPageStateTearOff {
  const _$BudgetPageStateTearOff();

  _Loading loading(List<Budget> budgetList, String id) {
    return _Loading(
      budgetList,
      id,
    );
  }

  _Content content(List<Budget> budgetList, String id) {
    return _Content(
      budgetList,
      id,
    );
  }
}

/// @nodoc
const $BudgetPageState = _$BudgetPageStateTearOff();

/// @nodoc
mixin _$BudgetPageState {
  List<Budget> get budgetList => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Budget> budgetList, String id) loading,
    required TResult Function(List<Budget> budgetList, String id) content,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Budget> budgetList, String id)? loading,
    TResult Function(List<Budget> budgetList, String id)? content,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Budget> budgetList, String id)? loading,
    TResult Function(List<Budget> budgetList, String id)? content,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Content value) content,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BudgetPageStateCopyWith<BudgetPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetPageStateCopyWith<$Res> {
  factory $BudgetPageStateCopyWith(
          BudgetPageState value, $Res Function(BudgetPageState) then) =
      _$BudgetPageStateCopyWithImpl<$Res>;
  $Res call({List<Budget> budgetList, String id});
}

/// @nodoc
class _$BudgetPageStateCopyWithImpl<$Res>
    implements $BudgetPageStateCopyWith<$Res> {
  _$BudgetPageStateCopyWithImpl(this._value, this._then);

  final BudgetPageState _value;
  // ignore: unused_field
  final $Res Function(BudgetPageState) _then;

  @override
  $Res call({
    Object? budgetList = freezed,
    Object? id = freezed,
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
    ));
  }
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res>
    implements $BudgetPageStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
  @override
  $Res call({List<Budget> budgetList, String id});
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$BudgetPageStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;

  @override
  $Res call({
    Object? budgetList = freezed,
    Object? id = freezed,
  }) {
    return _then(_Loading(
      budgetList == freezed
          ? _value.budgetList
          : budgetList // ignore: cast_nullable_to_non_nullable
              as List<Budget>,
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading(this.budgetList, this.id);

  @override
  final List<Budget> budgetList;
  @override
  final String id;

  @override
  String toString() {
    return 'BudgetPageState.loading(budgetList: $budgetList, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loading &&
            const DeepCollectionEquality()
                .equals(other.budgetList, budgetList) &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(budgetList),
      const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Budget> budgetList, String id) loading,
    required TResult Function(List<Budget> budgetList, String id) content,
  }) {
    return loading(budgetList, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Budget> budgetList, String id)? loading,
    TResult Function(List<Budget> budgetList, String id)? content,
  }) {
    return loading?.call(budgetList, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Budget> budgetList, String id)? loading,
    TResult Function(List<Budget> budgetList, String id)? content,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(budgetList, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Content value) content,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements BudgetPageState {
  const factory _Loading(List<Budget> budgetList, String id) = _$_Loading;

  @override
  List<Budget> get budgetList;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$LoadingCopyWith<_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ContentCopyWith<$Res>
    implements $BudgetPageStateCopyWith<$Res> {
  factory _$ContentCopyWith(_Content value, $Res Function(_Content) then) =
      __$ContentCopyWithImpl<$Res>;
  @override
  $Res call({List<Budget> budgetList, String id});
}

/// @nodoc
class __$ContentCopyWithImpl<$Res> extends _$BudgetPageStateCopyWithImpl<$Res>
    implements _$ContentCopyWith<$Res> {
  __$ContentCopyWithImpl(_Content _value, $Res Function(_Content) _then)
      : super(_value, (v) => _then(v as _Content));

  @override
  _Content get _value => super._value as _Content;

  @override
  $Res call({
    Object? budgetList = freezed,
    Object? id = freezed,
  }) {
    return _then(_Content(
      budgetList == freezed
          ? _value.budgetList
          : budgetList // ignore: cast_nullable_to_non_nullable
              as List<Budget>,
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Content implements _Content {
  const _$_Content(this.budgetList, this.id);

  @override
  final List<Budget> budgetList;
  @override
  final String id;

  @override
  String toString() {
    return 'BudgetPageState.content(budgetList: $budgetList, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Content &&
            const DeepCollectionEquality()
                .equals(other.budgetList, budgetList) &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(budgetList),
      const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$ContentCopyWith<_Content> get copyWith =>
      __$ContentCopyWithImpl<_Content>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Budget> budgetList, String id) loading,
    required TResult Function(List<Budget> budgetList, String id) content,
  }) {
    return content(budgetList, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Budget> budgetList, String id)? loading,
    TResult Function(List<Budget> budgetList, String id)? content,
  }) {
    return content?.call(budgetList, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Budget> budgetList, String id)? loading,
    TResult Function(List<Budget> budgetList, String id)? content,
    required TResult orElse(),
  }) {
    if (content != null) {
      return content(budgetList, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Content value) content,
  }) {
    return content(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
  }) {
    return content?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    required TResult orElse(),
  }) {
    if (content != null) {
      return content(this);
    }
    return orElse();
  }
}

abstract class _Content implements BudgetPageState {
  const factory _Content(List<Budget> budgetList, String id) = _$_Content;

  @override
  List<Budget> get budgetList;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$ContentCopyWith<_Content> get copyWith =>
      throw _privateConstructorUsedError;
}
