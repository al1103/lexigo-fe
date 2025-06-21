import 'package:freezed_annotation/freezed_annotation.dart';

part 'vocabulary_model.freezed.dart';
part 'vocabulary_model.g.dart';

@freezed
class VocabularyModel with _$VocabularyModel {
  const factory VocabularyModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'word') String? word,
    @JsonKey(name: 'pronunciation') String? pronunciation,
    @JsonKey(name: 'meaning') String? meaning,
    @JsonKey(name: 'definition') String? definition,
    @JsonKey(name: 'example_sentence') String? exampleSentence,
    @JsonKey(name: 'category_id') int? categoryId,
    @JsonKey(name: 'difficulty_level') String? difficultyLevel,
    @JsonKey(name: 'audio_url') String? audioUrl,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'category_name') String? categoryName,
    @JsonKey(name: 'category_color') String? categoryColor,
  }) = _VocabularyModel;

  factory VocabularyModel.fromJson(Map<String, dynamic> json) =>
      _$VocabularyModelFromJson(json);
}
