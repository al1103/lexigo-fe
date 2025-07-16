import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

class SquareImageWidget extends StatefulWidget {
  const SquareImageWidget({
    required this.imagePath,
    this.size,
    super.key,
  });

  final String imagePath;
  final double? size;

  @override
  State<SquareImageWidget> createState() => _SquareImageWidgetState();
}

class _SquareImageWidgetState extends State<SquareImageWidget> {
  Uint8List? _correctedImageBytes;
  bool _imageLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadAndCorrectImage();
  }

  @override
  void didUpdateWidget(SquareImageWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.imagePath != widget.imagePath) {
      _loadAndCorrectImage();
    }
  }

  Future<void> _loadAndCorrectImage() async {
    try {
      final imageFile = File(widget.imagePath);
      final imageBytes = await imageFile.readAsBytes();

      // Decode and process the image
      var decodedImage = img.decodeImage(imageBytes);
      if (decodedImage != null) {
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

        setState(() {
          _correctedImageBytes = correctedBytes;
          _imageLoaded = true;
        });
      }
    } catch (e) {
      await _loadImageFallback();
    }
  }

  Future<void> _loadImageFallback() async {
    try {
      final imageFile = File(widget.imagePath);
      final imageBytes = await imageFile.readAsBytes();

      setState(() {
        _correctedImageBytes = imageBytes;
        _imageLoaded = true;
      });

      debugPrint('📷 Square image loaded (fallback)');
    } catch (e) {
      debugPrint('❌ Error loading square image (fallback): $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_imageLoaded || _correctedImageBytes == null) {
      return Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      );
    }

    final displaySize = widget.size ?? MediaQuery.of(context).size.width;

    return Container(
      width: displaySize,
      height: displaySize,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.memory(
        _correctedImageBytes!,
        fit: BoxFit.cover,
        width: displaySize,
        height: displaySize,
      ),
    );
  }
}
