import 'package:freezed_annotation/freezed_annotation.dart';

part 'lessons_model.freezed.dart';
part 'lessons_model.g.dart';

@freezed
class LessonsModel with _$LessonsModel {
  const factory LessonsModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'difficulty_level') String? difficultyLevel,
    @JsonKey(name: 'total_questions') int? totalQuestions,
    @JsonKey(name: 'is_published') bool? isPublished,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'actual_question_count') String? actualQuestionCount,
  }) = _Lessons;

  factory LessonsModel.fromJson(Map<String, dynamic> json) =>
      _$LessonsModelFromJson(json);
}
