import 'package:freezed_annotation/freezed_annotation.dart';

part 'speaking_result.freezed.dart';
part 'speaking_result.g.dart';

@freezed
class SpeakingResult with _$SpeakingResult {
  const factory SpeakingResult({
    @JsonKey(name: 'accuracy_level') String? accuracyLevel,
    @JsonKey(name: 'overall_score') int? overallScore,
    @JsonKey(name: 'reference_ipa') String? referenceIpa,
    @JsonKey(name: 'reference_text') String? referenceText,
    @JsonKey(name: 'spoken_ipa') String? spokenIpa,
    @JsonKey(name: 'spoken_text') String? spokenText,
    @JsonKey(name: 'word_analysis') List<WordAnalysis>? wordAnalysis,
  }) = _SpeakingResult;

  factory SpeakingResult.fromJson(Map<String, dynamic> json) =>
      _$SpeakingResultFromJson(json);
}

@freezed
class WordAnalysis with _$WordAnalysis {
  const factory WordAnalysis({
    @JsonKey(name: 'reference') String? reference,
    @JsonKey(name: 'score') int? score,
    @JsonKey(name: 'spoken') String? spoken,
    @JsonKey(name: 'status') String? status,
  }) = _WordAnalysis;

  factory WordAnalysis.fromJson(Map<String, dynamic> json) =>
      _$WordAnalysisFromJson(json);
}
