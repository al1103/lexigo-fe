import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_service.dart';
import 'package:lexigo/injection/di.dart';
import 'package:lexigo/screen/scan_objects/models/detection_result.dart';
import 'package:lexigo/screen/scan_objects/models/scan_object_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scan_object_repository_impl.g.dart';

class ScanObjectRepositoryImpl implements ScanObjectRepository {
  const ScanObjectRepositoryImpl(this._apiService);
  final ApiService _apiService;

  @override
  Future<List<DetectionResult>> getScanObjects(
    File image,
  ) async {
    try {
      // Validate input
      if (!await image.exists()) {
        throw Exception('Image file does not exist');
      }

      // Check file size (max 10MB)
      final fileSize = await image.length();
      if (fileSize > 10 * 1024 * 1024) {
        throw Exception('Image file is too large (max 10MB)');
      }

      final response = await _apiService.analyzeImage(
        image,
      );

      // Handle different response structures
      if (response.data != null) {
        return response.data!;
      } else {
        return [];
      }
    } on Exception catch (e) {
      // Re-throw known exceptions
      rethrow;
    } catch (e) {
      // Wrap unknown errors
      throw Exception('Failed to analyze image: $e');
    }
  }
}

@Riverpod(keepAlive: true)
ScanObjectRepository scanObjectRepository(Ref ref) =>
    ScanObjectRepositoryImpl(ref.read(apiServiceProvider));
