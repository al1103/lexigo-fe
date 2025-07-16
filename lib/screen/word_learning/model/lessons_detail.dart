
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lessons_detail.freezed.dart';
part 'lessons_detail.g.dart';

@freezed
class LessonsDetail with _$LessonsDetail {
  const factory LessonsDetail({
    @JsonKey(name: 'question_id') int? questionId,
    @JsonKey(name: 'question_text') String? questionText,
    @JsonKey(name: 'question_type') String? questionType,
    @JsonKey(name: 'points') int? points,
    @JsonKey(name: 'word') Word? word,
    @JsonKey(name: 'options') List<Option>? options,
  }) = _LessonsDetail;

  factory LessonsDetail.fromJson(Map<String, dynamic> json) =>
      _$LessonsDetailFromJson(json);
}

@freezed
class Option with _$Option {
  const factory Option({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'option_text') String? optionText,
    @JsonKey(name: 'is_correct') bool? isCorrect,
    @JsonKey(name: 'option_order') int? optionOrder,
  }) = _Option;

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
}

@freezed
class Word with _$Word {
  const factory Word({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'word') String? word,
    @JsonKey(name: 'pronunciation') String? pronunciation,
    @JsonKey(name: 'meaning') String? meaning,
    @JsonKey(name: 'definition') dynamic definition,
    @JsonKey(name: 'example_sentence') String? exampleSentence,
    @JsonKey(name: 'audio_url') dynamic audioUrl,
    @JsonKey(name: 'image_url') dynamic imageUrl,
    @JsonKey(name: 'is_bookmarked') bool? isBookmarked,
    @JsonKey(name: 'bookmark_notes') dynamic bookmarkNotes,
  }) = _Word;

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);
}
