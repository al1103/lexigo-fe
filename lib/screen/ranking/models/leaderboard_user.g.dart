// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeaderboardUserImpl _$$LeaderboardUserImplFromJson(
        Map<String, dynamic> json) =>
    _$LeaderboardUserImpl(
      id: (json['id'] as num?)?.toInt(),
      username: json['username'] as String?,
      fullName: json['full_name'] as String?,
      level: json['level'] as String?,
      totalPoints: (json['total_points'] as num?)?.toInt(),
      periodPoints: (json['period_points'] as num?)?.toInt(),
      weeklyPoints: (json['weekly_points'] as num?)?.toInt(),
      monthlyPoints: (json['monthly_points'] as num?)?.toInt(),
      streakDays: (json['streak_days'] as num?)?.toInt(),
      rank: json['rank'] as String?,
      isCurrentUser: json['is_current_user'] as bool?,
      weeklyQuizCompletions: (json['weekly_quiz_completions'] as num?)?.toInt(),
      monthlyQuizCompletions:
          (json['monthly_quiz_completions'] as num?)?.toInt(),
      weeklyLessonCompletions:
          (json['weekly_lesson_completions'] as num?)?.toInt(),
      monthlyLessonCompletions:
          (json['monthly_lesson_completions'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$LeaderboardUserImplToJson(
        _$LeaderboardUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'full_name': instance.fullName,
      'level': instance.level,
      'total_points': instance.totalPoints,
      'period_points': instance.periodPoints,
      'weekly_points': instance.weeklyPoints,
      'monthly_points': instance.monthlyPoints,
      'streak_days': instance.streakDays,
      'rank': instance.rank,
      'is_current_user': instance.isCurrentUser,
      'weekly_quiz_completions': instance.weeklyQuizCompletions,
      'monthly_quiz_completions': instance.monthlyQuizCompletions,
      'weekly_lesson_completions': instance.weeklyLessonCompletions,
      'monthly_lesson_completions': instance.monthlyLessonCompletions,
    };
