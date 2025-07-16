// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoModelImpl _$$UserInfoModelImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoModelImpl(
      id: (json['id'] as num?)?.toInt(),
      avatarUrl: json['avatar_url'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      passwordHash: json['password_hash'] as String?,
      fullName: json['full_name'] as String?,
      level: json['level'] as String?,
      totalPoints: (json['total_points'] as num?)?.toInt(),
      streakDays: (json['streak_days'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      userId: (json['user_id'] as num?)?.toInt(),
      quizTotalSessions: (json['quiz_total_sessions'] as num?)?.toInt(),
      quizTotalQuestions: (json['quiz_total_questions'] as num?)?.toInt(),
      quizCorrectAnswers: (json['quiz_correct_answers'] as num?)?.toInt(),
      quizAverageScore: json['quiz_average_score'] as String?,
      quizBestScore: (json['quiz_best_score'] as num?)?.toInt(),
      quizStreakDays: (json['quiz_streak_days'] as num?)?.toInt(),
      quizLastSession: json['quiz_last_session'] == null
          ? null
          : DateTime.parse(json['quiz_last_session'] as String),
      speakingTotalSessions: (json['speaking_total_sessions'] as num?)?.toInt(),
      speakingTotalWords: (json['speaking_total_words'] as num?)?.toInt(),
      speakingAverageScore: json['speaking_average_score'] as String?,
      speakingBestScore: (json['speaking_best_score'] as num?)?.toInt(),
      speakingStreakDays: (json['speaking_streak_days'] as num?)?.toInt(),
      speakingLastSession: json['speaking_last_session'] == null
          ? null
          : DateTime.parse(json['speaking_last_session'] as String),
      totalStudyTime: (json['total_study_time'] as num?)?.toInt(),
      wordsMastered: (json['words_mastered'] as num?)?.toInt(),
      currentLevel: json['current_level'] as String?,
      lastUpdated: json['last_updated'] == null
          ? null
          : DateTime.parse(json['last_updated'] as String),
    );

Map<String, dynamic> _$$UserInfoModelImplToJson(_$UserInfoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar_url': instance.avatarUrl,
      'username': instance.username,
      'email': instance.email,
      'password_hash': instance.passwordHash,
      'full_name': instance.fullName,
      'level': instance.level,
      'total_points': instance.totalPoints,
      'streak_days': instance.streakDays,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'user_id': instance.userId,
      'quiz_total_sessions': instance.quizTotalSessions,
      'quiz_total_questions': instance.quizTotalQuestions,
      'quiz_correct_answers': instance.quizCorrectAnswers,
      'quiz_average_score': instance.quizAverageScore,
      'quiz_best_score': instance.quizBestScore,
      'quiz_streak_days': instance.quizStreakDays,
      'quiz_last_session': instance.quizLastSession?.toIso8601String(),
      'speaking_total_sessions': instance.speakingTotalSessions,
      'speaking_total_words': instance.speakingTotalWords,
      'speaking_average_score': instance.speakingAverageScore,
      'speaking_best_score': instance.speakingBestScore,
      'speaking_streak_days': instance.speakingStreakDays,
      'speaking_last_session': instance.speakingLastSession?.toIso8601String(),
      'total_study_time': instance.totalStudyTime,
      'words_mastered': instance.wordsMastered,
      'current_level': instance.currentLevel,
      'last_updated': instance.lastUpdated?.toIso8601String(),
    };
