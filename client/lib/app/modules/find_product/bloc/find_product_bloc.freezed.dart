// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'find_product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FindProductEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String searchData) goSearch,
    required TResult Function() getFindProduct,
    required TResult Function(String result) onSpeechResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String searchData)? goSearch,
    TResult Function()? getFindProduct,
    TResult Function(String result)? onSpeechResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String searchData)? goSearch,
    TResult Function()? getFindProduct,
    TResult Function(String result)? onSpeechResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GoSearch value) goSearch,
    required TResult Function(_GetFindProduct value) getFindProduct,
    required TResult Function(_OpenSpeechToText value) onSpeechResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GoSearch value)? goSearch,
    TResult Function(_GetFindProduct value)? getFindProduct,
    TResult Function(_OpenSpeechToText value)? onSpeechResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GoSearch value)? goSearch,
    TResult Function(_GetFindProduct value)? getFindProduct,
    TResult Function(_OpenSpeechToText value)? onSpeechResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindProductEventCopyWith<$Res> {
  factory $FindProductEventCopyWith(
          FindProductEvent value, $Res Function(FindProductEvent) then) =
      _$FindProductEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$FindProductEventCopyWithImpl<$Res>
    implements $FindProductEventCopyWith<$Res> {
  _$FindProductEventCopyWithImpl(this._value, this._then);

  final FindProductEvent _value;
  // ignore: unused_field
  final $Res Function(FindProductEvent) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$FindProductEventCopyWithImpl<$Res>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, (v) => _then(v as _$_Started));

  @override
  _$_Started get _value => super._value as _$_Started;
}

/// @nodoc

class _$_Started with DiagnosticableTreeMixin implements _Started {
  const _$_Started();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FindProductEvent.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'FindProductEvent.started'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String searchData) goSearch,
    required TResult Function() getFindProduct,
    required TResult Function(String result) onSpeechResult,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String searchData)? goSearch,
    TResult Function()? getFindProduct,
    TResult Function(String result)? onSpeechResult,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String searchData)? goSearch,
    TResult Function()? getFindProduct,
    TResult Function(String result)? onSpeechResult,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GoSearch value) goSearch,
    required TResult Function(_GetFindProduct value) getFindProduct,
    required TResult Function(_OpenSpeechToText value) onSpeechResult,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GoSearch value)? goSearch,
    TResult Function(_GetFindProduct value)? getFindProduct,
    TResult Function(_OpenSpeechToText value)? onSpeechResult,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GoSearch value)? goSearch,
    TResult Function(_GetFindProduct value)? getFindProduct,
    TResult Function(_OpenSpeechToText value)? onSpeechResult,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements FindProductEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_GoSearchCopyWith<$Res> {
  factory _$$_GoSearchCopyWith(
          _$_GoSearch value, $Res Function(_$_GoSearch) then) =
      __$$_GoSearchCopyWithImpl<$Res>;
  $Res call({String searchData});
}

/// @nodoc
class __$$_GoSearchCopyWithImpl<$Res>
    extends _$FindProductEventCopyWithImpl<$Res>
    implements _$$_GoSearchCopyWith<$Res> {
  __$$_GoSearchCopyWithImpl(
      _$_GoSearch _value, $Res Function(_$_GoSearch) _then)
      : super(_value, (v) => _then(v as _$_GoSearch));

  @override
  _$_GoSearch get _value => super._value as _$_GoSearch;

  @override
  $Res call({
    Object? searchData = freezed,
  }) {
    return _then(_$_GoSearch(
      searchData == freezed
          ? _value.searchData
          : searchData // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GoSearch with DiagnosticableTreeMixin implements _GoSearch {
  const _$_GoSearch(this.searchData);

  @override
  final String searchData;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FindProductEvent.goSearch(searchData: $searchData)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FindProductEvent.goSearch'))
      ..add(DiagnosticsProperty('searchData', searchData));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GoSearch &&
            const DeepCollectionEquality()
                .equals(other.searchData, searchData));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(searchData));

  @JsonKey(ignore: true)
  @override
  _$$_GoSearchCopyWith<_$_GoSearch> get copyWith =>
      __$$_GoSearchCopyWithImpl<_$_GoSearch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String searchData) goSearch,
    required TResult Function() getFindProduct,
    required TResult Function(String result) onSpeechResult,
  }) {
    return goSearch(searchData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String searchData)? goSearch,
    TResult Function()? getFindProduct,
    TResult Function(String result)? onSpeechResult,
  }) {
    return goSearch?.call(searchData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String searchData)? goSearch,
    TResult Function()? getFindProduct,
    TResult Function(String result)? onSpeechResult,
    required TResult orElse(),
  }) {
    if (goSearch != null) {
      return goSearch(searchData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GoSearch value) goSearch,
    required TResult Function(_GetFindProduct value) getFindProduct,
    required TResult Function(_OpenSpeechToText value) onSpeechResult,
  }) {
    return goSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GoSearch value)? goSearch,
    TResult Function(_GetFindProduct value)? getFindProduct,
    TResult Function(_OpenSpeechToText value)? onSpeechResult,
  }) {
    return goSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GoSearch value)? goSearch,
    TResult Function(_GetFindProduct value)? getFindProduct,
    TResult Function(_OpenSpeechToText value)? onSpeechResult,
    required TResult orElse(),
  }) {
    if (goSearch != null) {
      return goSearch(this);
    }
    return orElse();
  }
}

