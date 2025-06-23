import 'package:freezed_annotation/freezed_annotation.dart';

part 'lessons_model.freezed.dart';
part 'lessons_model.g.dart';

@freezed
class LessonsModel with _$LessonsModel {
  const factory LessonsModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'level_code') String? levelCode,
    @JsonKey(name: 'level_name') String? levelName,
    @JsonKey(name: 'level_name_vi') String? levelNameVi,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'description_vi') String? descriptionVi,
    @JsonKey(name: 'color') String? color,
    @JsonKey(name: 'icon') String? icon,
    @JsonKey(name: 'min_score') int? minScore,
    @JsonKey(name: 'max_score') int? maxScore,
    @JsonKey(name: 'sort_order') int? sortOrder,
    @JsonKey(name: 'is_active') bool? isActive,
  }) = _Lessons;

  factory LessonsModel.fromJson(Map<String, dynamic> json) =>
      _$LessonsModelFromJson(json);
}
