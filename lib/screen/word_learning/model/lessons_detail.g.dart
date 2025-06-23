// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lessons_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonsDetailImpl _$$LessonsDetailImplFromJson(Map<String, dynamic> json) =>
    _$LessonsDetailImpl(
      questionId: (json['question_id'] as num?)?.toInt(),
      questionText: json['question_text'] as String?,
      word: json['word'] as String?,
      meaning: json['meaning'] as String?,
      pronunciation: json['pronunciation'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      points: (json['points'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$LessonsDetailImplToJson(_$LessonsDetailImpl instance) =>
    <String, dynamic>{
      'question_id': instance.questionId,
      'question_text': instance.questionText,
      'word': instance.word,
      'meaning': instance.meaning,
      'pronunciation': instance.pronunciation,
      'options': instance.options,
      'points': instance.points,
    };

_$OptionImpl _$$OptionImplFromJson(Map<String, dynamic> json) => _$OptionImpl(
      optionId: (json['option_id'] as num?)?.toInt(),
      optionText: json['option_text'] as String?,
      isCorrect: json['is_correct'] as bool?,
      optionOrder: (json['option_order'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$OptionImplToJson(_$OptionImpl instance) =>
    <String, dynamic>{
      'option_id': instance.optionId,
      'option_text': instance.optionText,
      'is_correct': instance.isCorrect,
      'option_order': instance.optionOrder,
    };