abstract class _GoSearch implements FindProductEvent {
  const factory _GoSearch(final String searchData) = _$_GoSearch;

  String get searchData => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_GoSearchCopyWith<_$_GoSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetFindProductCopyWith<$Res> {
  factory _$$_GetFindProductCopyWith(
          _$_GetFindProduct value, $Res Function(_$_GetFindProduct) then) =
      __$$_GetFindProductCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetFindProductCopyWithImpl<$Res>
    extends _$FindProductEventCopyWithImpl<$Res>
    implements _$$_GetFindProductCopyWith<$Res> {
  __$$_GetFindProductCopyWithImpl(
      _$_GetFindProduct _value, $Res Function(_$_GetFindProduct) _then)
      : super(_value, (v) => _then(v as _$_GetFindProduct));

  @override
  _$_GetFindProduct get _value => super._value as _$_GetFindProduct;
}

/// @nodoc

class _$_GetFindProduct
    with DiagnosticableTreeMixin
    implements _GetFindProduct {
  const _$_GetFindProduct();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FindProductEvent.getFindProduct()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'FindProductEvent.getFindProduct'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetFindProduct);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String searchData) goSearch,
    required TResult Function() getFindProduct,
    required TResult Function(String result) onSpeechResult,
  }) {
    return getFindProduct();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String searchData)? goSearch,
    TResult Function()? getFindProduct,
    TResult Function(String result)? onSpeechResult,
  }) {
    return getFindProduct?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String searchData)? goSearch,
    TResult Function()? getFindProduct,
    TResult Function(String result)? onSpeechResult,
    required TResult orElse(),
  }) {
    if (getFindProduct != null) {
      return getFindProduct();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GoSearch value) goSearch,
    required TResult Function(_GetFindProduct value) getFindProduct,
    required TResult Function(_OpenSpeechToText value) onSpeechResult,
  }) {
    return getFindProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GoSearch value)? goSearch,
    TResult Function(_GetFindProduct value)? getFindProduct,
    TResult Function(_OpenSpeechToText value)? onSpeechResult,
  }) {
    return getFindProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GoSearch value)? goSearch,
    TResult Function(_GetFindProduct value)? getFindProduct,
    TResult Function(_OpenSpeechToText value)? onSpeechResult,
    required TResult orElse(),
  }) {
    if (getFindProduct != null) {
      return getFindProduct(this);
    }
    return orElse();
  }
}

abstract class _GetFindProduct implements FindProductEvent {
  const factory _GetFindProduct() = _$_GetFindProduct;
}

/// @nodoc
abstract class _$$_OpenSpeechToTextCopyWith<$Res> {
  factory _$$_OpenSpeechToTextCopyWith(
          _$_OpenSpeechToText value, $Res Function(_$_OpenSpeechToText) then) =
      __$$_OpenSpeechToTextCopyWithImpl<$Res>;
  $Res call({String result});
}

/// @nodoc
class __$$_OpenSpeechToTextCopyWithImpl<$Res>
    extends _$FindProductEventCopyWithImpl<$Res>
    implements _$$_OpenSpeechToTextCopyWith<$Res> {
  __$$_OpenSpeechToTextCopyWithImpl(
      _$_OpenSpeechToText _value, $Res Function(_$_OpenSpeechToText) _then)
      : super(_value, (v) => _then(v as _$_OpenSpeechToText));

  @override
  _$_OpenSpeechToText get _value => super._value as _$_OpenSpeechToText;

  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_$_OpenSpeechToText(
      result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OpenSpeechToText
    with DiagnosticableTreeMixin
    implements _OpenSpeechToText {
  const _$_OpenSpeechToText(this.result);

  @override
  final String result;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FindProductEvent.onSpeechResult(result: $result)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FindProductEvent.onSpeechResult'))
      ..add(DiagnosticsProperty('result', result));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OpenSpeechToText &&
            const DeepCollectionEquality().equals(other.result, result));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(result));

  @JsonKey(ignore: true)
  @override
  _$$_OpenSpeechToTextCopyWith<_$_OpenSpeechToText> get copyWith =>
      __$$_OpenSpeechToTextCopyWithImpl<_$_OpenSpeechToText>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String searchData) goSearch,
    required TResult Function() getFindProduct,
    required TResult Function(String result) onSpeechResult,
  }) {
    return onSpeechResult(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String searchData)? goSearch,
    TResult Function()? getFindProduct,
    TResult Function(String result)? onSpeechResult,
  }) {
    return onSpeechResult?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String searchData)? goSearch,
    TResult Function()? getFindProduct,
    TResult Function(String result)? onSpeechResult,
    required TResult orElse(),
  }) {
    if (onSpeechResult != null) {
      return onSpeechResult(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GoSearch value) goSearch,
    required TResult Function(_GetFindProduct value) getFindProduct,
    required TResult Function(_OpenSpeechToText value) onSpeechResult,
  }) {
    return onSpeechResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GoSearch value)? goSearch,
    TResult Function(_GetFindProduct value)? getFindProduct,
    TResult Function(_OpenSpeechToText value)? onSpeechResult,
  }) {
    return onSpeechResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GoSearch value)? goSearch,
    TResult Function(_GetFindProduct value)? getFindProduct,
    TResult Function(_OpenSpeechToText value)? onSpeechResult,
    required TResult orElse(),
  }) {
    if (onSpeechResult != null) {
      return onSpeechResult(this);
    }
    return orElse();
  }
}

