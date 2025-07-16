import 'package:lexigo/product/domain/lesson_model.dart';
import 'package:lexigo/product/domain/quiz_result_model.dart';

abstract class QuizRepository {
  Future<QuizResultResponse> submitQuizResult(QuizResult result);
  Future<Quiz> getQuiz(int quizId);
  Future<List<QuizResult>> getQuizResults(int quizId, int userId);
  Future<String> startQuizSession(int quizId, int userId);
}
