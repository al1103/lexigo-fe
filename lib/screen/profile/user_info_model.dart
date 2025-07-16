import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_model.freezed.dart';
part 'user_info_model.g.dart';

@freezed
class UserInfoModel with _$UserInfoModel {
  const factory UserInfoModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'password_hash') String? passwordHash,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'level') String? level,
    @JsonKey(name: 'total_points') int? totalPoints,
    @JsonKey(name: 'streak_days') int? streakDays,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'quiz_total_sessions') int? quizTotalSessions,
    @JsonKey(name: 'quiz_total_questions') int? quizTotalQuestions,
    @JsonKey(name: 'quiz_correct_answers') int? quizCorrectAnswers,
    @JsonKey(name: 'quiz_average_score') String? quizAverageScore,
    @JsonKey(name: 'quiz_best_score') int? quizBestScore,
    @JsonKey(name: 'quiz_streak_days') int? quizStreakDays,
    @JsonKey(name: 'quiz_last_session') DateTime? quizLastSession,
    @JsonKey(name: 'speaking_total_sessions') int? speakingTotalSessions,
    @JsonKey(name: 'speaking_total_words') int? speakingTotalWords,
    @JsonKey(name: 'speaking_average_score') String? speakingAverageScore,
    @JsonKey(name: 'speaking_best_score') int? speakingBestScore,
    @JsonKey(name: 'speaking_streak_days') int? speakingStreakDays,
    @JsonKey(name: 'speaking_last_session') DateTime? speakingLastSession,
    @JsonKey(name: 'total_study_time') int? totalStudyTime,
    @JsonKey(name: 'words_mastered') int? wordsMastered,
    @JsonKey(name: 'current_level') String? currentLevel,
    @JsonKey(name: 'last_updated') DateTime? lastUpdated,
  }) = _UserInfoModel;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);
}
