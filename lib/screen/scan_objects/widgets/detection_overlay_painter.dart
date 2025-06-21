import 'package:flutter/material.dart';
import 'package:lexigo/screen/scan_objects/models/detection_result.dart';

class DetectionOverlayPainter extends CustomPainter {
  DetectionOverlayPainter({
    required this.detections,
    required this.imageSize,
    required this.displaySize,
    this.showBoundingBoxes = true,
    this.showLabels = true,
    this.showConfidence = true,
  });

  final List<DetectionResult> detections;
  final Size imageSize;
  final Size displaySize;
  final bool showBoundingBoxes;
  final bool showLabels;
  final bool showConfidence;

  @override
  void paint(Canvas canvas, Size size) {
    if (detections.isEmpty) return;

    debugPrint('🎨 Painting detections:');
    debugPrint('   Canvas size: ${size.width} x ${size.height}');
    debugPrint('   Image size: ${imageSize.width} x ${imageSize.height}');
    debugPrint('   Display size: ${displaySize.width} x ${displaySize.height}');

    // Calculate the actual display area of the image when using BoxFit.contain
    final imageAspectRatio = imageSize.width / imageSize.height;
    final containerAspectRatio = size.width / size.height;

    late Size actualImageDisplaySize;
    late Offset imageOffset;

    if (imageAspectRatio > containerAspectRatio) {
      // Image is wider - fit to width, letterbox top/bottom
      actualImageDisplaySize = Size(size.width, size.width / imageAspectRatio);
      imageOffset =
          Offset(0, (size.height - actualImageDisplaySize.height) / 2);
    } else {
      // Image is taller - fit to height, letterbox left/right
      actualImageDisplaySize =
          Size(size.height * imageAspectRatio, size.height);
      imageOffset = Offset((size.width - actualImageDisplaySize.width) / 2, 0);
    }

    debugPrint(
      '   Actual image display size: ${actualImageDisplaySize.width} x ${actualImageDisplaySize.height}',
    );
    debugPrint('   Image offset: ${imageOffset.dx}, ${imageOffset.dy}');

    // Sort detections by area (largest first, smallest last)
    final sortedDetections = [...detections]..sort(
        (a, b) => _calculateArea(b.boundingPoly.vertices)
            .compareTo(_calculateArea(a.boundingPoly.vertices)),
      );

    // Draw from largest to smallest (so smallest appears on top)
    for (var i = 0; i < sortedDetections.length; i++) {
      final detection = sortedDetections[i];
      final color = _getColorForIndex(i);

      debugPrint(
        '   Drawing: ${detection.name} (Area: ${_calculateArea(detection.boundingPoly.vertices)})',
      );
      _drawDetection(
        canvas,
        detection,
        color,
        actualImageDisplaySize,
        imageOffset,
      );
    }
  }

  // Add this helper method to calculate polygon area
  double _calculateArea(List<Vertex> vertices) {
    if (vertices.length < 3) return 0;

    double area = 0;
    for (var i = 0; i < vertices.length; i++) {
      final j = (i + 1) % vertices.length;
      area += vertices[i].x * vertices[j].y;
      area -= vertices[j].x * vertices[i].y;
    }

    area = area.abs() / 2.0;
    return area;
  }

  void _drawDetection(
    Canvas canvas,
    DetectionResult detection,
    Color color,
    Size actualImageDisplaySize,
    Offset imageOffset,
  ) {
    final vertices = detection.boundingPoly.vertices;
    if (vertices.length < 4) return;

    // Transform coordinates: percentage -> display space -> canvas space
    final transformedVertices = vertices.map((vertex) {
      // Convert percentage coordinates to actual display coordinates
      final x = (vertex.x * actualImageDisplaySize.width) + imageOffset.dx;
      final y = (vertex.y * actualImageDisplaySize.height) + imageOffset.dy;

      debugPrint('     (${vertex.x}, ${vertex.y}) -> ($x, $y)');
      return Offset(x, y);
    }).toList();

    // Draw bounding box
    if (showBoundingBoxes) {
      _drawBoundingBox(canvas, transformedVertices, color);
    }

    // Draw label
    if (showLabels && transformedVertices.isNotEmpty) {
      _drawLabel(canvas, detection, transformedVertices[0], color);
    }
  }

  void _drawBoundingBox(Canvas canvas, List<Offset> vertices, Color color) {
    if (vertices.length < 4) return;

    // Tìm các điểm giới hạn của hình chữ nhật
    var minX = double.infinity;
    var minY = double.infinity;
    var maxX = -double.infinity;
    var maxY = -double.infinity;

    for (final vertex in vertices) {
      minX = minX < vertex.dx ? minX : vertex.dx;
      minY = minY < vertex.dy ? minY : vertex.dy;
      maxX = maxX > vertex.dx ? maxX : vertex.dx;
      maxY = maxY > vertex.dy ? maxY : vertex.dy;
    }

    // Tính toán tâm của hình chữ nhật
    final centerX = (minX + maxX) / 2;
    final centerY = (minY + maxY) / 2;

    // Vẽ hình tròn ở giữa
    final centerPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    canvas.drawCircle(Offset(centerX, centerY), 10, centerPaint);

    // Vẽ điểm tâm
    canvas.drawCircle(
      Offset(centerX, centerY),
      4,
      Paint()..color = color.withOpacity(0.8),
    );

    // Vẽ đường viền hình chữ nhật
    final path = Path()
      ..moveTo(minX, minY)
      ..lineTo(maxX, minY)
      ..lineTo(maxX, maxY)
      ..lineTo(minX, maxY)
      ..close();

    final strokePaint = Paint()
      ..color = color.withOpacity(1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round;
    canvas.drawPath(path, strokePaint);
  }

  void _drawLabel(
    Canvas canvas,
    DetectionResult detection,
    Offset position,
    Color color,
  ) {
    final confidence =
        showConfidence ? ' (${(detection.score * 100).toInt()}%)' : '';
    final labelText = detection.name;

    final textPainter = TextPainter(
      text: TextSpan(
        text: labelText,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              offset: Offset(1, 1),
              blurRadius: 3,
            ),
          ],
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    // Background
    final backgroundRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        position.dx - 8,
        position.dy - 30,
        textPainter.width + 16,
        26,
      ),
      const Radius.circular(6),
    );

    canvas.drawRRect(
      backgroundRect,
      Paint()..color = color.withOpacity(0.9),
    );

    canvas.drawRRect(
      backgroundRect,
      Paint()
        ..color = Colors.white.withOpacity(0.8)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );

    // Text
    textPainter.paint(
      canvas,
      Offset(position.dx, position.dy - 26),
    );
  }

  Color _getColorForIndex(int index) {
    final colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.cyan,
      Colors.pink,
      Colors.amber,
    ];
    return colors[index % colors.length];
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is! DetectionOverlayPainter ||
        oldDelegate.detections != detections ||
        oldDelegate.imageSize != imageSize ||
        oldDelegate.displaySize != displaySize;
  }
}
