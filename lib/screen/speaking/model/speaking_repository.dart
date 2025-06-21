import 'dart:io';

import 'package:lexigo/core/infrastructure/datasource/remote/api_response.dart';
import 'package:lexigo/product/domain/vocabulary_model.dart';
import 'package:lexigo/screen/speaking/model/speaking_result.dart';

abstract class SpeakingRepository {
  Future<ApiResponse<SpeakingResult>> checkSpeaking(
    File audioFile,
    String referenceText,
  );
  Future<ApiResponse<PayloadPageableDto<VocabularyModel>>> getVocabulary(
    String? search,
    int? page,
  );
}
