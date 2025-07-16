// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_rank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyRankImpl _$$MyRankImplFromJson(Map<String, dynamic> json) => _$MyRankImpl(
      global: json['global'] == null
          ? null
          : Global.fromJson(json['global'] as Map<String, dynamic>),
      weekly: json['weekly'] == null
          ? null
          : Global.fromJson(json['weekly'] as Map<String, dynamic>),
      monthly: json['monthly'] == null
          ? null
          : Global.fromJson(json['monthly'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MyRankImplToJson(_$MyRankImpl instance) =>
    <String, dynamic>{
      'global': instance.global,
      'weekly': instance.weekly,
      'monthly': instance.monthly,
    };

_$GlobalImpl _$$GlobalImplFromJson(Map<String, dynamic> json) => _$GlobalImpl(
      rank: json['rank'] as String?,
    );

Map<String, dynamic> _$$GlobalImplToJson(_$GlobalImpl instance) =>
    <String, dynamic>{
      'rank': instance.rank,
    };
