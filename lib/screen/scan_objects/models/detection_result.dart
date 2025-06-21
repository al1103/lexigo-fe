import 'package:freezed_annotation/freezed_annotation.dart';

part 'detection_result.freezed.dart';
part 'detection_result.g.dart';

@freezed
class DetectionResult with _$DetectionResult {
  const factory DetectionResult({
    required String name,
    required double score,
    required BoundingPoly boundingPoly,
  }) = _DetectionResult;

  factory DetectionResult.fromJson(Map<String, dynamic> json) =>
      _$DetectionResultFromJson(json);
}

@freezed
class BoundingPoly with _$BoundingPoly {
  const factory BoundingPoly({
    required List<Vertex> vertices,
  }) = _BoundingPoly;

  factory BoundingPoly.fromJson(Map<String, dynamic> json) =>
      _$BoundingPolyFromJson(json);
}

/// Represents a vertex point in relative coordinates (percentage of image dimensions)
///
/// The [x] and [y] values are expressed as percentages (0.0 to 1.0) of the image width and height.
/// For example:
/// - x: 0.5 means 50% of the image width from the left
/// - y: 0.5 means 50% of the image height from the top
@freezed
class Vertex with _$Vertex {
  const factory Vertex({
    /// X coordinate as a percentage (0.0 to 1.0) of image width
    required double x,

    /// Y coordinate as a percentage (0.0 to 1.0) of image height
    required double y,
  }) = _Vertex;

  factory Vertex.fromJson(Map<String, dynamic> json) => _$VertexFromJson(json);
}
