// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_edit_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BudgetEditPageState {
  List<Category> get categoryList => throw _privateConstructorUsedError;
  List<String> get idList => throw _privateConstructorUsedError;
  BudgetForm get form => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)
        loading,
    required TResult Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)
        content,
    required TResult Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)?
        loading,
    TResult? Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)?
        content,
    TResult? Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)?
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)?
        loading,
    TResult Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)?
        content,
    TResult Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)?
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

  /// Create a copy of BudgetEditPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BudgetEditPageStateCopyWith<BudgetEditPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetEditPageStateCopyWith<$Res> {
  factory $BudgetEditPageStateCopyWith(
          BudgetEditPageState value, $Res Function(BudgetEditPageState) then) =
      _$BudgetEditPageStateCopyWithImpl<$Res, BudgetEditPageState>;
  @useResult
  $Res call(
      {List<Category> categoryList, List<String> idList, BudgetForm form});

  $BudgetFormCopyWith<$Res> get form;
}

/// @nodoc
class _$BudgetEditPageStateCopyWithImpl<$Res, $Val extends BudgetEditPageState>
    implements $BudgetEditPageStateCopyWith<$Res> {
  _$BudgetEditPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BudgetEditPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryList = null,
    Object? idList = null,
    Object? form = null,
  }) {
    return _then(_value.copyWith(
      categoryList: null == categoryList
          ? _value.categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      idList: null == idList
          ? _value.idList
          : idList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as BudgetForm,
    ) as $Val);
  }

  /// Create a copy of BudgetEditPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BudgetFormCopyWith<$Res> get form {
    return $BudgetFormCopyWith<$Res>(_value.form, (value) {
      return _then(_value.copyWith(form: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $BudgetEditPageStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Category> categoryList, List<String> idList, BudgetForm form});

  @override
  $BudgetFormCopyWith<$Res> get form;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$BudgetEditPageStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of BudgetEditPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryList = null,
    Object? idList = null,
    Object? form = null,
  }) {
    return _then(_$LoadingImpl(
      null == categoryList
          ? _value._categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      null == idList
          ? _value._idList
          : idList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as BudgetForm,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(
      final List<Category> categoryList, final List<String> idList, this.form)
      : _categoryList = categoryList,
        _idList = idList;

  final List<Category> _categoryList;
  @override
  List<Category> get categoryList {
    if (_categoryList is EqualUnmodifiableListView) return _categoryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryList);
  }

  final List<String> _idList;
  @override
  List<String> get idList {
    if (_idList is EqualUnmodifiableListView) return _idList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_idList);
  }

  @override
  final BudgetForm form;

  @override
  String toString() {
    return 'BudgetEditPageState.loading(categoryList: $categoryList, idList: $idList, form: $form)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            const DeepCollectionEquality()
                .equals(other._categoryList, _categoryList) &&
            const DeepCollectionEquality().equals(other._idList, _idList) &&
            (identical(other.form, form) || other.form == form));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categoryList),
      const DeepCollectionEquality().hash(_idList),
      form);

  /// Create a copy of BudgetEditPageState
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
            List<Category> categoryList, List<String> idList, BudgetForm form)
        loading,
    required TResult Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)
        content,
    required TResult Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)
        success,
  }) {
    return loading(categoryList, idList, form);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)?
        loading,
    TResult? Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)?
        content,
    TResult? Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)?
        success,
  }) {
    return loading?.call(categoryList, idList, form);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)?
        loading,
    TResult Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)?
        content,
    TResult Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)?
        success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(categoryList, idList, form);
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

abstract class _Loading implements BudgetEditPageState {
  const factory _Loading(final List<Category> categoryList,
      final List<String> idList, final BudgetForm form) = _$LoadingImpl;

  @override
  List<Category> get categoryList;
  @override
  List<String> get idList;
  @override
  BudgetForm get form;

  /// Create a copy of BudgetEditPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ContentImplCopyWith<$Res>
    implements $BudgetEditPageStateCopyWith<$Res> {
  factory _$$ContentImplCopyWith(
          _$ContentImpl value, $Res Function(_$ContentImpl) then) =
      __$$ContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Category> categoryList, List<String> idList, BudgetForm form});

  @override
  $BudgetFormCopyWith<$Res> get form;
}

