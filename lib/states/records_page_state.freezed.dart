// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'records_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecordsPageState {
  List<Record> get recordList => throw _privateConstructorUsedError;
  RecordsPageSupplements get supplements => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)
        loading,
    required TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)
        content,
    required TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        loading,
    TResult? Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        content,
    TResult? Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        loading,
    TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        content,
    TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Content value) content,
    required TResult Function(_Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Content value)? content,
    TResult? Function(_Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of RecordsPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecordsPageStateCopyWith<RecordsPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordsPageStateCopyWith<$Res> {
  factory $RecordsPageStateCopyWith(
          RecordsPageState value, $Res Function(RecordsPageState) then) =
      _$RecordsPageStateCopyWithImpl<$Res, RecordsPageState>;
  @useResult
  $Res call({List<Record> recordList, RecordsPageSupplements supplements});

  $RecordsPageSupplementsCopyWith<$Res> get supplements;
}

/// @nodoc
class _$RecordsPageStateCopyWithImpl<$Res, $Val extends RecordsPageState>
    implements $RecordsPageStateCopyWith<$Res> {
  _$RecordsPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecordsPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recordList = null,
    Object? supplements = null,
  }) {
    return _then(_value.copyWith(
      recordList: null == recordList
          ? _value.recordList
          : recordList // ignore: cast_nullable_to_non_nullable
              as List<Record>,
      supplements: null == supplements
          ? _value.supplements
          : supplements // ignore: cast_nullable_to_non_nullable
              as RecordsPageSupplements,
    ) as $Val);
  }

  /// Create a copy of RecordsPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RecordsPageSupplementsCopyWith<$Res> get supplements {
    return $RecordsPageSupplementsCopyWith<$Res>(_value.supplements, (value) {
      return _then(_value.copyWith(supplements: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $RecordsPageStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Record> recordList, RecordsPageSupplements supplements});

  @override
  $RecordsPageSupplementsCopyWith<$Res> get supplements;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$RecordsPageStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecordsPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recordList = null,
    Object? supplements = null,
  }) {
    return _then(_$LoadingImpl(
      null == recordList
          ? _value._recordList
          : recordList // ignore: cast_nullable_to_non_nullable
              as List<Record>,
      null == supplements
          ? _value.supplements
          : supplements // ignore: cast_nullable_to_non_nullable
              as RecordsPageSupplements,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(final List<Record> recordList, this.supplements)
      : _recordList = recordList;

  final List<Record> _recordList;
  @override
  List<Record> get recordList {
    if (_recordList is EqualUnmodifiableListView) return _recordList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recordList);
  }

  @override
  final RecordsPageSupplements supplements;

  @override
  String toString() {
    return 'RecordsPageState.loading(recordList: $recordList, supplements: $supplements)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            const DeepCollectionEquality()
                .equals(other._recordList, _recordList) &&
            (identical(other.supplements, supplements) ||
                other.supplements == supplements));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_recordList), supplements);

  /// Create a copy of RecordsPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)
        loading,
    required TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)
        content,
    required TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)
        success,
  }) {
    return loading(recordList, supplements);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        loading,
    TResult? Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        content,
    TResult? Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        success,
  }) {
    return loading?.call(recordList, supplements);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        loading,
    TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        content,
    TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(recordList, supplements);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Content value) content,
    required TResult Function(_Success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Content value)? content,
    TResult? Function(_Success value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements RecordsPageState {
  const factory _Loading(final List<Record> recordList,
      final RecordsPageSupplements supplements) = _$LoadingImpl;

  @override
  List<Record> get recordList;
  @override
  RecordsPageSupplements get supplements;

  /// Create a copy of RecordsPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ContentImplCopyWith<$Res>
    implements $RecordsPageStateCopyWith<$Res> {
  factory _$$ContentImplCopyWith(
          _$ContentImpl value, $Res Function(_$ContentImpl) then) =
      __$$ContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Record> recordList, RecordsPageSupplements supplements});

  @override
  $RecordsPageSupplementsCopyWith<$Res> get supplements;
}

