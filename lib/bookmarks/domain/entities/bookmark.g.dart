// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizBookmarkImpl _$$QuizBookmarkImplFromJson(Map<String, dynamic> json) =>
    _$QuizBookmarkImpl(
      id: (json['id'] as num?)?.toInt(),
      notes: json['notes'] as String?,
      bookmarkedAt: json['bookmarked_at'] == null
          ? null
          : DateTime.parse(json['bookmarked_at'] as String),
      wordId: (json['word_id'] as num?)?.toInt(),
      word: json['word'] as String?,
      meaning: json['meaning'] as String?,
      pronunciation: json['pronunciation'] as String?,
      exampleSentence: json['example_sentence'] as String?,
      difficultyLevel: json['difficulty_level'] as String?,
    );

Map<String, dynamic> _$$QuizBookmarkImplToJson(_$QuizBookmarkImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'notes': instance.notes,
      'bookmarked_at': instance.bookmarkedAt?.toIso8601String(),
      'word_id': instance.wordId,
      'word': instance.word,
      'meaning': instance.meaning,
      'pronunciation': instance.pronunciation,
      'example_sentence': instance.exampleSentence,
      'difficulty_level': instance.difficultyLevel,
    };