/// @nodoc
class __$$ContentImplCopyWithImpl<$Res>
    extends _$BudgetEditPageStateCopyWithImpl<$Res, _$ContentImpl>
    implements _$$ContentImplCopyWith<$Res> {
  __$$ContentImplCopyWithImpl(
      _$ContentImpl _value, $Res Function(_$ContentImpl) _then)
      : super(_value, _then);

  /// Create a copy of BudgetEditPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryList = null,
    Object? idList = null,
    Object? form = null,
  }) {
    return _then(_$ContentImpl(
      null == categoryList
          ? _value._categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      null == idList
          ? _value._idList
          : idList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as BudgetForm,
    ));
  }
}

/// @nodoc

class _$ContentImpl implements _Content {
  const _$ContentImpl(
      final List<Category> categoryList, final List<String> idList, this.form)
      : _categoryList = categoryList,
        _idList = idList;

  final List<Category> _categoryList;
  @override
  List<Category> get categoryList {
    if (_categoryList is EqualUnmodifiableListView) return _categoryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryList);
  }

  final List<String> _idList;
  @override
  List<String> get idList {
    if (_idList is EqualUnmodifiableListView) return _idList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_idList);
  }

  @override
  final BudgetForm form;

  @override
  String toString() {
    return 'BudgetEditPageState.content(categoryList: $categoryList, idList: $idList, form: $form)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentImpl &&
            const DeepCollectionEquality()
                .equals(other._categoryList, _categoryList) &&
            const DeepCollectionEquality().equals(other._idList, _idList) &&
            (identical(other.form, form) || other.form == form));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categoryList),
      const DeepCollectionEquality().hash(_idList),
      form);

  /// Create a copy of BudgetEditPageState
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
            List<Category> categoryList, List<String> idList, BudgetForm form)
        loading,
    required TResult Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)
        content,
    required TResult Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)
        success,
  }) {
    return content(categoryList, idList, form);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)?
        loading,
    TResult? Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)?
        content,
    TResult? Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)?
        success,
  }) {
    return content?.call(categoryList, idList, form);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)?
        loading,
    TResult Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)?
        content,
    TResult Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)?
        success,
    required TResult orElse(),
  }) {
    if (content != null) {
      return content(categoryList, idList, form);
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

abstract class _Content implements BudgetEditPageState {
  const factory _Content(final List<Category> categoryList,
      final List<String> idList, final BudgetForm form) = _$ContentImpl;

  @override
  List<Category> get categoryList;
  @override
  List<String> get idList;
  @override
  BudgetForm get form;

  /// Create a copy of BudgetEditPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentImplCopyWith<_$ContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res>
    implements $BudgetEditPageStateCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Category> categoryList, List<String> idList, BudgetForm form});

  @override
  $BudgetFormCopyWith<$Res> get form;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$BudgetEditPageStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of BudgetEditPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryList = null,
    Object? idList = null,
    Object? form = null,
  }) {
    return _then(_$SuccessImpl(
      null == categoryList
          ? _value._categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      null == idList
          ? _value._idList
          : idList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as BudgetForm,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(
      final List<Category> categoryList, final List<String> idList, this.form)
      : _categoryList = categoryList,
        _idList = idList;

  final List<Category> _categoryList;
  @override
  List<Category> get categoryList {
    if (_categoryList is EqualUnmodifiableListView) return _categoryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryList);
  }

  final List<String> _idList;
  @override
  List<String> get idList {
    if (_idList is EqualUnmodifiableListView) return _idList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_idList);
  }

  @override
  final BudgetForm form;

  @override
  String toString() {
    return 'BudgetEditPageState.success(categoryList: $categoryList, idList: $idList, form: $form)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._categoryList, _categoryList) &&
            const DeepCollectionEquality().equals(other._idList, _idList) &&
            (identical(other.form, form) || other.form == form));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categoryList),
      const DeepCollectionEquality().hash(_idList),
      form);

  /// Create a copy of BudgetEditPageState
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
            List<Category> categoryList, List<String> idList, BudgetForm form)
        loading,
    required TResult Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)
        content,
    required TResult Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)
        success,
  }) {
    return success(categoryList, idList, form);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)?
        loading,
    TResult? Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)?
        content,
    TResult? Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)?
        success,
  }) {
    return success?.call(categoryList, idList, form);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)?
        loading,
    TResult Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)?
        content,
    TResult Function(
            List<Category> categoryList, List<String> idList, BudgetForm form)?
        success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(categoryList, idList, form);
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

abstract class _Success implements BudgetEditPageState {
  const factory _Success(final List<Category> categoryList,
      final List<String> idList, final BudgetForm form) = _$SuccessImpl;

  @override
  List<Category> get categoryList;
  @override
  List<String> get idList;
  @override
  BudgetForm get form;

  /// Create a copy of BudgetEditPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
