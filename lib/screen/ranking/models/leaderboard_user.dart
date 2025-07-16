import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaderboard_user.freezed.dart';
part 'leaderboard_user.g.dart';

@freezed
class LeaderboardUser with _$LeaderboardUser {
  const factory LeaderboardUser({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'level') String? level,
    @JsonKey(name: 'total_points') int? totalPoints,
    @JsonKey(name: 'period_points') int? periodPoints,
    @JsonKey(name: 'weekly_points') int? weeklyPoints,
    @JsonKey(name: 'monthly_points') int? monthlyPoints,
    @JsonKey(name: 'streak_days') int? streakDays,
    @JsonKey(name: 'rank') String? rank,
    @JsonKey(name: 'is_current_user') bool? isCurrentUser,
    @JsonKey(name: 'weekly_quiz_completions') int? weeklyQuizCompletions,
    @JsonKey(name: 'monthly_quiz_completions') int? monthlyQuizCompletions,
    @JsonKey(name: 'weekly_lesson_completions') int? weeklyLessonCompletions,
    @JsonKey(name: 'monthly_lesson_completions') int? monthlyLessonCompletions,
  }) = _LeaderboardUser;

  factory LeaderboardUser.fromJson(Map<String, dynamic> json) =>
      _$LeaderboardUserFromJson(json);
}
