import 'dart:io';

import 'package:lexigo/screen/scan_objects/data/scan_object_repository_impl.dart';
import 'package:lexigo/screen/scan_objects/models/detection_result.dart';
import 'package:lexigo/screen/scan_objects/utils/image_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scan_object_controller.g.dart';

@riverpod
class ScanObjectController extends _$ScanObjectController {
  @override
  FutureOr<List<DetectionResult>> build() {
    return [];
  }

  Future<void> analyzeImage(
    File image,
  ) async {
    File? squareImageFile;
    try {
      state = const AsyncValue.loading();

      // Create square image for analysis
      squareImageFile = await ImageUtils.createSquareImage(image.path);

      state = await AsyncValue.guard(() async {
        final repository = ref.read(scanObjectRepositoryProvider);
        return repository.getScanObjects(squareImageFile!);
      });
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      rethrow;
    } finally {
      // Clean up the temporary square image file
      if (squareImageFile != null && squareImageFile.path != image.path) {
        await ImageUtils.cleanupSquareImage(squareImageFile.path);
      }
    }
  }
}
