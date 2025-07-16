import 'dart:io';

import 'package:lexigo/core/infrastructure/datasource/remote/api_response.dart';
import 'package:lexigo/product/domain/vocabulary_model.dart';
import 'package:lexigo/screen/level_selection/model/lessons_model.dart';
import 'package:lexigo/screen/speaking/model/speaking_result.dart';

abstract class SpeakingRepository {
  Future<ApiResponse<SpeakingResult>> checkSpeaking(
    File audioFile,
    String referenceText,
    String wordId,
  );
  Future<ApiResponse<PayloadPageableDto<LessonsModel>>> getLevelVocabulary();
  Future<ApiResponse<PayloadPageableDto<VocabularyModel>>>
      getLevelVocabularyDetails(String level);
}
