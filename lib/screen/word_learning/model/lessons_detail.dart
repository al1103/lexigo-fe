import 'package:freezed_annotation/freezed_annotation.dart';

part 'lessons_detail.freezed.dart';
part 'lessons_detail.g.dart';

@freezed
class LessonsDetail with _$LessonsDetail {
  const factory LessonsDetail({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'question_text') String? questionText,
    @JsonKey(name: 'option_a') String? optionA,
    @JsonKey(name: 'option_b') String? optionB,
    @JsonKey(name: 'option_c') String? optionC,
    @JsonKey(name: 'option_d') String? optionD,
    @JsonKey(name: 'correct_answer') String? correctAnswer,
    @JsonKey(name: 'explanation') String? explanation,
  }) = _LessonsDetail;

  factory LessonsDetail.fromJson(Map<String, dynamic> json) =>
      _$LessonsDetailFromJson(json);
}
