import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image/image.dart' as img;
import 'package:lexigo/screen/scan_objects/models/detection_result.dart';
import 'package:lexigo/screen/scan_objects/screens/word_detail_screen.dart';
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
  Uint8List? _correctedImageBytes;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  @override
  void didUpdateWidget(ImageAnalysis oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.imagePath != widget.imagePath) {
      _loadImage();
    }
  }

  Future<void> _loadImage() async {
    try {
      final imageFile = File(widget.imagePath);
      final imageBytes = await imageFile.readAsBytes();

      // Decode and process the image
      var decodedImage = img.decodeImage(imageBytes);
      if (decodedImage != null) {
        // Apply orientation correction first
        decodedImage = img.bakeOrientation(decodedImage);

        // Crop to square
        final minDimension = decodedImage.width < decodedImage.height
            ? decodedImage.width
            : decodedImage.height;

        final x = (decodedImage.width - minDimension) ~/ 2;
        final y = (decodedImage.height - minDimension) ~/ 2;

        decodedImage = img.copyCrop(
          decodedImage,
          x: x,
          y: y,
          width: minDimension,
          height: minDimension,
        );

        final correctedBytes = img.encodeJpg(decodedImage);

        final codec = await ui.instantiateImageCodec(correctedBytes);
        final frame = await codec.getNextFrame();

        setState(() {
          _image = frame.image;
          _imageSize = Size(
            frame.image.width.toDouble(),
            frame.image.height.toDouble(),
          );
          _correctedImageBytes = correctedBytes;
          _imageLoaded = true;
        });

        debugPrint(
          '📷 Loaded and cropped square image: ${_imageSize.width} x ${_imageSize.height}',
        );
      }
    } catch (e) {
      debugPrint('❌ Error loading image: $e');
      _loadImageFallback();
    }
  }

  Future<void> _loadImageFallback() async {
    try {
      final imageFile = File(widget.imagePath);
      final imageBytes = await imageFile.readAsBytes();

      // Try to crop to square even in fallback
      var decodedImage = img.decodeImage(imageBytes);
      if (decodedImage != null) {
        // Crop to square
        final minDimension = decodedImage.width < decodedImage.height
            ? decodedImage.width
            : decodedImage.height;

        final x = (decodedImage.width - minDimension) ~/ 2;
        final y = (decodedImage.height - minDimension) ~/ 2;

        decodedImage = img.copyCrop(
          decodedImage,
          x: x,
          y: y,
          width: minDimension,
          height: minDimension,
        );

        final croppedBytes = img.encodeJpg(decodedImage);
        final codec = await ui.instantiateImageCodec(croppedBytes);
        final frame = await codec.getNextFrame();

        setState(() {
          _image = frame.image;
          _imageSize = Size(
            frame.image.width.toDouble(),
            frame.image.height.toDouble(),
          );
          _correctedImageBytes = croppedBytes;
          _imageLoaded = true;
        });

        debugPrint(
          '📷 Loaded image (fallback with cropping): ${_imageSize.width} x ${_imageSize.height}',
        );
      } else {
        // Last resort - use original
        final codec = await ui.instantiateImageCodec(imageBytes);
        final frame = await codec.getNextFrame();
        setState(() {
          _image = frame.image;
          _imageSize = Size(
            frame.image.width.toDouble(),
            frame.image.height.toDouble(),
          );
          _correctedImageBytes = imageBytes;
          _imageLoaded = true;
        });

        debugPrint(
          '📷 Loaded image (fallback original): ${_imageSize.width} x ${_imageSize.height}',
        );
      }
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
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
            SizedBox(height: 16),
            Text(
              'Loading image...',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final squareSize = screenWidth;
        final displaySize = Size(squareSize, squareSize);

        return Center(
          child: Container(
            width: squareSize,
            height: squareSize,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                // Image background
                Positioned.fill(
                  child: SizedBox(
                    width: squareSize,
                    height: squareSize,
                    child: _correctedImageBytes != null
                        ? Image.memory(
                            _correctedImageBytes!,
                            fit: BoxFit.cover,
                            width: squareSize,
                            height: squareSize,
                          )
                        : Image.file(
                            File(widget.imagePath),
                            fit: BoxFit.cover,
                            width: squareSize,
                            height: squareSize,
                          ),
                  ),
                ),

                // Detection overlay with clickable areas
                Positioned.fill(
                  child: DetectionOverlay(
                    detections: widget.detections,
                    imageSize: _imageSize,
                    displaySize: displaySize,
                    showBoundingBoxes: widget.showBoundingBoxes,
                    showLabels: widget.showLabels,
                    showConfidence: widget.showConfidence,
                    onDetectionTap: (detection) {
                      debugPrint('Tapped on: ${detection.name}');
                      _navigateToWordDetail(detection.name);
                    },
                  ),
                ),

                // Info panel
                if (widget.detections.isNotEmpty)
                  Positioned(
                    top: 12,
                    right: 12,
                    child: _buildInfoPanel(),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  // CHANGED: Navigate to WordDetailScreen instead of showing bottom sheet
  void _navigateToWordDetail(String word) {
    print('Navigating to word detail for: $word');
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => WordDetailScreen(word: word),
      ),
    );
  }

  Widget _buildInfoPanel() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 180),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.85),
        borderRadius: BorderRadius.circular(12),
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
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFF007AFF).withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.visibility,
                  color: Color(0xFF007AFF),
                  size: 14,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Detected Words',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...widget.detections.asMap().entries.map((entry) {
            final index = entry.key;
            final detection = entry.value;
            final color = _getColorForIndex(index);

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: InkWell(
                // ADDED: Make info panel items clickable too
                onTap: () => _navigateToWordDetail(detection.name),
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
                    const SizedBox(width: 8),
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
