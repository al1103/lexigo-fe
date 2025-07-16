// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lessons_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonsDetailImpl _$$LessonsDetailImplFromJson(Map<String, dynamic> json) =>
    _$LessonsDetailImpl(
      questionId: (json['question_id'] as num?)?.toInt(),
      questionText: json['question_text'] as String?,
      questionType: json['question_type'] as String?,
      points: (json['points'] as num?)?.toInt(),
      word: json['word'] == null
          ? null
          : Word.fromJson(json['word'] as Map<String, dynamic>),
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LessonsDetailImplToJson(_$LessonsDetailImpl instance) =>
    <String, dynamic>{
      'question_id': instance.questionId,
      'question_text': instance.questionText,
      'question_type': instance.questionType,
      'points': instance.points,
      'word': instance.word,
      'options': instance.options,
    };

_$OptionImpl _$$OptionImplFromJson(Map<String, dynamic> json) => _$OptionImpl(
      id: (json['id'] as num?)?.toInt(),
      optionText: json['option_text'] as String?,
      isCorrect: json['is_correct'] as bool?,
      optionOrder: (json['option_order'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$OptionImplToJson(_$OptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'option_text': instance.optionText,
      'is_correct': instance.isCorrect,
      'option_order': instance.optionOrder,
    };

_$WordImpl _$$WordImplFromJson(Map<String, dynamic> json) => _$WordImpl(
      id: (json['id'] as num?)?.toInt(),
      word: json['word'] as String?,
      pronunciation: json['pronunciation'] as String?,
      meaning: json['meaning'] as String?,
      definition: json['definition'],
      exampleSentence: json['example_sentence'] as String?,
      audioUrl: json['audio_url'],
      imageUrl: json['image_url'],
      isBookmarked: json['is_bookmarked'] as bool?,
      bookmarkNotes: json['bookmark_notes'],
    );

Map<String, dynamic> _$$WordImplToJson(_$WordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'word': instance.word,
      'pronunciation': instance.pronunciation,
      'meaning': instance.meaning,
      'definition': instance.definition,
      'example_sentence': instance.exampleSentence,
      'audio_url': instance.audioUrl,
      'image_url': instance.imageUrl,
      'is_bookmarked': instance.isBookmarked,
      'bookmark_notes': instance.bookmarkNotes,
    };
