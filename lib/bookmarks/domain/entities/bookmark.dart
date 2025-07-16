import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmark.freezed.dart';
part 'bookmark.g.dart';

@freezed
class QuizBookmark with _$QuizBookmark {
  const factory QuizBookmark({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'notes') String? notes,
    @JsonKey(name: 'bookmarked_at') DateTime? bookmarkedAt,
    @JsonKey(name: 'word_id') int? wordId,
    @JsonKey(name: 'word') String? word,
    @JsonKey(name: 'meaning') String? meaning,
    @JsonKey(name: 'pronunciation') String? pronunciation,
    @JsonKey(name: 'example_sentence') String? exampleSentence,
    @JsonKey(name: 'difficulty_level') String? difficultyLevel,
  }) = _QuizBookmark;

  factory QuizBookmark.fromJson(Map<String, dynamic> json) =>
      _$QuizBookmarkFromJson(json);
}
