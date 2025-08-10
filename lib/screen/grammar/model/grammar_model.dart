import 'package:freezed_annotation/freezed_annotation.dart';

part 'grammar_model.freezed.dart';
part 'grammar_model.g.dart';

@freezed
class GrammarModel with _$GrammarModel {
  const factory GrammarModel({
    required int id,
    required String title,
    required String content,
    @JsonKey(name: 'difficulty_level') required String difficultyLevel,
    String? category,
    List<String>? tags,
    @JsonKey(name: 'reading_time') int? readingTime,
    @JsonKey(name: 'is_published') @Default(true) bool isPublished,
  }) = _GrammarModel;

  factory GrammarModel.fromJson(Map<String, dynamic> json) =>
      _$GrammarModelFromJson(json);
}

@freezed
class GrammarCategory with _$GrammarCategory {
  const factory GrammarCategory({
    required String name,
    required int count,
  }) = _GrammarCategory;

  factory GrammarCategory.fromJson(Map<String, dynamic> json) =>
      _$GrammarCategoryFromJson(json);
}

@freezed
class GrammarResponse with _$GrammarResponse {
  const factory GrammarResponse({
    @JsonKey(name: 'articles') required List<GrammarModel> items,
    @Default(0) int total,
    @Default(1) int page,
    @Default(10) int limit,
  }) = _GrammarResponse;

  factory GrammarResponse.fromJson(Map<String, dynamic> json) =>
      _$GrammarResponseFromJson(json);
}
