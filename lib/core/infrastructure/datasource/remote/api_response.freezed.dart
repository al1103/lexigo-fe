// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApiResponse<T> _$ApiResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _ApiResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ApiResponse<T> {
  T? get data => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String get method => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this ApiResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiResponseCopyWith<T, ApiResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<T, $Res> {
  factory $ApiResponseCopyWith(
          ApiResponse<T> value, $Res Function(ApiResponse<T>) then) =
      _$ApiResponseCopyWithImpl<T, $Res, ApiResponse<T>>;
  @useResult
  $Res call(
      {T? data, String code, String? message, String method, String status});
}

/// @nodoc
class _$ApiResponseCopyWithImpl<T, $Res, $Val extends ApiResponse<T>>
    implements $ApiResponseCopyWith<T, $Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? code = null,
    Object? message = freezed,
    Object? method = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiResponseImplCopyWith<T, $Res>
    implements $ApiResponseCopyWith<T, $Res> {
  factory _$$ApiResponseImplCopyWith(_$ApiResponseImpl<T> value,
          $Res Function(_$ApiResponseImpl<T>) then) =
      __$$ApiResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {T? data, String code, String? message, String method, String status});
}

/// @nodoc
class __$$ApiResponseImplCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$ApiResponseImpl<T>>
    implements _$$ApiResponseImplCopyWith<T, $Res> {
  __$$ApiResponseImplCopyWithImpl(
      _$ApiResponseImpl<T> _value, $Res Function(_$ApiResponseImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? code = null,
    Object? message = freezed,
    Object? method = null,
    Object? status = null,
  }) {
    return _then(_$ApiResponseImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ApiResponseImpl<T> implements _ApiResponse<T> {
  const _$ApiResponseImpl(
      {this.data,
      this.code = '',
      this.message,
      this.method = '',
      this.status = 'success'});

  factory _$ApiResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ApiResponseImplFromJson(json, fromJsonT);

  @override
  final T? data;
  @override
  @JsonKey()
  final String code;
  @override
  final String? message;
  @override
  @JsonKey()
  final String method;
  @override
  @JsonKey()
  final String status;

  @override
  String toString() {
    return 'ApiResponse<$T>(data: $data, code: $code, message: $message, method: $method, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResponseImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(data), code, message, method, status);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResponseImplCopyWith<T, _$ApiResponseImpl<T>> get copyWith =>
      __$$ApiResponseImplCopyWithImpl<T, _$ApiResponseImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ApiResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _ApiResponse<T> implements ApiResponse<T> {
  const factory _ApiResponse(
      {final T? data,
      final String code,
      final String? message,
      final String method,
      final String status}) = _$ApiResponseImpl<T>;

  factory _ApiResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ApiResponseImpl<T>.fromJson;

  @override
  T? get data;
  @override
  String get code;
  @override
  String? get message;
  @override
  String get method;
  @override
  String get status;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiResponseImplCopyWith<T, _$ApiResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

PayloadPageableDto<T> _$PayloadPageableDtoFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _PayloadPageableDto<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$PayloadPageableDto<T> {
  @JsonKey(name: 'contents')
  List<T> get contents => throw _privateConstructorUsedError;
  @JsonKey(name: 'pagination')
  PageableModelDto? get pagination => throw _privateConstructorUsedError;

  /// Serializes this PayloadPageableDto to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PayloadPageableDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PayloadPageableDtoCopyWith<T, PayloadPageableDto<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PayloadPageableDtoCopyWith<T, $Res> {
  factory $PayloadPageableDtoCopyWith(PayloadPageableDto<T> value,
          $Res Function(PayloadPageableDto<T>) then) =
      _$PayloadPageableDtoCopyWithImpl<T, $Res, PayloadPageableDto<T>>;
  @useResult
  $Res call(
      {@JsonKey(name: 'contents') List<T> contents,
      @JsonKey(name: 'pagination') PageableModelDto? pagination});

  $PageableModelDtoCopyWith<$Res>? get pagination;
}

/// @nodoc
class _$PayloadPageableDtoCopyWithImpl<T, $Res,
        $Val extends PayloadPageableDto<T>>
    implements $PayloadPageableDtoCopyWith<T, $Res> {
  _$PayloadPageableDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PayloadPageableDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contents = null,
    Object? pagination = freezed,
  }) {
    return _then(_value.copyWith(
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<T>,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PageableModelDto?,
    ) as $Val);
  }

  /// Create a copy of PayloadPageableDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PageableModelDtoCopyWith<$Res>? get pagination {
    if (_value.pagination == null) {
      return null;
    }

    return $PageableModelDtoCopyWith<$Res>(_value.pagination!, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PayloadPageableDtoImplCopyWith<T, $Res>
    implements $PayloadPageableDtoCopyWith<T, $Res> {
  factory _$$PayloadPageableDtoImplCopyWith(_$PayloadPageableDtoImpl<T> value,
          $Res Function(_$PayloadPageableDtoImpl<T>) then) =
      __$$PayloadPageableDtoImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'contents') List<T> contents,
      @JsonKey(name: 'pagination') PageableModelDto? pagination});

  @override
  $PageableModelDtoCopyWith<$Res>? get pagination;
}

/// @nodoc
class __$$PayloadPageableDtoImplCopyWithImpl<T, $Res>
    extends _$PayloadPageableDtoCopyWithImpl<T, $Res,
        _$PayloadPageableDtoImpl<T>>
    implements _$$PayloadPageableDtoImplCopyWith<T, $Res> {
  __$$PayloadPageableDtoImplCopyWithImpl(_$PayloadPageableDtoImpl<T> _value,
      $Res Function(_$PayloadPageableDtoImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of PayloadPageableDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contents = null,
    Object? pagination = freezed,
  }) {
    return _then(_$PayloadPageableDtoImpl<T>(
      contents: null == contents
          ? _value._contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<T>,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PageableModelDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$PayloadPageableDtoImpl<T> implements _PayloadPageableDto<T> {
  const _$PayloadPageableDtoImpl(
      {@JsonKey(name: 'contents') final List<T> contents = const [],
      @JsonKey(name: 'pagination') this.pagination})
      : _contents = contents;

  factory _$PayloadPageableDtoImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$PayloadPageableDtoImplFromJson(json, fromJsonT);

  final List<T> _contents;
  @override
  @JsonKey(name: 'contents')
  List<T> get contents {
    if (_contents is EqualUnmodifiableListView) return _contents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contents);
  }

  @override
  @JsonKey(name: 'pagination')
  final PageableModelDto? pagination;

  @override
  String toString() {
    return 'PayloadPageableDto<$T>(contents: $contents, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayloadPageableDtoImpl<T> &&
            const DeepCollectionEquality().equals(other._contents, _contents) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_contents), pagination);

  /// Create a copy of PayloadPageableDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PayloadPageableDtoImplCopyWith<T, _$PayloadPageableDtoImpl<T>>
      get copyWith => __$$PayloadPageableDtoImplCopyWithImpl<T,
          _$PayloadPageableDtoImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$PayloadPageableDtoImplToJson<T>(this, toJsonT);
  }
}

abstract class _PayloadPageableDto<T> implements PayloadPageableDto<T> {
  const factory _PayloadPageableDto(
          {@JsonKey(name: 'contents') final List<T> contents,
          @JsonKey(name: 'pagination') final PageableModelDto? pagination}) =
      _$PayloadPageableDtoImpl<T>;

  factory _PayloadPageableDto.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$PayloadPageableDtoImpl<T>.fromJson;

  @override
  @JsonKey(name: 'contents')
  List<T> get contents;
  @override
  @JsonKey(name: 'pagination')
  PageableModelDto? get pagination;

  /// Create a copy of PayloadPageableDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PayloadPageableDtoImplCopyWith<T, _$PayloadPageableDtoImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

VocabularyPageableDto<T> _$VocabularyPageableDtoFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _VocabularyPageableDto<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$VocabularyPageableDto<T> {
  @JsonKey(name: 'contents')
  List<T> get contents =>
      throw _privateConstructorUsedError; // Đổi từ vocabularies thành contents
  @JsonKey(name: 'pagination')
  PageableModelDto? get pagination => throw _privateConstructorUsedError;

  /// Serializes this VocabularyPageableDto to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of VocabularyPageableDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VocabularyPageableDtoCopyWith<T, VocabularyPageableDto<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VocabularyPageableDtoCopyWith<T, $Res> {
  factory $VocabularyPageableDtoCopyWith(VocabularyPageableDto<T> value,
          $Res Function(VocabularyPageableDto<T>) then) =
      _$VocabularyPageableDtoCopyWithImpl<T, $Res, VocabularyPageableDto<T>>;
  @useResult
  $Res call(
      {@JsonKey(name: 'contents') List<T> contents,
      @JsonKey(name: 'pagination') PageableModelDto? pagination});

  $PageableModelDtoCopyWith<$Res>? get pagination;
}

/// @nodoc
class _$VocabularyPageableDtoCopyWithImpl<T, $Res,
        $Val extends VocabularyPageableDto<T>>
    implements $VocabularyPageableDtoCopyWith<T, $Res> {
  _$VocabularyPageableDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VocabularyPageableDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contents = null,
    Object? pagination = freezed,
  }) {
    return _then(_value.copyWith(
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<T>,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PageableModelDto?,
    ) as $Val);
  }

  /// Create a copy of VocabularyPageableDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PageableModelDtoCopyWith<$Res>? get pagination {
    if (_value.pagination == null) {
      return null;
    }

    return $PageableModelDtoCopyWith<$Res>(_value.pagination!, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VocabularyPageableDtoImplCopyWith<T, $Res>
    implements $VocabularyPageableDtoCopyWith<T, $Res> {
  factory _$$VocabularyPageableDtoImplCopyWith(
          _$VocabularyPageableDtoImpl<T> value,
          $Res Function(_$VocabularyPageableDtoImpl<T>) then) =
      __$$VocabularyPageableDtoImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'contents') List<T> contents,
      @JsonKey(name: 'pagination') PageableModelDto? pagination});

  @override
  $PageableModelDtoCopyWith<$Res>? get pagination;
}

/// @nodoc
class __$$VocabularyPageableDtoImplCopyWithImpl<T, $Res>
    extends _$VocabularyPageableDtoCopyWithImpl<T, $Res,
        _$VocabularyPageableDtoImpl<T>>
    implements _$$VocabularyPageableDtoImplCopyWith<T, $Res> {
  __$$VocabularyPageableDtoImplCopyWithImpl(
      _$VocabularyPageableDtoImpl<T> _value,
      $Res Function(_$VocabularyPageableDtoImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of VocabularyPageableDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contents = null,
    Object? pagination = freezed,
  }) {
    return _then(_$VocabularyPageableDtoImpl<T>(
      contents: null == contents
          ? _value._contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<T>,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PageableModelDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$VocabularyPageableDtoImpl<T> implements _VocabularyPageableDto<T> {
  const _$VocabularyPageableDtoImpl(
      {@JsonKey(name: 'contents') final List<T> contents = const [],
      @JsonKey(name: 'pagination') this.pagination})
      : _contents = contents;

  factory _$VocabularyPageableDtoImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$VocabularyPageableDtoImplFromJson(json, fromJsonT);

  final List<T> _contents;
  @override
  @JsonKey(name: 'contents')
  List<T> get contents {
    if (_contents is EqualUnmodifiableListView) return _contents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contents);
  }

// Đổi từ vocabularies thành contents
  @override
  @JsonKey(name: 'pagination')
  final PageableModelDto? pagination;

  @override
  String toString() {
    return 'VocabularyPageableDto<$T>(contents: $contents, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VocabularyPageableDtoImpl<T> &&
            const DeepCollectionEquality().equals(other._contents, _contents) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_contents), pagination);

  /// Create a copy of VocabularyPageableDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VocabularyPageableDtoImplCopyWith<T, _$VocabularyPageableDtoImpl<T>>
      get copyWith => __$$VocabularyPageableDtoImplCopyWithImpl<T,
          _$VocabularyPageableDtoImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$VocabularyPageableDtoImplToJson<T>(this, toJsonT);
  }
}

abstract class _VocabularyPageableDto<T> implements VocabularyPageableDto<T> {
  const factory _VocabularyPageableDto(
          {@JsonKey(name: 'contents') final List<T> contents,
          @JsonKey(name: 'pagination') final PageableModelDto? pagination}) =
      _$VocabularyPageableDtoImpl<T>;

  factory _VocabularyPageableDto.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$VocabularyPageableDtoImpl<T>.fromJson;

  @override
  @JsonKey(name: 'contents')
  List<T> get contents; // Đổi từ vocabularies thành contents
  @override
  @JsonKey(name: 'pagination')
  PageableModelDto? get pagination;

  /// Create a copy of VocabularyPageableDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VocabularyPageableDtoImplCopyWith<T, _$VocabularyPageableDtoImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

PageableModelDto _$PageableModelDtoFromJson(Map<String, dynamic> json) {
  return _PageableModelDto.fromJson(json);
}

/// @nodoc
mixin _$PageableModelDto {
  @JsonKey(name: 'page')
  int? get page => throw _privateConstructorUsedError;
  @JsonKey(name: 'limit')
  int? get limit => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalPages')
  int? get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasNext')
  bool? get hasNext => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasPrev')
  bool? get hasPrev => throw _privateConstructorUsedError;

  /// Serializes this PageableModelDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PageableModelDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PageableModelDtoCopyWith<PageableModelDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageableModelDtoCopyWith<$Res> {
  factory $PageableModelDtoCopyWith(
          PageableModelDto value, $Res Function(PageableModelDto) then) =
      _$PageableModelDtoCopyWithImpl<$Res, PageableModelDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'page') int? page,
      @JsonKey(name: 'limit') int? limit,
      @JsonKey(name: 'total') int? total,
      @JsonKey(name: 'totalPages') int? totalPages,
      @JsonKey(name: 'hasNext') bool? hasNext,
      @JsonKey(name: 'hasPrev') bool? hasPrev});
}

/// @nodoc
class _$PageableModelDtoCopyWithImpl<$Res, $Val extends PageableModelDto>
    implements $PageableModelDtoCopyWith<$Res> {
  _$PageableModelDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PageableModelDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? limit = freezed,
    Object? total = freezed,
    Object? totalPages = freezed,
    Object? hasNext = freezed,
    Object? hasPrev = freezed,
  }) {
    return _then(_value.copyWith(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      hasNext: freezed == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasPrev: freezed == hasPrev
          ? _value.hasPrev
          : hasPrev // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PageableModelDtoImplCopyWith<$Res>
    implements $PageableModelDtoCopyWith<$Res> {
  factory _$$PageableModelDtoImplCopyWith(_$PageableModelDtoImpl value,
          $Res Function(_$PageableModelDtoImpl) then) =
      __$$PageableModelDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'page') int? page,
      @JsonKey(name: 'limit') int? limit,
      @JsonKey(name: 'total') int? total,
      @JsonKey(name: 'totalPages') int? totalPages,
      @JsonKey(name: 'hasNext') bool? hasNext,
      @JsonKey(name: 'hasPrev') bool? hasPrev});
}

