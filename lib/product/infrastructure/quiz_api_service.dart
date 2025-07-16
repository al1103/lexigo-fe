import 'package:dio/dio.dart';
import 'package:lexigo/product/domain/quiz_result_model.dart';
import 'package:retrofit/retrofit.dart';

part 'quiz_api_service.g.dart';

@RestApi()
abstract class QuizApiService {
  factory QuizApiService(Dio dio, {String baseUrl}) = _QuizApiService;

  @POST('/submit-result')
  Future<QuizResultResponse> submitQuizResult(
    @Body() QuizResult quizResult,
  );

  @GET('/quiz/{id}')
  Future<Map<String, dynamic>> getQuiz(@Path('id') int quizId);

  @GET('/quiz/{id}/results')
  Future<List<QuizResult>> getQuizResults(
    @Path('id') int quizId,
    @Query('userId') int userId,
  );

  @POST('/quiz/{id}/start')
  Future<Map<String, dynamic>> startQuizSession(
    @Path('id') int quizId,
    @Body() Map<String, dynamic> sessionData,
  );
}
