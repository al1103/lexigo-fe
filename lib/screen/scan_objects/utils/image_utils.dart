import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart' as path;

class ImageUtils {
  /// Creates a square image file from the original image
  /// Returns the path to the square image file
  static Future<File> createSquareImage(String originalImagePath) async {
    try {
      final originalFile = File(originalImagePath);
      final imageBytes = await originalFile.readAsBytes();

      // Decode and process the image
      var decodedImage = img.decodeImage(imageBytes);
      if (decodedImage == null) {
        throw Exception('Could not decode image');
      }

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

      // Encode to JPEG
      final squareImageBytes = img.encodeJpg(decodedImage);

      // Create a new file for the square image
      final directory = originalFile.parent;
      final originalName = path.basenameWithoutExtension(originalFile.path);
      final squareImagePath =
          path.join(directory.path, '${originalName}_square.jpg');

      final squareImageFile = File(squareImagePath);
      await squareImageFile.writeAsBytes(squareImageBytes);

      return squareImageFile;
    } catch (e) {
      debugPrint('❌ Error creating square image: $e');
      // Return original file as fallback
      return File(originalImagePath);
    }
  }

  /// Cleans up temporary square image files
  static Future<void> cleanupSquareImage(String squareImagePath) async {
    try {
      final file = File(squareImagePath);
      if (await file.exists()) {
        await file.delete();
        debugPrint('🧹 Cleaned up square image: $squareImagePath');
      }
    } catch (e) {
      debugPrint('❌ Error cleaning up square image: $e');
    }
  }
}
