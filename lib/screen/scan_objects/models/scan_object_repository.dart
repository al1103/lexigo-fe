import 'dart:io';

import 'package:lexigo/screen/scan_objects/models/detection_result.dart';

abstract class ScanObjectRepository {
  Future<List<DetectionResult>> getScanObjects(File image);
}
