import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_client.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_response.dart';
import 'package:lexigo/env/env.dart';
import 'package:lexigo/product/domain/vocabulary_model.dart';
import 'package:lexigo/screen/level_selection/model/lessons_model.dart';
import 'package:lexigo/screen/scan_objects/models/detection_result.dart';
import 'package:lexigo/screen/scan_objects/models/smart_word_model.dart';
import 'package:lexigo/screen/speaking/model/speaking_result.dart';
import 'package:lexigo/screen/word_learning/model/lessons_detail.dart';
import 'package:lexigo/screen/word_learning/word_model.dart';

class ApiService {
  ApiService(this.ref) {
    _dio = dio.Dio(_baseOptions);

    // Add detailed logging
    _dio.interceptors.add(
      dio.LogInterceptor(
        responseBody: true,
        logPrint: (obj) => debugPrint('🌐 API: $obj'),
      ),
    );

    _client = ApiClient(_dio, baseUrl: Env.instance.apiUrl);
  }

  final Ref ref;
  late final dio.Dio _dio;
  late final ApiClient _client;

  final _baseOptions = dio.BaseOptions(
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
    headers: {
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsInVzZXJuYW1lIjoiam9obl9kb2UiLCJlbWFpbCI6ImpvaG5AZXhhbXBsZS5jb20iLCJpYXQiOjE3NTA1ODMyNDgsImV4cCI6MTc1MTE4ODA0OH0.cDDP6FqwnVpMfWGNUHQw3Phk0KvHJpxIm_qpPEYCwrQ',
    },
  );

  Future<ApiResponse<List<DetectionResult>>> analyzeImage(File image) async {
    final response = await _client.analyzeImage(image);
    return response;
  }

  Future<ApiResponse<SpeakingResult>> checkSpeaking(
    File audioFile,
    String referenceText,
  ) async {
    final response = await _client.checkSpeaking(audioFile, referenceText);

    return response;
  }

  Future<ApiResponse<PayloadPageableDto<VocabularyModel>>> getVocabulary(
    String? search,
    int? page,
  ) async {
    return _client.getVocabulary(search, page);
  }

  Future<ApiResponse<String>> chatAI(
    String message, {
    bool? isReset = false,
  }) async {
    return _client.chatAI(message, isReset);
  }

  Future<ApiResponse<WordModel>> wordleaning(
    int? limit,
  ) async {
    return _client.getRandomWords(limit);
  }

  Future<ApiResponse<List<LessonsModel>>> getListLessons() async {
    return _client.getListLessons();
  }

  Future<ApiResponse<PayloadPageableDto<LessonsDetail>>> getLessonDetails(
    int id,
  ) async {
    return _client.getLessonDetails(id, 10);
  }

  Future<ApiResponse<SmartWord>> getWordDetails(String word) async {
    return _client.getWordDetails(word);
  }

  Future<ApiResponse<void>> submitAnswer({
    required int sessionId,
    required int questionId,
    required int selectedOptionId,
  }) async {
    return _client.submitAnswer(sessionId, questionId, selectedOptionId);
  }
}
