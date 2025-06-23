// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_word_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SmartWordImpl _$$SmartWordImplFromJson(Map<String, dynamic> json) =>
    _$SmartWordImpl(
      word: json['word'] as String?,
      pronunciations: (json['pronunciations'] as List<dynamic>?)
          ?.map((e) => Pronunciation.fromJson(e as Map<String, dynamic>))
          .toList(),
      meanings: (json['meanings'] as List<dynamic>?)
          ?.map((e) => Meaning.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SmartWordImplToJson(_$SmartWordImpl instance) =>
    <String, dynamic>{
      'word': instance.word,
      'pronunciations': instance.pronunciations,
      'meanings': instance.meanings,
    };

_$MeaningImpl _$$MeaningImplFromJson(Map<String, dynamic> json) =>
    _$MeaningImpl(
      partOfSpeech: json['partOfSpeech'] as String?,
      vietnamese: json['vietnamese'] as String?,
      definition: json['definition'] as String?,
      examples: (json['examples'] as List<dynamic>?)
          ?.map((e) => Example.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MeaningImplToJson(_$MeaningImpl instance) =>
    <String, dynamic>{
      'partOfSpeech': instance.partOfSpeech,
      'vietnamese': instance.vietnamese,
      'definition': instance.definition,
      'examples': instance.examples,
    };

_$ExampleImpl _$$ExampleImplFromJson(Map<String, dynamic> json) =>
    _$ExampleImpl(
      english: json['english'] as String?,
      vietnamese: json['vietnamese'] as String?,
    );

Map<String, dynamic> _$$ExampleImplToJson(_$ExampleImpl instance) =>
    <String, dynamic>{
      'english': instance.english,
      'vietnamese': instance.vietnamese,
    };

_$PronunciationImpl _$$PronunciationImplFromJson(Map<String, dynamic> json) =>
    _$PronunciationImpl(
      ipa: json['ipa'] as String?,
      audio: json['audio'] as String?,
    );

Map<String, dynamic> _$$PronunciationImplToJson(_$PronunciationImpl instance) =>
    <String, dynamic>{
      'ipa': instance.ipa,
      'audio': instance.audio,
    };
