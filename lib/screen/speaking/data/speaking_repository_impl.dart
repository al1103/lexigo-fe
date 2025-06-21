import 'dart:io';

import 'package:lexigo/core/infrastructure/datasource/remote/api_response.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_service.dart';
import 'package:lexigo/injection/di.dart';
import 'package:lexigo/product/domain/vocabulary_model.dart';
import 'package:lexigo/screen/speaking/model/speaking_repository.dart';
import 'package:lexigo/screen/speaking/model/speaking_result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'speaking_repository_impl.g.dart';

@riverpod
SpeakingRepository speakingRepository(SpeakingRepositoryRef ref) {
  return SpeakingRepositoryImpl(ref.watch(apiServiceProvider));
}

class SpeakingRepositoryImpl implements SpeakingRepository {
  const SpeakingRepositoryImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<ApiResponse<SpeakingResult>> checkSpeaking(
    File audioFile,
    String referenceText,
  ) async {
    return _apiService.checkSpeaking(audioFile, referenceText);
  }

  @override
  Future<ApiResponse<PayloadPageableDto<VocabularyModel>>> getVocabulary(
    String? search,
    int? page,
  ) {
    final result = _apiService.getVocabulary(search, page);
    return result;
  }
}
