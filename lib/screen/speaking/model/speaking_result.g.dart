// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speaking_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpeakingResultImpl _$$SpeakingResultImplFromJson(Map<String, dynamic> json) =>
    _$SpeakingResultImpl(
      accuracyLevel: json['accuracy_level'] as String?,
      overallScore: (json['overall_score'] as num?)?.toInt(),
      referenceIpa: json['reference_ipa'] as String?,
      referenceText: json['reference_text'] as String?,
      spokenIpa: json['spoken_ipa'] as String?,
      spokenText: json['spoken_text'] as String?,
      wordAnalysis: (json['word_analysis'] as List<dynamic>?)
          ?.map((e) => WordAnalysis.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SpeakingResultImplToJson(
        _$SpeakingResultImpl instance) =>
    <String, dynamic>{
      'accuracy_level': instance.accuracyLevel,
      'overall_score': instance.overallScore,
      'reference_ipa': instance.referenceIpa,
      'reference_text': instance.referenceText,
      'spoken_ipa': instance.spokenIpa,
      'spoken_text': instance.spokenText,
      'word_analysis': instance.wordAnalysis,
    };

_$WordAnalysisImpl _$$WordAnalysisImplFromJson(Map<String, dynamic> json) =>
    _$WordAnalysisImpl(
      reference: json['reference'] as String?,
      score: (json['score'] as num?)?.toInt(),
      spoken: json['spoken'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$WordAnalysisImplToJson(_$WordAnalysisImpl instance) =>
    <String, dynamic>{
      'reference': instance.reference,
      'score': instance.score,
      'spoken': instance.spoken,
      'status': instance.status,
    };
