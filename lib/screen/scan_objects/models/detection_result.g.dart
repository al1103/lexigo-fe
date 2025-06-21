// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detection_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetectionResultImpl _$$DetectionResultImplFromJson(
        Map<String, dynamic> json) =>
    _$DetectionResultImpl(
      name: json['name'] as String,
      score: (json['score'] as num).toDouble(),
      boundingPoly:
          BoundingPoly.fromJson(json['boundingPoly'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DetectionResultImplToJson(
        _$DetectionResultImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'score': instance.score,
      'boundingPoly': instance.boundingPoly,
    };

_$BoundingPolyImpl _$$BoundingPolyImplFromJson(Map<String, dynamic> json) =>
    _$BoundingPolyImpl(
      vertices: (json['vertices'] as List<dynamic>)
          .map((e) => Vertex.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BoundingPolyImplToJson(_$BoundingPolyImpl instance) =>
    <String, dynamic>{
      'vertices': instance.vertices,
    };

_$VertexImpl _$$VertexImplFromJson(Map<String, dynamic> json) => _$VertexImpl(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
    );

Map<String, dynamic> _$$VertexImplToJson(_$VertexImpl instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };
