// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lessons_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonsImpl _$$LessonsImplFromJson(Map<String, dynamic> json) =>
    _$LessonsImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      difficultyLevel: json['difficulty_level'] as String?,
      totalQuestions: (json['total_questions'] as num?)?.toInt(),
      isPublished: json['is_published'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      actualQuestionCount: json['actual_question_count'] as String?,
    );

Map<String, dynamic> _$$LessonsImplToJson(_$LessonsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'difficulty_level': instance.difficultyLevel,
      'total_questions': instance.totalQuestions,
      'is_published': instance.isPublished,
      'created_at': instance.createdAt?.toIso8601String(),
      'actual_question_count': instance.actualQuestionCount,
    };
