// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WordModelImpl _$$WordModelImplFromJson(Map<String, dynamic> json) =>
    _$WordModelImpl(
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$WordModelImplToJson(_$WordModelImpl instance) =>
    <String, dynamic>{
      'questions': instance.questions,
      'total': instance.total,
    };

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionImpl(
      id: (json['id'] as num?)?.toInt(),
      questionText: json['question_text'] as String?,
      questionType: json['question_type'] as String?,
      correctAnswer: json['correct_answer'] as String?,
      explanation: json['explanation'] as String?,
      points: (json['points'] as num?)?.toInt(),
      word: json['word'] as String?,
      pronunciation: json['pronunciation'] as String?,
      meaning: json['meaning'] as String?,
      difficultyLevel: json['difficulty_level'] as String?,
      categoryName: json['category_name'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QuestionImplToJson(_$QuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question_text': instance.questionText,
      'question_type': instance.questionType,
      'correct_answer': instance.correctAnswer,
      'explanation': instance.explanation,
      'points': instance.points,
      'word': instance.word,
      'pronunciation': instance.pronunciation,
      'meaning': instance.meaning,
      'difficulty_level': instance.difficultyLevel,
      'category_name': instance.categoryName,
      'options': instance.options,
    };

_$OptionImpl _$$OptionImplFromJson(Map<String, dynamic> json) => _$OptionImpl(
      id: (json['id'] as num?)?.toInt(),
      questionId: (json['question_id'] as num?)?.toInt(),
      optionText: json['option_text'] as String?,
      isCorrect: json['is_correct'] as bool?,
      optionOrder: (json['option_order'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$OptionImplToJson(_$OptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question_id': instance.questionId,
      'option_text': instance.optionText,
      'is_correct': instance.isCorrect,
      'option_order': instance.optionOrder,
    };
