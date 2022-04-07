// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'records_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RecordsPageStateTearOff {
  const _$RecordsPageStateTearOff();

  _Loading loading(
      List<Record> recordList, RecordsPageSupplements supplements) {
    return _Loading(
      recordList,
      supplements,
    );
  }

  _Content content(
      List<Record> recordList, RecordsPageSupplements supplements) {
    return _Content(
      recordList,
      supplements,
    );
  }

  _Success success(
      List<Record> recordList, RecordsPageSupplements supplements) {
    return _Success(
      recordList,
      supplements,
    );
  }
}

/// @nodoc
const $RecordsPageState = _$RecordsPageStateTearOff();

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
    TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        loading,
    TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        content,
    TResult Function(
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
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    TResult Function(_Success value)? success,
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

  @JsonKey(ignore: true)
  $RecordsPageStateCopyWith<RecordsPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordsPageStateCopyWith<$Res> {
  factory $RecordsPageStateCopyWith(
          RecordsPageState value, $Res Function(RecordsPageState) then) =
      _$RecordsPageStateCopyWithImpl<$Res>;
  $Res call({List<Record> recordList, RecordsPageSupplements supplements});

  $RecordsPageSupplementsCopyWith<$Res> get supplements;
}

/// @nodoc
class _$RecordsPageStateCopyWithImpl<$Res>
    implements $RecordsPageStateCopyWith<$Res> {
  _$RecordsPageStateCopyWithImpl(this._value, this._then);

  final RecordsPageState _value;
  // ignore: unused_field
  final $Res Function(RecordsPageState) _then;

  @override
  $Res call({
    Object? recordList = freezed,
    Object? supplements = freezed,
  }) {
    return _then(_value.copyWith(
      recordList: recordList == freezed
          ? _value.recordList
          : recordList // ignore: cast_nullable_to_non_nullable
              as List<Record>,
      supplements: supplements == freezed
          ? _value.supplements
          : supplements // ignore: cast_nullable_to_non_nullable
              as RecordsPageSupplements,
    ));
  }

  @override
  $RecordsPageSupplementsCopyWith<$Res> get supplements {
    return $RecordsPageSupplementsCopyWith<$Res>(_value.supplements, (value) {
      return _then(_value.copyWith(supplements: value));
    });
  }
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res>
    implements $RecordsPageStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
  @override
  $Res call({List<Record> recordList, RecordsPageSupplements supplements});

  @override
  $RecordsPageSupplementsCopyWith<$Res> get supplements;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$RecordsPageStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;

  @override
  $Res call({
    Object? recordList = freezed,
    Object? supplements = freezed,
  }) {
    return _then(_Loading(
      recordList == freezed
          ? _value.recordList
          : recordList // ignore: cast_nullable_to_non_nullable
              as List<Record>,
      supplements == freezed
          ? _value.supplements
          : supplements // ignore: cast_nullable_to_non_nullable
              as RecordsPageSupplements,
    ));
  }
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading(this.recordList, this.supplements);

  @override
  final List<Record> recordList;
  @override
  final RecordsPageSupplements supplements;

  @override
  String toString() {
    return 'RecordsPageState.loading(recordList: $recordList, supplements: $supplements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loading &&
            const DeepCollectionEquality()
                .equals(other.recordList, recordList) &&
            const DeepCollectionEquality()
                .equals(other.supplements, supplements));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(recordList),
      const DeepCollectionEquality().hash(supplements));

  @JsonKey(ignore: true)
  @override
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

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
    TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        loading,
    TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        content,
    TResult Function(
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
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    TResult Function(_Success value)? success,
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
  const factory _Loading(
      List<Record> recordList, RecordsPageSupplements supplements) = _$_Loading;

  @override
  List<Record> get recordList;
  @override
  RecordsPageSupplements get supplements;
  @override
  @JsonKey(ignore: true)
  _$LoadingCopyWith<_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ContentCopyWith<$Res>
    implements $RecordsPageStateCopyWith<$Res> {
  factory _$ContentCopyWith(_Content value, $Res Function(_Content) then) =
      __$ContentCopyWithImpl<$Res>;
  @override
  $Res call({List<Record> recordList, RecordsPageSupplements supplements});

  @override
  $RecordsPageSupplementsCopyWith<$Res> get supplements;
}

/// @nodoc
class __$ContentCopyWithImpl<$Res> extends _$RecordsPageStateCopyWithImpl<$Res>
    implements _$ContentCopyWith<$Res> {
  __$ContentCopyWithImpl(_Content _value, $Res Function(_Content) _then)
      : super(_value, (v) => _then(v as _Content));

  @override
  _Content get _value => super._value as _Content;

  @override
  $Res call({
    Object? recordList = freezed,
    Object? supplements = freezed,
  }) {
    return _then(_Content(
      recordList == freezed
          ? _value.recordList
          : recordList // ignore: cast_nullable_to_non_nullable
              as List<Record>,
      supplements == freezed
          ? _value.supplements
          : supplements // ignore: cast_nullable_to_non_nullable
              as RecordsPageSupplements,
    ));
  }
}

/// @nodoc

class _$_Content implements _Content {
  const _$_Content(this.recordList, this.supplements);

  @override
  final List<Record> recordList;
  @override
  final RecordsPageSupplements supplements;

  @override
  String toString() {
    return 'RecordsPageState.content(recordList: $recordList, supplements: $supplements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Content &&
            const DeepCollectionEquality()
                .equals(other.recordList, recordList) &&
            const DeepCollectionEquality()
                .equals(other.supplements, supplements));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(recordList),
      const DeepCollectionEquality().hash(supplements));

  @JsonKey(ignore: true)
  @override
  _$ContentCopyWith<_Content> get copyWith =>
      __$ContentCopyWithImpl<_Content>(this, _$identity);

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
    TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        loading,
    TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        content,
    TResult Function(
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
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    TResult Function(_Success value)? success,
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
  const factory _Content(
      List<Record> recordList, RecordsPageSupplements supplements) = _$_Content;

  @override
  List<Record> get recordList;
  @override
  RecordsPageSupplements get supplements;
  @override
  @JsonKey(ignore: true)
  _$ContentCopyWith<_Content> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SuccessCopyWith<$Res>
    implements $RecordsPageStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) then) =
      __$SuccessCopyWithImpl<$Res>;
  @override
  $Res call({List<Record> recordList, RecordsPageSupplements supplements});

  @override
  $RecordsPageSupplementsCopyWith<$Res> get supplements;
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res> extends _$RecordsPageStateCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(_Success _value, $Res Function(_Success) _then)
      : super(_value, (v) => _then(v as _Success));

  @override
  _Success get _value => super._value as _Success;

  @override
  $Res call({
    Object? recordList = freezed,
    Object? supplements = freezed,
  }) {
    return _then(_Success(
      recordList == freezed
          ? _value.recordList
          : recordList // ignore: cast_nullable_to_non_nullable
              as List<Record>,
      supplements == freezed
          ? _value.supplements
          : supplements // ignore: cast_nullable_to_non_nullable
              as RecordsPageSupplements,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success(this.recordList, this.supplements);

  @override
  final List<Record> recordList;
  @override
  final RecordsPageSupplements supplements;

  @override
  String toString() {
    return 'RecordsPageState.success(recordList: $recordList, supplements: $supplements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Success &&
            const DeepCollectionEquality()
                .equals(other.recordList, recordList) &&
            const DeepCollectionEquality()
                .equals(other.supplements, supplements));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(recordList),
      const DeepCollectionEquality().hash(supplements));

  @JsonKey(ignore: true)
  @override
  _$SuccessCopyWith<_Success> get copyWith =>
      __$SuccessCopyWithImpl<_Success>(this, _$identity);

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
    TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        loading,
    TResult Function(
            List<Record> recordList, RecordsPageSupplements supplements)?
        content,
    TResult Function(
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
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    TResult Function(_Success value)? success,
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
  const factory _Success(
      List<Record> recordList, RecordsPageSupplements supplements) = _$_Success;

  @override
  List<Record> get recordList;
  @override
  RecordsPageSupplements get supplements;
  @override
  @JsonKey(ignore: true)
  _$SuccessCopyWith<_Success> get copyWith =>
      throw _privateConstructorUsedError;
}
