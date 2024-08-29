// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BudgetPageState {
  BudgetPageSupplements get supp => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BudgetPageSupplements supp) loading,
    required TResult Function(BudgetPageSupplements supp) content,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BudgetPageSupplements supp)? loading,
    TResult? Function(BudgetPageSupplements supp)? content,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BudgetPageSupplements supp)? loading,
    TResult Function(BudgetPageSupplements supp)? content,
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
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Content value)? content,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of BudgetPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BudgetPageStateCopyWith<BudgetPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetPageStateCopyWith<$Res> {
  factory $BudgetPageStateCopyWith(
          BudgetPageState value, $Res Function(BudgetPageState) then) =
      _$BudgetPageStateCopyWithImpl<$Res, BudgetPageState>;
  @useResult
  $Res call({BudgetPageSupplements supp});

  $BudgetPageSupplementsCopyWith<$Res> get supp;
}

/// @nodoc
class _$BudgetPageStateCopyWithImpl<$Res, $Val extends BudgetPageState>
    implements $BudgetPageStateCopyWith<$Res> {
  _$BudgetPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BudgetPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supp = null,
  }) {
    return _then(_value.copyWith(
      supp: null == supp
          ? _value.supp
          : supp // ignore: cast_nullable_to_non_nullable
              as BudgetPageSupplements,
    ) as $Val);
  }

  /// Create a copy of BudgetPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BudgetPageSupplementsCopyWith<$Res> get supp {
    return $BudgetPageSupplementsCopyWith<$Res>(_value.supp, (value) {
      return _then(_value.copyWith(supp: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $BudgetPageStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BudgetPageSupplements supp});

  @override
  $BudgetPageSupplementsCopyWith<$Res> get supp;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$BudgetPageStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of BudgetPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supp = null,
  }) {
    return _then(_$LoadingImpl(
      null == supp
          ? _value.supp
          : supp // ignore: cast_nullable_to_non_nullable
              as BudgetPageSupplements,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(this.supp);

  @override
  final BudgetPageSupplements supp;

  @override
  String toString() {
    return 'BudgetPageState.loading(supp: $supp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.supp, supp) || other.supp == supp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, supp);

  /// Create a copy of BudgetPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BudgetPageSupplements supp) loading,
    required TResult Function(BudgetPageSupplements supp) content,
  }) {
    return loading(supp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BudgetPageSupplements supp)? loading,
    TResult? Function(BudgetPageSupplements supp)? content,
  }) {
    return loading?.call(supp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BudgetPageSupplements supp)? loading,
    TResult Function(BudgetPageSupplements supp)? content,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(supp);
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
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Content value)? content,
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
  const factory _Loading(final BudgetPageSupplements supp) = _$LoadingImpl;

  @override
  BudgetPageSupplements get supp;

  /// Create a copy of BudgetPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ContentImplCopyWith<$Res>
    implements $BudgetPageStateCopyWith<$Res> {
  factory _$$ContentImplCopyWith(
          _$ContentImpl value, $Res Function(_$ContentImpl) then) =
      __$$ContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BudgetPageSupplements supp});

  @override
  $BudgetPageSupplementsCopyWith<$Res> get supp;
}

/// @nodoc
class __$$ContentImplCopyWithImpl<$Res>
    extends _$BudgetPageStateCopyWithImpl<$Res, _$ContentImpl>
    implements _$$ContentImplCopyWith<$Res> {
  __$$ContentImplCopyWithImpl(
      _$ContentImpl _value, $Res Function(_$ContentImpl) _then)
      : super(_value, _then);

  /// Create a copy of BudgetPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supp = null,
  }) {
    return _then(_$ContentImpl(
      null == supp
          ? _value.supp
          : supp // ignore: cast_nullable_to_non_nullable
              as BudgetPageSupplements,
    ));
  }
}

/// @nodoc

class _$ContentImpl implements _Content {
  const _$ContentImpl(this.supp);

  @override
  final BudgetPageSupplements supp;

  @override
  String toString() {
    return 'BudgetPageState.content(supp: $supp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentImpl &&
            (identical(other.supp, supp) || other.supp == supp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, supp);

  /// Create a copy of BudgetPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentImplCopyWith<_$ContentImpl> get copyWith =>
      __$$ContentImplCopyWithImpl<_$ContentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BudgetPageSupplements supp) loading,
    required TResult Function(BudgetPageSupplements supp) content,
  }) {
    return content(supp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BudgetPageSupplements supp)? loading,
    TResult? Function(BudgetPageSupplements supp)? content,
  }) {
    return content?.call(supp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BudgetPageSupplements supp)? loading,
    TResult Function(BudgetPageSupplements supp)? content,
    required TResult orElse(),
  }) {
    if (content != null) {
      return content(supp);
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
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Content value)? content,
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
  const factory _Content(final BudgetPageSupplements supp) = _$ContentImpl;

  @override
  BudgetPageSupplements get supp;

  /// Create a copy of BudgetPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentImplCopyWith<_$ContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
