import 'dart:io';

import 'package:lexigo/screen/scan_objects/data/scan_object_repository_impl.dart';
import 'package:lexigo/screen/scan_objects/models/detection_result.dart';
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
    try {
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(() async {
        final repository = ref.read(scanObjectRepositoryProvider);
        return repository.getScanObjects(image);
      });
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);

      rethrow;
    }
  }
}
