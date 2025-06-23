import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'lessons_detail.freezed.dart';
part 'lessons_detail.g.dart';

@freezed
class LessonsDetail with _$LessonsDetail {
  const factory LessonsDetail({
    @JsonKey(name: 'question_id') int? questionId,
    @JsonKey(name: 'question_text') String? questionText,
    @JsonKey(name: 'word') String? word,
    @JsonKey(name: 'meaning') String? meaning,
    @JsonKey(name: 'pronunciation') String? pronunciation,
    @JsonKey(name: 'options') List<Option>? options,
    @JsonKey(name: 'points') int? points,
  }) = _LessonsDetail;

  factory LessonsDetail.fromJson(Map<String, dynamic> json) =>
      _$LessonsDetailFromJson(json);
}

@freezed
class Option with _$Option {
  const factory Option({
    @JsonKey(name: 'option_id') int? optionId,
    @JsonKey(name: 'option_text') String? optionText,
    @JsonKey(name: 'is_correct') bool? isCorrect,
    @JsonKey(name: 'option_order') int? optionOrder,
  }) = _Option;

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
}
