import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_result_model.freezed.dart';
part 'quiz_result_model.g.dart';

@freezed
class QuizResult with _$QuizResult {
  const factory QuizResult({
    required int quizId,
    required int userId,
    required List<QuizAnswer> answers,
    required int totalScore,
    required int maxScore,
    required double percentageScore,
    required bool isPassed,
    required int timeSpent, // in seconds
    required DateTime completedAt,
    String? sessionId,
  }) = _QuizResult;

  factory QuizResult.fromJson(Map<String, dynamic> json) =>
      _$QuizResultFromJson(json);
}

@freezed
class QuizAnswer with _$QuizAnswer {
  const factory QuizAnswer({
    required int questionId,
    required int selectedOptionId,
    required bool isCorrect,
    required int timeSpent, // in seconds
  }) = _QuizAnswer;

  factory QuizAnswer.fromJson(Map<String, dynamic> json) =>
      _$QuizAnswerFromJson(json);
}

@freezed
class QuizResultResponse with _$QuizResultResponse {
  const factory QuizResultResponse({
    required bool success,
    required String message,
    QuizResultSummary? summary,
    List<Achievement>? achievements,
    UserProgress? progress,
  }) = _QuizResultResponse;

  factory QuizResultResponse.fromJson(Map<String, dynamic> json) =>
      _$QuizResultResponseFromJson(json);
}

@freezed
class QuizResultSummary with _$QuizResultSummary {
  const factory QuizResultSummary({
    required int resultId,
    required int pointsEarned,
    required int streakDays,
    required int totalQuizzesCompleted,
    required String nextRecommendation,
  }) = _QuizResultSummary;

  factory QuizResultSummary.fromJson(Map<String, dynamic> json) =>
      _$QuizResultSummaryFromJson(json);
}

@freezed
class Achievement with _$Achievement {
  const factory Achievement({
    required int id,
    required String title,
    required String description,
    required String iconUrl,
    required DateTime unlockedAt,
  }) = _Achievement;

  factory Achievement.fromJson(Map<String, dynamic> json) =>
      _$AchievementFromJson(json);
}

@freezed
class UserProgress with _$UserProgress {
  const factory UserProgress({
    required int currentLevel,
    required int currentXP,
    required int xpToNextLevel,
    required double progressToNextLevel,
  }) = _UserProgress;

  factory UserProgress.fromJson(Map<String, dynamic> json) =>
      _$UserProgressFromJson(json);
}
