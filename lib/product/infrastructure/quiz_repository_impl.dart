import 'package:dio/dio.dart';
import 'package:lexigo/product/domain/lesson_model.dart';
import 'package:lexigo/product/domain/quiz_repository.dart';
import 'package:lexigo/product/domain/quiz_result_model.dart';
import 'package:lexigo/product/infrastructure/quiz_api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_repository_impl.g.dart';

@Riverpod(keepAlive: true)
QuizRepository quizRepository(QuizRepositoryRef ref) {
  final dio = Dio();
  // In a real app, you would get the base URL from environment or config
  final apiService = QuizApiService(dio, baseUrl: 'https://api.lexigo.com');
  return QuizRepositoryImpl(apiService);
}

class QuizRepositoryImpl implements QuizRepository {
  const QuizRepositoryImpl(this._apiService);

  final QuizApiService _apiService;

  @override
  Future<QuizResultResponse> submitQuizResult(QuizResult result) async {
    try {
      return await _apiService.submitQuizResult(result);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<Quiz> getQuiz(int quizId) async {
    try {
      final response = await _apiService.getQuiz(quizId);
      return Quiz.fromJson(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<List<QuizResult>> getQuizResults(int quizId, int userId) async {
    try {
      return await _apiService.getQuizResults(quizId, userId);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<String> startQuizSession(int quizId, int userId) async {
    try {
      final response = await _apiService.startQuizSession(quizId, {
        'userId': userId,
        'startedAt': DateTime.now().toIso8601String(),
      });
      return response['sessionId'] as String;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Exception _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Exception(
          'Connection timeout. Please check your internet connection.',
        );
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final message = e.response?.data?['message'] ?? 'Server error';
        return Exception('Server error ($statusCode): $message');
      case DioExceptionType.cancel:
        return Exception('Request was cancelled.');
      case DioExceptionType.unknown:
        if (e.error.toString().contains('SocketException')) {
          return Exception('No internet connection.');
        }
        return Exception('An unexpected error occurred: ${e.message}');
      default:
        return Exception('An unexpected error occurred.');
    }
  }
}
