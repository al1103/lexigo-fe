import 'package:freezed_annotation/freezed_annotation.dart';

part 'smart_word_model.freezed.dart';
part 'smart_word_model.g.dart';

@freezed
class SmartWord with _$SmartWord {
  const factory SmartWord({
    @JsonKey(name: 'word') String? word,
    @JsonKey(name: 'pronunciations') List<Pronunciation>? pronunciations,
    @JsonKey(name: 'meanings') List<Meaning>? meanings,
  }) = _SmartWord;

  factory SmartWord.fromJson(Map<String, dynamic> json) =>
      _$SmartWordFromJson(json);
}

@freezed
class Meaning with _$Meaning {
  const factory Meaning({
    @JsonKey(name: 'partOfSpeech') String? partOfSpeech,
    @JsonKey(name: 'vietnamese') String? vietnamese,
    @JsonKey(name: 'definition') String? definition,
    @JsonKey(name: 'examples') List<Example>? examples,
  }) = _Meaning;

  factory Meaning.fromJson(Map<String, dynamic> json) =>
      _$MeaningFromJson(json);
}

@freezed
class Example with _$Example {
  const factory Example({
    @JsonKey(name: 'english') String? english,
    @JsonKey(name: 'vietnamese') String? vietnamese,
  }) = _Example;

  factory Example.fromJson(Map<String, dynamic> json) =>
      _$ExampleFromJson(json);
}

@freezed
class Pronunciation with _$Pronunciation {
  const factory Pronunciation({
    @JsonKey(name: 'ipa') String? ipa,
    @JsonKey(name: 'audio') String? audio,
  }) = _Pronunciation;

  factory Pronunciation.fromJson(Map<String, dynamic> json) =>
      _$PronunciationFromJson(json);
}
