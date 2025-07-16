// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizResultImpl _$$QuizResultImplFromJson(Map<String, dynamic> json) =>
    _$QuizResultImpl(
      quizId: (json['quizId'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      answers: (json['answers'] as List<dynamic>)
          .map((e) => QuizAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalScore: (json['totalScore'] as num).toInt(),
      maxScore: (json['maxScore'] as num).toInt(),
      percentageScore: (json['percentageScore'] as num).toDouble(),
      isPassed: json['isPassed'] as bool,
      timeSpent: (json['timeSpent'] as num).toInt(),
      completedAt: DateTime.parse(json['completedAt'] as String),
      sessionId: json['sessionId'] as String?,
    );

Map<String, dynamic> _$$QuizResultImplToJson(_$QuizResultImpl instance) =>
    <String, dynamic>{
      'quizId': instance.quizId,
      'userId': instance.userId,
      'answers': instance.answers,
      'totalScore': instance.totalScore,
      'maxScore': instance.maxScore,
      'percentageScore': instance.percentageScore,
      'isPassed': instance.isPassed,
      'timeSpent': instance.timeSpent,
      'completedAt': instance.completedAt.toIso8601String(),
      'sessionId': instance.sessionId,
    };

_$QuizAnswerImpl _$$QuizAnswerImplFromJson(Map<String, dynamic> json) =>
    _$QuizAnswerImpl(
      questionId: (json['questionId'] as num).toInt(),
      selectedOptionId: (json['selectedOptionId'] as num).toInt(),
      isCorrect: json['isCorrect'] as bool,
      timeSpent: (json['timeSpent'] as num).toInt(),
    );

Map<String, dynamic> _$$QuizAnswerImplToJson(_$QuizAnswerImpl instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'selectedOptionId': instance.selectedOptionId,
      'isCorrect': instance.isCorrect,
      'timeSpent': instance.timeSpent,
    };

_$QuizResultResponseImpl _$$QuizResultResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$QuizResultResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      summary: json['summary'] == null
          ? null
          : QuizResultSummary.fromJson(json['summary'] as Map<String, dynamic>),
      achievements: (json['achievements'] as List<dynamic>?)
          ?.map((e) => Achievement.fromJson(e as Map<String, dynamic>))
          .toList(),
      progress: json['progress'] == null
          ? null
          : UserProgress.fromJson(json['progress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$QuizResultResponseImplToJson(
        _$QuizResultResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'summary': instance.summary,
      'achievements': instance.achievements,
      'progress': instance.progress,
    };

_$QuizResultSummaryImpl _$$QuizResultSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$QuizResultSummaryImpl(
      resultId: (json['resultId'] as num).toInt(),
      pointsEarned: (json['pointsEarned'] as num).toInt(),
      streakDays: (json['streakDays'] as num).toInt(),
      totalQuizzesCompleted: (json['totalQuizzesCompleted'] as num).toInt(),
      nextRecommendation: json['nextRecommendation'] as String,
    );

Map<String, dynamic> _$$QuizResultSummaryImplToJson(
        _$QuizResultSummaryImpl instance) =>
    <String, dynamic>{
      'resultId': instance.resultId,
      'pointsEarned': instance.pointsEarned,
      'streakDays': instance.streakDays,
      'totalQuizzesCompleted': instance.totalQuizzesCompleted,
      'nextRecommendation': instance.nextRecommendation,
    };

_$AchievementImpl _$$AchievementImplFromJson(Map<String, dynamic> json) =>
    _$AchievementImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      iconUrl: json['iconUrl'] as String,
      unlockedAt: DateTime.parse(json['unlockedAt'] as String),
    );

Map<String, dynamic> _$$AchievementImplToJson(_$AchievementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'iconUrl': instance.iconUrl,
      'unlockedAt': instance.unlockedAt.toIso8601String(),
    };

_$UserProgressImpl _$$UserProgressImplFromJson(Map<String, dynamic> json) =>
    _$UserProgressImpl(
      currentLevel: (json['currentLevel'] as num).toInt(),
      currentXP: (json['currentXP'] as num).toInt(),
      xpToNextLevel: (json['xpToNextLevel'] as num).toInt(),
      progressToNextLevel: (json['progressToNextLevel'] as num).toDouble(),
    );

Map<String, dynamic> _$$UserProgressImplToJson(_$UserProgressImpl instance) =>
    <String, dynamic>{
      'currentLevel': instance.currentLevel,
      'currentXP': instance.currentXP,
      'xpToNextLevel': instance.xpToNextLevel,
      'progressToNextLevel': instance.progressToNextLevel,
    };
