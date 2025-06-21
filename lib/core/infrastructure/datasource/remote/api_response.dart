// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@Freezed(genericArgumentFactories: true)
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    T? data,
    @Default('') String code,
    String? message,
    @Default('') String method,
    @Default('success') String status,
  }) = _ApiResponse<T>;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);
}

// Generic payload cho các API khác
@Freezed(genericArgumentFactories: true)
class PayloadPageableDto<T> with _$PayloadPageableDto<T> {
  const factory PayloadPageableDto({
    @JsonKey(name: 'data') @Default([]) List<T> data,
    @JsonKey(name: 'pagination') PageableModelDto? pagination,
  }) = _PayloadPageableDto<T>;

  factory PayloadPageableDto.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$PayloadPageableDtoFromJson(json, fromJsonT);
}

// Vocabulary response với contents field
@Freezed(genericArgumentFactories: true)
class VocabularyPageableDto<T> with _$VocabularyPageableDto<T> {
  const factory VocabularyPageableDto({
    @JsonKey(name: 'contents')
    @Default([])
    List<T> contents, // Đổi từ vocabularies thành contents
    @JsonKey(name: 'pagination') PageableModelDto? pagination,
  }) = _VocabularyPageableDto<T>;

  factory VocabularyPageableDto.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$VocabularyPageableDtoFromJson(json, fromJsonT);
}

@freezed
class PageableModelDto with _$PageableModelDto {
  const factory PageableModelDto({
    @JsonKey(name: 'page') int? page,
    @JsonKey(name: 'limit') int? limit,
    @JsonKey(name: 'total') int? total,
    @JsonKey(name: 'totalPages') int? totalPages,
    @JsonKey(name: 'hasNext') bool? hasNext,
    @JsonKey(name: 'hasPrev') bool? hasPrev,
  }) = _PageableModelDto;

  factory PageableModelDto.fromJson(Map<String, dynamic> json) =>
      _$PageableModelDtoFromJson(json);
}
