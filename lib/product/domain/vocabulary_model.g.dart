// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VocabularyModelImpl _$$VocabularyModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VocabularyModelImpl(
      id: (json['id'] as num?)?.toInt(),
      word: json['word'] as String?,
      pronunciation: json['pronunciation'] as String?,
      meaning: json['meaning'] as String?,
      definition: json['definition'] as String?,
      exampleSentence: json['example_sentence'] as String?,
      categoryId: (json['category_id'] as num?)?.toInt(),
      difficultyLevel: json['difficulty_level'] as String?,
      audioUrl: json['audio_url'] as String?,
      imageUrl: json['image_url'] as String?,
      isActive: json['is_active'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      categoryName: json['category_name'] as String?,
      categoryColor: json['category_color'] as String?,
    );

Map<String, dynamic> _$$VocabularyModelImplToJson(
        _$VocabularyModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'word': instance.word,
      'pronunciation': instance.pronunciation,
      'meaning': instance.meaning,
      'definition': instance.definition,
      'example_sentence': instance.exampleSentence,
      'category_id': instance.categoryId,
      'difficulty_level': instance.difficultyLevel,
      'audio_url': instance.audioUrl,
      'image_url': instance.imageUrl,
      'is_active': instance.isActive,
      'created_at': instance.createdAt?.toIso8601String(),
      'category_name': instance.categoryName,
      'category_color': instance.categoryColor,
    };
