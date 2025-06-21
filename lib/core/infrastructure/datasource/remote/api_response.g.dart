// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiResponseImpl<T> _$$ApiResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ApiResponseImpl<T>(
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      code: json['code'] as String? ?? '',
      message: json['message'] as String?,
      method: json['method'] as String? ?? '',
      status: json['status'] as String? ?? 'success',
    );

Map<String, dynamic> _$$ApiResponseImplToJson<T>(
  _$ApiResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'code': instance.code,
      'message': instance.message,
      'method': instance.method,
      'status': instance.status,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

_$PayloadPageableDtoImpl<T> _$$PayloadPageableDtoImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$PayloadPageableDtoImpl<T>(
      data:
          (json['data'] as List<dynamic>?)?.map(fromJsonT).toList() ?? const [],
      pagination: json['pagination'] == null
          ? null
          : PageableModelDto.fromJson(
              json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PayloadPageableDtoImplToJson<T>(
  _$PayloadPageableDtoImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': instance.data.map(toJsonT).toList(),
      'pagination': instance.pagination,
    };

_$VocabularyPageableDtoImpl<T> _$$VocabularyPageableDtoImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$VocabularyPageableDtoImpl<T>(
      contents: (json['contents'] as List<dynamic>?)?.map(fromJsonT).toList() ??
          const [],
      pagination: json['pagination'] == null
          ? null
          : PageableModelDto.fromJson(
              json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VocabularyPageableDtoImplToJson<T>(
  _$VocabularyPageableDtoImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'contents': instance.contents.map(toJsonT).toList(),
      'pagination': instance.pagination,
    };

_$PageableModelDtoImpl _$$PageableModelDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PageableModelDtoImpl(
      page: (json['page'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      hasNext: json['hasNext'] as bool?,
      hasPrev: json['hasPrev'] as bool?,
    );

Map<String, dynamic> _$$PageableModelDtoImplToJson(
        _$PageableModelDtoImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'total': instance.total,
      'totalPages': instance.totalPages,
      'hasNext': instance.hasNext,
      'hasPrev': instance.hasPrev,
    };
