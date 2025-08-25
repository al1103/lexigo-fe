import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/auth/domain/login_response.dart';
import 'package:lexigo/auth/domain/sign_up_request.dart';
import 'package:lexigo/auth/infrastructure/token_service.dart';
import 'package:lexigo/bookmarks/domain/entities/bookmark.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_client.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_end_point.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_response.dart';
import 'package:lexigo/env/env.dart';
import 'package:lexigo/product/domain/vocabulary_model.dart';
import 'package:lexigo/screen/grammar/model/grammar_model.dart';
import 'package:lexigo/screen/home/model/quotes_model.dart';
import 'package:lexigo/screen/level_selection/model/lessons_model.dart';
import 'package:lexigo/screen/profile/user_info_model.dart';
import 'package:lexigo/screen/ranking/models/leaderboard_user.dart';
import 'package:lexigo/screen/scan_objects/models/detection_result.dart';
import 'package:lexigo/screen/scan_objects/models/smart_word_model.dart';
import 'package:lexigo/screen/speaking/model/speaking_result.dart';
import 'package:lexigo/screen/word_learning/model/lessons_detail.dart';
import 'package:lexigo/screen/word_learning/word_model.dart';

class ApiService {
  ApiService(this.ref) {
    _dio = dio.Dio(_baseOptions);

    // Add auth interceptor
    _dio.interceptors.add(
      dio.InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (options.path != ApiEndPoint.login) {
            final tokenService = ref.read(tokenServiceProvider);
            final token = await tokenService.getToken();
            if (token != null) {
              options.headers['Authorization'] = 'Bearer $token';
            }
          }
          handler.next(options);
        },
      ),
    );

    // Add detailed logging
    _dio.interceptors.add(
      dio.LogInterceptor(
        requestBody: true,
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
    },
  );
  Future<ApiResponse<LoginResponse>> login(
    String email,
    String password,
  ) async {
    final response = await _client.login(email, password);
    return response;
  }

  Future<ApiResponse<void>> forgotPassword(String email) async {
    final response = await _client.forgotPassword(email);
    return response;
  }

  Future<ApiResponse<void>> verifyOtp(String email, String otp) async {
    final response = await _client.verifyOtp(email, otp);
    return response;
  }

  Future<ApiResponse<void>> resetPassword(
    String email,
    String newPassword,
  ) async {
    final response = await _client.resetPassword(email, newPassword);
    return response;
  }

  Future<SignUpResponse> register(
    String username,
    String email,
    String password,
    String fullName,
  ) async {
    final response =
        await _client.register(username, email, password, fullName);
    return response;
  }

  Future<SignUpResponse> verifyRegistration(
    String email,
    String code,
  ) async {
    final response = await _client.verifyRegistration(email, code);
    return response;
  }

  Future<ApiResponse<List<DetectionResult>>> analyzeImage(File image) async {
    final response = await _client.analyzeImage(image);
    return response;
  }

  Future<ApiResponse<SpeakingResult>> checkSpeaking(
    File audioFile,
    String referenceText,
    String wordId,
  ) async {
    final response =
        await _client.checkSpeaking(audioFile, referenceText, wordId);

    return response;
  }

  Future<ApiResponse<PayloadPageableDto<LessonsModel>>>
      getLevelVocabulary() async {
    return _client.getLevelVocabulary();
  }

  Future<ApiResponse<PayloadPageableDto<VocabularyModel>>>
      getLevelVocabularyDetails(
    String level, {
    int? limit = 10,
  }) async {
    return _client.getLevelVocabularyDetails(level, limit);
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

  Future<ApiResponse<void>> bookmarkWord({
    required int wordId,
    String? notes,
  }) async {
    return _client.bookmarkWord(wordId, notes);
  }

  Future<ApiResponse<PayloadPageableDto<QuizBookmark>>> getBookmarks({
    int page = 1,
    int limit = 10,
    String? search,
  }) async {
    return _client.getBookmark(page: page, limit: limit, search: search);
  }

  Future<ApiResponse<UserInfoModel>> getUserProfile() async {
    return _client.getUserProfile();
  }

  Future<ApiResponse<void>> updateUserProfile({
    String? fullName,
    String? avatarUrl,
    String? username, // Add username if your model supports it
  }) async {
    return _client.updateUserProfile(
      fullName ?? '',
      avatarUrl ?? '',
      username ?? '',
    );
  }

  // Ranking/Leaderboard methods
  Future<ApiResponse<PayloadPageableDto<LeaderboardUser>>>
      getGlobalLeaderboard() async {
    return _client.getGlobalLeaderboard();
  }

  Future<ApiResponse<PayloadPageableDto<LeaderboardUser>>>
      getWeeklyLeaderboard() async {
    return _client.getWeeklyLeaderboard();
  }

  Future<ApiResponse<PayloadPageableDto<LeaderboardUser>>>
      getMonthlyLeaderboard() async {
    return _client.getMonthlyLeaderboard();
  }

  Future<ApiResponse<dynamic>> getMyAllRankings() async {
    return _client.getMyAllRankings();
  }

  // Quotes methods
  Future<ApiResponse<QuotesModel>> getDailyQuotes() async {
    return _client.getDailyQuotes();
  }

  Future<ApiResponse<void>> submitSpeakingResult() async {
    return _client.submitSpeakingResult();
  }

  Future<ApiResponse<void>> deleteBookmark(int bookmarkId) async {
    final response = await _dio.delete<Map<String, dynamic>>(
      Env.instance.apiUrl + ApiEndPoint.bookmark,
      queryParameters: {'id': bookmarkId},
    );
    return ApiResponse<void>.fromJson(response.data!, (_) {});
  }

  Future<List<String>> getAvatarList() async {
    final response = await _dio.get<Map<String, dynamic>>('/users/avatars');
    final data = response.data;
    if (data != null && data['avatars'] is List) {
      return List<String>.from(
        (data['avatars'] as List).map((e) => e.toString()),
      );
    }
    throw Exception('Invalid avatar list response');
  }

  Future<String> uploadAvatar(File imageFile) async {
    try {
      final formData = dio.FormData.fromMap({
        'avatar': await dio.MultipartFile.fromFile(
          imageFile.path,
          filename: 'avatar.jpg',
        ),
      });

      final response = await _dio.post<Map<String, dynamic>>(
        Env.instance.apiUrl + ApiEndPoint.uploadAvatar,
        data: formData,
      );

      final data = response.data;
      if (data != null && data['avatar_url'] != null) {
        return data['avatar_url'].toString();
      }
      throw Exception('Invalid upload response');
    } catch (e) {
      throw Exception('Failed to upload avatar: $e');
    }
  }

  // Grammar methods
  Future<ApiResponse<GrammarResponse>> getAllGrammarArticles({
    required int page,
    required int limit,
    String? difficulty,
    String? category,
    String? search,
  }) async {
    return _client.getAllGrammarArticles(
      page,
      limit,
      difficulty,
      category,
      search,
    );
  }

  Future<ApiResponse<List<GrammarCategory>>> getGrammarCategories() async {
    return _client.getGrammarCategories();
  }

  Future<ApiResponse<List<GrammarModel>>> getPopularGrammarArticles({
    required int limit,
  }) async {
    return _client.getPopularGrammarArticles(limit);
  }

  Future<ApiResponse<GrammarResponse>> searchGrammarArticles({
    required String keyword,
    required int page,
    required int limit,
  }) async {
    return _client.searchGrammarArticles(keyword, page, limit);
  }

  Future<ApiResponse<GrammarResponse>> getGrammarArticlesByCategory({
    required String category,
    required int page,
    required int limit,
  }) async {
    return _client.getGrammarArticlesByCategory(category, page, limit);
  }

  Future<ApiResponse<GrammarResponse>> getGrammarArticlesByDifficulty({
    required String difficulty,
    required int page,
    required int limit,
  }) async {
    return _client.getGrammarArticlesByDifficulty(difficulty, page, limit);
  }

  Future<ApiResponse<GrammarModel>> getGrammarArticleById({
    required int id,
  }) async {
    return _client.getGrammarArticleById(id);
  }
}

// Provider
final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService(ref);
});
