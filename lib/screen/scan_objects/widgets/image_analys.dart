import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/screen/scan_objects/models/detection_result.dart';
import 'package:lexigo/screen/scan_objects/widgets/detection_overlay.dart';

class ImageAnalysis extends ConsumerStatefulWidget {
  const ImageAnalysis({
    required this.imagePath,
    required this.detections,
    this.showBoundingBoxes = true,
    this.showLabels = true,
    this.showConfidence = true,
    super.key,
  });

  final String imagePath;
  final List<DetectionResult> detections;
  final bool showBoundingBoxes;
  final bool showLabels;
  final bool showConfidence;

  @override
  ConsumerState<ImageAnalysis> createState() => _ImageAnalysisState();
}

class _ImageAnalysisState extends ConsumerState<ImageAnalysis> {
  ui.Image? _image;
  bool _imageLoaded = false;
  Size _imageSize = Size.zero;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    try {
      final imageFile = File(widget.imagePath);
      final imageBytes = await imageFile.readAsBytes();
      final codec = await ui.instantiateImageCodec(imageBytes);
      final frame = await codec.getNextFrame();

      setState(() {
        _image = frame.image;
        _imageSize = Size(
          frame.image.width.toDouble(),
          frame.image.height.toDouble(),
        );
        _imageLoaded = true;
      });

      debugPrint(
        '📷 Loaded cropped image: ${_imageSize.width} x ${_imageSize.height}',
      );
    } catch (e) {
      debugPrint('❌ Error loading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_imageLoaded || _image == null) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading image...'),
          ],
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final containerSize = Size(constraints.maxWidth, constraints.maxHeight);

        return Stack(
          children: [
            // Image background
            Positioned.fill(
              child: Image.file(
                File(widget.imagePath),
                fit: BoxFit.contain,
              ),
            ),

            // Detection overlay with clickable areas
            Positioned.fill(
              child: DetectionOverlay(
                detections: widget.detections,
                imageSize: _imageSize,
                displaySize: containerSize,
                showBoundingBoxes: widget.showBoundingBoxes,
                showLabels: widget.showLabels,
                showConfidence: widget.showConfidence,
                onDetectionTap: (detection) {
                  debugPrint('Tapped on: ${detection.name}');
                  // Handle tap event here
                },
              ),
            ),

            // Info panel
            // if (widget.detections.isNotEmpty)
            //   Positioned(
            //     top: 12,
            //     right: 12,
            //     child: _buildInfoPanel(),
            //   ),
          ],
        );
      },
    );
  }

  Widget _buildInfoPanel() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 180),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.85),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.visibility,
                  color: Colors.blue,
                  size: 14,
                ),
              ),
              const SizedBox(width: 6),
              const Text(
                'Detected',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...widget.detections.asMap().entries.map((entry) {
            final index = entry.key;
            final detection = entry.value;
            final color = _getColorForIndex(index);

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      detection.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${(detection.score * 100).toInt()}%',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
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
  void dispose() {
    _image?.dispose();
    super.dispose();
  }
}
