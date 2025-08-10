import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lexigo/auth/infrastructure/token_service.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_end_point.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_service.dart';
import 'package:lexigo/env/env.dart';
import 'package:lexigo/screen/grammar/data/grammar_repository.dart';
import 'package:lexigo/screen/grammar/model/grammar_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grammar_repository_impl.g.dart';

class GrammarRepositoryImpl implements GrammarRepository {
  GrammarRepositoryImpl(this._apiService, this._dio);

  final ApiService _apiService;
  final Dio _dio;

  @override
  Future<GrammarResponse> getAllArticles({
    int page = 1,
    int limit = 10,
    String? difficulty,
    String? category,
    String? search,
  }) async {
    final response = await _apiService.getAllGrammarArticles(
      page: page,
      limit: limit,
      difficulty: difficulty,
      category: category,
      search: search,
    );

    return response.data ?? const GrammarResponse(items: []);
  }

  @override
  Future<List<GrammarCategory>> getCategories() async {
    final response = await _apiService.getGrammarCategories();
    return response.data ?? [];
  }

  @override
  Future<List<GrammarModel>> getPopularArticles({int limit = 5}) async {
    final response = await _apiService.getPopularGrammarArticles(limit: limit);
    return response.data ?? [];
  }

  @override
  Future<GrammarResponse> searchArticles({
    required String keyword,
    int page = 1,
    int limit = 10,
  }) async {
    final response = await _apiService.searchGrammarArticles(
      keyword: keyword,
      page: page,
      limit: limit,
    );

    return response.data ?? const GrammarResponse(items: []);
  }

  @override
  Future<GrammarResponse> getArticlesByCategory({
    required String category,
    int page = 1,
    int limit = 10,
  }) async {
    final response = await _apiService.getGrammarArticlesByCategory(
      category: category,
      page: page,
      limit: limit,
    );

    return response.data ?? const GrammarResponse(items: []);
  }

  @override
  Future<GrammarResponse> getArticlesByDifficulty({
    required String difficulty,
    int page = 1,
    int limit = 10,
  }) async {
    final response = await _apiService.getGrammarArticlesByDifficulty(
      difficulty: difficulty,
      page: page,
      limit: limit,
    );

    return response.data ?? const GrammarResponse(items: []);
  }

  @override
  Future<GrammarModel> getArticleById(int id) async {
    try {
      // Thử với API client bình thường trước
      final response = await _apiService.getGrammarArticleById(id: id);

      if (response.data != null) {
        return response.data!;
      }
    } catch (e) {
      // Nếu API client parsing fail, thử custom approach
      print('API client parsing failed, trying direct HTTP call: $e');
    }

    // Fallback: Sử dụng raw API call để handle nested structure
    try {
      final rawResponse = await _makeDirectApiCall(id);
      return rawResponse;
    } catch (e) {
      throw Exception('Không tìm thấy bài viết với ID: $id. Error: $e');
    }
  }

  Future<GrammarModel> _makeDirectApiCall(int id) async {
    // Tạo direct HTTP call để bypass API client parsing
    final response = await _dio.get<Map<String, dynamic>>('/grammar/$id');

    if (response.data != null &&
        response.data!['data'] != null &&
        response.data!['data']['article'] != null) {
      final articleData =
          response.data!['data']['article'] as Map<String, dynamic>;
      return GrammarModel.fromJson(articleData);
    }

    throw Exception('Invalid response structure');
  }

  @override
  Future<GrammarModel> getArticleDetails(int id) async {
    return getArticleById(id);
  }
}

@riverpod
GrammarRepository grammarRepository(GrammarRepositoryRef ref) {
  final apiService = ref.watch(apiServiceProvider);

  // Tạo Dio instance riêng cho custom calls với same config
  final dio = Dio();
  dio.options.baseUrl = Env.instance.apiUrl;
  dio.options.connectTimeout = const Duration(seconds: 30);
  dio.options.receiveTimeout = const Duration(seconds: 30);
  dio.options.headers = {'Accept': 'application/json'};

  // Thêm auth interceptor giống như ApiService
  dio.interceptors.add(
    InterceptorsWrapper(
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

  // Thêm logging
  dio.interceptors.add(
    LogInterceptor(
      responseBody: true,
      logPrint: (obj) => debugPrint('🌐 Grammar API: $obj'),
    ),
  );

  return GrammarRepositoryImpl(apiService, dio);
}
