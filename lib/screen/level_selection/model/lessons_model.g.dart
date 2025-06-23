// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lessons_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonsImpl _$$LessonsImplFromJson(Map<String, dynamic> json) =>
    _$LessonsImpl(
      id: (json['id'] as num?)?.toInt(),
      levelCode: json['level_code'] as String?,
      levelName: json['level_name'] as String?,
      levelNameVi: json['level_name_vi'] as String?,
      description: json['description'] as String?,
      descriptionVi: json['description_vi'] as String?,
      color: json['color'] as String?,
      icon: json['icon'] as String?,
      minScore: (json['min_score'] as num?)?.toInt(),
      maxScore: (json['max_score'] as num?)?.toInt(),
      sortOrder: (json['sort_order'] as num?)?.toInt(),
      isActive: json['is_active'] as bool?,
    );

Map<String, dynamic> _$$LessonsImplToJson(_$LessonsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'level_code': instance.levelCode,
      'level_name': instance.levelName,
      'level_name_vi': instance.levelNameVi,
      'description': instance.description,
      'description_vi': instance.descriptionVi,
      'color': instance.color,
      'icon': instance.icon,
      'min_score': instance.minScore,
      'max_score': instance.maxScore,
      'sort_order': instance.sortOrder,
      'is_active': instance.isActive,
    };
