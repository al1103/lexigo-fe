// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lessons_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonsDetailImpl _$$LessonsDetailImplFromJson(Map<String, dynamic> json) =>
    _$LessonsDetailImpl(
      id: (json['id'] as num?)?.toInt(),
      questionText: json['question_text'] as String?,
      optionA: json['option_a'] as String?,
      optionB: json['option_b'] as String?,
      optionC: json['option_c'] as String?,
      optionD: json['option_d'] as String?,
      correctAnswer: json['correct_answer'] as String?,
      explanation: json['explanation'] as String?,
    );

Map<String, dynamic> _$$LessonsDetailImplToJson(_$LessonsDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question_text': instance.questionText,
      'option_a': instance.optionA,
      'option_b': instance.optionB,
      'option_c': instance.optionC,
      'option_d': instance.optionD,
      'correct_answer': instance.correctAnswer,
      'explanation': instance.explanation,
    };
