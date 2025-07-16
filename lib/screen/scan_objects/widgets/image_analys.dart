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
      }
    } catch (e) {
      debugPrint('❌ Error loading image: $e');
      await _loadImageFallback();
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
              ],
            ),
          ),
        );
      },
    );
  }

  // CHANGED: Navigate to WordDetailScreen instead of showing bottom sheet
  void _navigateToWordDetail(String word) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => WordDetailScreen(word: word),
      ),
    );
  }

  @override
  void dispose() {
    _image?.dispose();
    super.dispose();
  }
}