/// @nodoc
class __$$ContentImplCopyWithImpl<$Res>
    extends _$RecordsPageStateCopyWithImpl<$Res, _$ContentImpl>
    implements _$$ContentImplCopyWith<$Res> {
  __$$ContentImplCopyWithImpl(
      _$ContentImpl _value, $Res Function(_$ContentImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecordsPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recordList = null,
    Object? supplements = null,
  }) {
    return _then(_$ContentImpl(
      null == recordList
          ? _value._recordList
          : recordList // ignore: cast_nullable_to_non_nullable
              as List<Record>,
      null == supplements
          ? _value.supplements
          : supplements // ignore: cast_nullable_to_non_nullable
              as RecordsPageSupplements,
    ));
  }
}

/// @nodoc

class _$ContentImpl implements _Content {
  const _$ContentImpl(final List<Record> recordList, this.supplements)
      : _recordList = recordList;

  final List<Record> _recordList;
  @override
  List<Record> get recordList {
    if (_recordList is EqualUnmodifiableListView) return _recordList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recordList);
  }

  @override
  final RecordsPageSupplements supplements;

  @override
  String toString() {
    return 'RecordsPageState.content(recordList: $recordList, supplements: $supplements)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentImpl &&
            const DeepCollectionEquality()
                .equals(other._recordList, _recordList) &&
            (identical(other.supplements, supplements) ||
                other.supplements == supplements));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_recordList), supplements);

  /// Create a copy of RecordsPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentImplCopyWith<_$ContentImpl> get copyWith =>
      __$$ContentImplCopyWithImpl<_$ContentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)
        loading,
    required TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)
        content,
    required TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)
        success,
  }) {
    return content(recordList, supplements);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        loading,
    TResult? Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        content,
    TResult? Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        success,
  }) {
    return content?.call(recordList, supplements);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        loading,
    TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        content,
    TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        success,
    required TResult orElse(),
  }) {
    if (content != null) {
      return content(recordList, supplements);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Content value) content,
    required TResult Function(_Success value) success,
  }) {
    return content(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Content value)? content,
    TResult? Function(_Success value)? success,
  }) {
    return content?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (content != null) {
      return content(this);
    }
    return orElse();
  }
}

abstract class _Content implements RecordsPageState {
  const factory _Content(final List<Record> recordList,
      final RecordsPageSupplements supplements) = _$ContentImpl;

  @override
  List<Record> get recordList;
  @override
  RecordsPageSupplements get supplements;

  /// Create a copy of RecordsPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentImplCopyWith<_$ContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res>
    implements $RecordsPageStateCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Record> recordList, RecordsPageSupplements supplements});

  @override
  $RecordsPageSupplementsCopyWith<$Res> get supplements;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$RecordsPageStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecordsPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recordList = null,
    Object? supplements = null,
  }) {
    return _then(_$SuccessImpl(
      null == recordList
          ? _value._recordList
          : recordList // ignore: cast_nullable_to_non_nullable
              as List<Record>,
      null == supplements
          ? _value.supplements
          : supplements // ignore: cast_nullable_to_non_nullable
              as RecordsPageSupplements,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(final List<Record> recordList, this.supplements)
      : _recordList = recordList;

  final List<Record> _recordList;
  @override
  List<Record> get recordList {
    if (_recordList is EqualUnmodifiableListView) return _recordList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recordList);
  }

  @override
  final RecordsPageSupplements supplements;

  @override
  String toString() {
    return 'RecordsPageState.success(recordList: $recordList, supplements: $supplements)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._recordList, _recordList) &&
            (identical(other.supplements, supplements) ||
                other.supplements == supplements));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_recordList), supplements);

  /// Create a copy of RecordsPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)
        loading,
    required TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)
        content,
    required TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)
        success,
  }) {
    return success(recordList, supplements);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        loading,
    TResult? Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        content,
    TResult? Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        success,
  }) {
    return success?.call(recordList, supplements);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        loading,
    TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        content,
    TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(recordList, supplements);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Content value) content,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Content value)? content,
    TResult? Function(_Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements RecordsPageState {
  const factory _Success(final List<Record> recordList,
      final RecordsPageSupplements supplements) = _$SuccessImpl;

  @override
  List<Record> get recordList;
  @override
  RecordsPageSupplements get supplements;

  /// Create a copy of RecordsPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
