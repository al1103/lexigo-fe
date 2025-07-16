// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuotesModelImpl _$$QuotesModelImplFromJson(Map<String, dynamic> json) =>
    _$QuotesModelImpl(
      id: (json['id'] as num?)?.toInt(),
      content: json['content'] as String?,
      author: json['author'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$QuotesModelImplToJson(_$QuotesModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'author': instance.author,
      'created_at': instance.createdAt?.toIso8601String(),
    };
