import 'package:flutter/material.dart';
import 'package:lexigo/screen/scan_objects/models/detection_result.dart';
import 'package:lexigo/screen/scan_objects/widgets/detection_overlay_painter.dart';

class DetectionOverlay extends StatelessWidget {
  const DetectionOverlay({
    required this.detections,
    required this.imageSize,
    required this.displaySize,
    super.key,
    this.showBoundingBoxes = true,
    this.showLabels = true,
    this.showConfidence = true,
    this.onDetectionTap,
  });

  final List<DetectionResult> detections;
  final Size imageSize;
  final Size displaySize;
  final bool showBoundingBoxes;
  final bool showLabels;
  final bool showConfidence;
  final void Function(DetectionResult detection)? onDetectionTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: DetectionOverlayPainter(
            detections: detections,
            imageSize: imageSize,
            displaySize: displaySize,
            showBoundingBoxes: showBoundingBoxes,
            showLabels: showLabels,
            showConfidence: showConfidence,
          ),
          size: displaySize,
        ),
        ...detections.map((detection) {
          final rect = _calculateDetectionBounds(detection);
          return Positioned.fromRect(
            rect: rect,
            child: InkWell(
              onTap: () => onDetectionTap?.call(detection),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  Rect _calculateDetectionBounds(DetectionResult detection) {
    final vertices = detection.boundingPoly.vertices;
    if (vertices.isEmpty) return Rect.zero;

    // Calculate image display properties
    final imageAspectRatio = imageSize.width / imageSize.height;
    final containerAspectRatio = displaySize.width / displaySize.height;

    late Size actualImageDisplaySize;
    late Offset imageOffset;

    if (imageAspectRatio > containerAspectRatio) {
      actualImageDisplaySize =
          Size(displaySize.width, displaySize.width / imageAspectRatio);
      imageOffset =
          Offset(0, (displaySize.height - actualImageDisplaySize.height) / 2);
    } else {
      actualImageDisplaySize =
          Size(displaySize.height * imageAspectRatio, displaySize.height);
      imageOffset =
          Offset((displaySize.width - actualImageDisplaySize.width) / 2, 0);
    }

    var minX = double.infinity;
    var minY = double.infinity;
    var maxX = -double.infinity;
    var maxY = -double.infinity;

    for (final vertex in vertices) {
      final x = (vertex.x * actualImageDisplaySize.width) + imageOffset.dx;
      final y = (vertex.y * actualImageDisplaySize.height) + imageOffset.dy;
      minX = minX < x ? minX : x;
      minY = minY < y ? minY : y;
      maxX = maxX > x ? maxX : x;
      maxY = maxY > y ? maxY : y;
    }

    return Rect.fromLTRB(minX, minY, maxX, maxY);
  }
}