abstract class _OpenSpeechToText implements FindProductEvent {
  const factory _OpenSpeechToText(final String result) = _$_OpenSpeechToText;

  String get result => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_OpenSpeechToTextCopyWith<_$_OpenSpeechToText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FindProductState {
  List<SearchHistoryModel>? get searchHis => throw _privateConstructorUsedError;
  FindProStatus get status => throw _privateConstructorUsedError;
  String get searchData => throw _privateConstructorUsedError;
  SpeechToText? get speechToText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FindProductStateCopyWith<FindProductState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindProductStateCopyWith<$Res> {
  factory $FindProductStateCopyWith(
          FindProductState value, $Res Function(FindProductState) then) =
      _$FindProductStateCopyWithImpl<$Res>;
  $Res call(
      {List<SearchHistoryModel>? searchHis,
      FindProStatus status,
      String searchData,
      SpeechToText? speechToText});
}

/// @nodoc
class _$FindProductStateCopyWithImpl<$Res>
    implements $FindProductStateCopyWith<$Res> {
  _$FindProductStateCopyWithImpl(this._value, this._then);

  final FindProductState _value;
  // ignore: unused_field
  final $Res Function(FindProductState) _then;

  @override
  $Res call({
    Object? searchHis = freezed,
    Object? status = freezed,
    Object? searchData = freezed,
    Object? speechToText = freezed,
  }) {
    return _then(_value.copyWith(
      searchHis: searchHis == freezed
          ? _value.searchHis
          : searchHis // ignore: cast_nullable_to_non_nullable
              as List<SearchHistoryModel>?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FindProStatus,
      searchData: searchData == freezed
          ? _value.searchData
          : searchData // ignore: cast_nullable_to_non_nullable
              as String,
      speechToText: speechToText == freezed
          ? _value.speechToText
          : speechToText // ignore: cast_nullable_to_non_nullable
              as SpeechToText?,
    ));
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $FindProductStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<SearchHistoryModel>? searchHis,
      FindProStatus status,
      String searchData,
      SpeechToText? speechToText});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$FindProductStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? searchHis = freezed,
    Object? status = freezed,
    Object? searchData = freezed,
    Object? speechToText = freezed,
  }) {
    return _then(_$_Initial(
      searchHis: searchHis == freezed
          ? _value._searchHis
          : searchHis // ignore: cast_nullable_to_non_nullable
              as List<SearchHistoryModel>?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FindProStatus,
      searchData: searchData == freezed
          ? _value.searchData
          : searchData // ignore: cast_nullable_to_non_nullable
              as String,
      speechToText: speechToText == freezed
          ? _value.speechToText
          : speechToText // ignore: cast_nullable_to_non_nullable
              as SpeechToText?,
    ));
  }
}

/// @nodoc

class _$_Initial with DiagnosticableTreeMixin implements _Initial {
  const _$_Initial(
      {final List<SearchHistoryModel>? searchHis = null,
      this.status = FindProStatus.none,
      this.searchData = '',
      this.speechToText = null})
      : _searchHis = searchHis;

  final List<SearchHistoryModel>? _searchHis;
  @override
  @JsonKey()
  List<SearchHistoryModel>? get searchHis {
    final value = _searchHis;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final FindProStatus status;
  @override
  @JsonKey()
  final String searchData;
  @override
  @JsonKey()
  final SpeechToText? speechToText;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FindProductState(searchHis: $searchHis, status: $status, searchData: $searchData, speechToText: $speechToText)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FindProductState'))
      ..add(DiagnosticsProperty('searchHis', searchHis))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('searchData', searchData))
      ..add(DiagnosticsProperty('speechToText', speechToText));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality()
                .equals(other._searchHis, _searchHis) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.searchData, searchData) &&
            const DeepCollectionEquality()
                .equals(other.speechToText, speechToText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_searchHis),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(searchData),
      const DeepCollectionEquality().hash(speechToText));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements FindProductState {
  const factory _Initial(
      {final List<SearchHistoryModel>? searchHis,
      final FindProStatus status,
      final String searchData,
      final SpeechToText? speechToText}) = _$_Initial;

  @override
  List<SearchHistoryModel>? get searchHis => throw _privateConstructorUsedError;
  @override
  FindProStatus get status => throw _privateConstructorUsedError;
  @override
  String get searchData => throw _privateConstructorUsedError;
  @override
  SpeechToText? get speechToText => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
