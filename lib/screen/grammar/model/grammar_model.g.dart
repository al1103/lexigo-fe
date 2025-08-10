// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grammar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GrammarModelImpl _$$GrammarModelImplFromJson(Map<String, dynamic> json) =>
    _$GrammarModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      difficultyLevel: json['difficulty_level'] as String,
      category: json['category'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      readingTime: (json['reading_time'] as num?)?.toInt(),
      isPublished: json['is_published'] as bool? ?? true,
    );

Map<String, dynamic> _$$GrammarModelImplToJson(_$GrammarModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'difficulty_level': instance.difficultyLevel,
      'category': instance.category,
      'tags': instance.tags,
      'reading_time': instance.readingTime,
      'is_published': instance.isPublished,
    };

_$GrammarCategoryImpl _$$GrammarCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$GrammarCategoryImpl(
      name: json['name'] as String,
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$$GrammarCategoryImplToJson(
        _$GrammarCategoryImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'count': instance.count,
    };

_$GrammarResponseImpl _$$GrammarResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GrammarResponseImpl(
      items: (json['articles'] as List<dynamic>)
          .map((e) => GrammarModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt() ?? 0,
      page: (json['page'] as num?)?.toInt() ?? 1,
      limit: (json['limit'] as num?)?.toInt() ?? 10,
    );

Map<String, dynamic> _$$GrammarResponseImplToJson(
        _$GrammarResponseImpl instance) =>
    <String, dynamic>{
      'articles': instance.items,
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
    };