/// @nodoc
class __$$PageableModelDtoImplCopyWithImpl<$Res>
    extends _$PageableModelDtoCopyWithImpl<$Res, _$PageableModelDtoImpl>
    implements _$$PageableModelDtoImplCopyWith<$Res> {
  __$$PageableModelDtoImplCopyWithImpl(_$PageableModelDtoImpl _value,
      $Res Function(_$PageableModelDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PageableModelDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? limit = freezed,
    Object? total = freezed,
    Object? totalPages = freezed,
    Object? hasNext = freezed,
    Object? hasPrev = freezed,
  }) {
    return _then(_$PageableModelDtoImpl(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      hasNext: freezed == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasPrev: freezed == hasPrev
          ? _value.hasPrev
          : hasPrev // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PageableModelDtoImpl implements _PageableModelDto {
  const _$PageableModelDtoImpl(
      {@JsonKey(name: 'page') this.page,
      @JsonKey(name: 'limit') this.limit,
      @JsonKey(name: 'total') this.total,
      @JsonKey(name: 'totalPages') this.totalPages,
      @JsonKey(name: 'hasNext') this.hasNext,
      @JsonKey(name: 'hasPrev') this.hasPrev});

  factory _$PageableModelDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageableModelDtoImplFromJson(json);

  @override
  @JsonKey(name: 'page')
  final int? page;
  @override
  @JsonKey(name: 'limit')
  final int? limit;
  @override
  @JsonKey(name: 'total')
  final int? total;
  @override
  @JsonKey(name: 'totalPages')
  final int? totalPages;
  @override
  @JsonKey(name: 'hasNext')
  final bool? hasNext;
  @override
  @JsonKey(name: 'hasPrev')
  final bool? hasPrev;

  @override
  String toString() {
    return 'PageableModelDto(page: $page, limit: $limit, total: $total, totalPages: $totalPages, hasNext: $hasNext, hasPrev: $hasPrev)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageableModelDtoImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            (identical(other.hasPrev, hasPrev) || other.hasPrev == hasPrev));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, page, limit, total, totalPages, hasNext, hasPrev);

  /// Create a copy of PageableModelDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PageableModelDtoImplCopyWith<_$PageableModelDtoImpl> get copyWith =>
      __$$PageableModelDtoImplCopyWithImpl<_$PageableModelDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PageableModelDtoImplToJson(
      this,
    );
  }
}

abstract class _PageableModelDto implements PageableModelDto {
  const factory _PageableModelDto(
      {@JsonKey(name: 'page') final int? page,
      @JsonKey(name: 'limit') final int? limit,
      @JsonKey(name: 'total') final int? total,
      @JsonKey(name: 'totalPages') final int? totalPages,
      @JsonKey(name: 'hasNext') final bool? hasNext,
      @JsonKey(name: 'hasPrev') final bool? hasPrev}) = _$PageableModelDtoImpl;

  factory _PageableModelDto.fromJson(Map<String, dynamic> json) =
      _$PageableModelDtoImpl.fromJson;

  @override
  @JsonKey(name: 'page')
  int? get page;
  @override
  @JsonKey(name: 'limit')
  int? get limit;
  @override
  @JsonKey(name: 'total')
  int? get total;
  @override
  @JsonKey(name: 'totalPages')
  int? get totalPages;
  @override
  @JsonKey(name: 'hasNext')
  bool? get hasNext;
  @override
  @JsonKey(name: 'hasPrev')
  bool? get hasPrev;

  /// Create a copy of PageableModelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PageableModelDtoImplCopyWith<_$PageableModelDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
