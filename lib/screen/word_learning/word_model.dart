import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_model.freezed.dart';
part 'word_model.g.dart';

@freezed
class WordModel with _$WordModel {
  const factory WordModel({
    @JsonKey(name: 'questions') List<Question>? questions,
    @JsonKey(name: 'total') int? total,
  }) = _WordModel;

  factory WordModel.fromJson(Map<String, dynamic> json) =>
      _$WordModelFromJson(json);
}

@freezed
class Question with _$Question {
  const factory Question({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'question_text') String? questionText,
    @JsonKey(name: 'question_type') String? questionType,
    @JsonKey(name: 'correct_answer') String? correctAnswer,
    @JsonKey(name: 'explanation') String? explanation,
    @JsonKey(name: 'points') int? points,
    @JsonKey(name: 'word') String? word,
    @JsonKey(name: 'pronunciation') String? pronunciation,
    @JsonKey(name: 'meaning') String? meaning,
    @JsonKey(name: 'difficulty_level') String? difficultyLevel,
    @JsonKey(name: 'category_name') String? categoryName,
    @JsonKey(name: 'options') List<Option>? options,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}

@freezed
class Option with _$Option {
  const factory Option({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'question_id') int? questionId,
    @JsonKey(name: 'option_text') String? optionText,
    @JsonKey(name: 'is_correct') bool? isCorrect,
    @JsonKey(name: 'option_order') int? optionOrder,
  }) = _Option;

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
}
