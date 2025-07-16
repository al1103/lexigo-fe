// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) {
  return _UserInfoModel.fromJson(json);
}

/// @nodoc
mixin _$UserInfoModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'password_hash')
  String? get passwordHash => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'level')
  String? get level => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_points')
  int? get totalPoints => throw _privateConstructorUsedError;
  @JsonKey(name: 'streak_days')
  int? get streakDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'quiz_total_sessions')
  int? get quizTotalSessions => throw _privateConstructorUsedError;
  @JsonKey(name: 'quiz_total_questions')
  int? get quizTotalQuestions => throw _privateConstructorUsedError;
  @JsonKey(name: 'quiz_correct_answers')
  int? get quizCorrectAnswers => throw _privateConstructorUsedError;
  @JsonKey(name: 'quiz_average_score')
  String? get quizAverageScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'quiz_best_score')
  int? get quizBestScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'quiz_streak_days')
  int? get quizStreakDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'quiz_last_session')
  DateTime? get quizLastSession => throw _privateConstructorUsedError;
  @JsonKey(name: 'speaking_total_sessions')
  int? get speakingTotalSessions => throw _privateConstructorUsedError;
  @JsonKey(name: 'speaking_total_words')
  int? get speakingTotalWords => throw _privateConstructorUsedError;
  @JsonKey(name: 'speaking_average_score')
  String? get speakingAverageScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'speaking_best_score')
  int? get speakingBestScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'speaking_streak_days')
  int? get speakingStreakDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'speaking_last_session')
  DateTime? get speakingLastSession => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_study_time')
  int? get totalStudyTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'words_mastered')
  int? get wordsMastered => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_level')
  String? get currentLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_updated')
  DateTime? get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this UserInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserInfoModelCopyWith<UserInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoModelCopyWith<$Res> {
  factory $UserInfoModelCopyWith(
          UserInfoModel value, $Res Function(UserInfoModel) then) =
      _$UserInfoModelCopyWithImpl<$Res, UserInfoModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
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
      @JsonKey(name: 'last_updated') DateTime? lastUpdated});
}

/// @nodoc
class _$UserInfoModelCopyWithImpl<$Res, $Val extends UserInfoModel>
    implements $UserInfoModelCopyWith<$Res> {
  _$UserInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? avatarUrl = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? passwordHash = freezed,
    Object? fullName = freezed,
    Object? level = freezed,
    Object? totalPoints = freezed,
    Object? streakDays = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? userId = freezed,
    Object? quizTotalSessions = freezed,
    Object? quizTotalQuestions = freezed,
    Object? quizCorrectAnswers = freezed,
    Object? quizAverageScore = freezed,
    Object? quizBestScore = freezed,
    Object? quizStreakDays = freezed,
    Object? quizLastSession = freezed,
    Object? speakingTotalSessions = freezed,
    Object? speakingTotalWords = freezed,
    Object? speakingAverageScore = freezed,
    Object? speakingBestScore = freezed,
    Object? speakingStreakDays = freezed,
    Object? speakingLastSession = freezed,
    Object? totalStudyTime = freezed,
    Object? wordsMastered = freezed,
    Object? currentLevel = freezed,
    Object? lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordHash: freezed == passwordHash
          ? _value.passwordHash
          : passwordHash // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPoints: freezed == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      streakDays: freezed == streakDays
          ? _value.streakDays
          : streakDays // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      quizTotalSessions: freezed == quizTotalSessions
          ? _value.quizTotalSessions
          : quizTotalSessions // ignore: cast_nullable_to_non_nullable
              as int?,
      quizTotalQuestions: freezed == quizTotalQuestions
          ? _value.quizTotalQuestions
          : quizTotalQuestions // ignore: cast_nullable_to_non_nullable
              as int?,
      quizCorrectAnswers: freezed == quizCorrectAnswers
          ? _value.quizCorrectAnswers
          : quizCorrectAnswers // ignore: cast_nullable_to_non_nullable
              as int?,
      quizAverageScore: freezed == quizAverageScore
          ? _value.quizAverageScore
          : quizAverageScore // ignore: cast_nullable_to_non_nullable
              as String?,
      quizBestScore: freezed == quizBestScore
          ? _value.quizBestScore
          : quizBestScore // ignore: cast_nullable_to_non_nullable
              as int?,
      quizStreakDays: freezed == quizStreakDays
          ? _value.quizStreakDays
          : quizStreakDays // ignore: cast_nullable_to_non_nullable
              as int?,
      quizLastSession: freezed == quizLastSession
          ? _value.quizLastSession
          : quizLastSession // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      speakingTotalSessions: freezed == speakingTotalSessions
          ? _value.speakingTotalSessions
          : speakingTotalSessions // ignore: cast_nullable_to_non_nullable
              as int?,
      speakingTotalWords: freezed == speakingTotalWords
          ? _value.speakingTotalWords
          : speakingTotalWords // ignore: cast_nullable_to_non_nullable
              as int?,
      speakingAverageScore: freezed == speakingAverageScore
          ? _value.speakingAverageScore
          : speakingAverageScore // ignore: cast_nullable_to_non_nullable
              as String?,
      speakingBestScore: freezed == speakingBestScore
          ? _value.speakingBestScore
          : speakingBestScore // ignore: cast_nullable_to_non_nullable
              as int?,
      speakingStreakDays: freezed == speakingStreakDays
          ? _value.speakingStreakDays
          : speakingStreakDays // ignore: cast_nullable_to_non_nullable
              as int?,
      speakingLastSession: freezed == speakingLastSession
          ? _value.speakingLastSession
          : speakingLastSession // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalStudyTime: freezed == totalStudyTime
          ? _value.totalStudyTime
          : totalStudyTime // ignore: cast_nullable_to_non_nullable
              as int?,
      wordsMastered: freezed == wordsMastered
          ? _value.wordsMastered
          : wordsMastered // ignore: cast_nullable_to_non_nullable
              as int?,
      currentLevel: freezed == currentLevel
          ? _value.currentLevel
          : currentLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserInfoModelImplCopyWith<$Res>
    implements $UserInfoModelCopyWith<$Res> {
  factory _$$UserInfoModelImplCopyWith(
          _$UserInfoModelImpl value, $Res Function(_$UserInfoModelImpl) then) =
      __$$UserInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
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
      @JsonKey(name: 'last_updated') DateTime? lastUpdated});
}

/// @nodoc
class __$$UserInfoModelImplCopyWithImpl<$Res>
    extends _$UserInfoModelCopyWithImpl<$Res, _$UserInfoModelImpl>
    implements _$$UserInfoModelImplCopyWith<$Res> {
  __$$UserInfoModelImplCopyWithImpl(
      _$UserInfoModelImpl _value, $Res Function(_$UserInfoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? avatarUrl = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? passwordHash = freezed,
    Object? fullName = freezed,
    Object? level = freezed,
    Object? totalPoints = freezed,
    Object? streakDays = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? userId = freezed,
    Object? quizTotalSessions = freezed,
    Object? quizTotalQuestions = freezed,
    Object? quizCorrectAnswers = freezed,
    Object? quizAverageScore = freezed,
    Object? quizBestScore = freezed,
    Object? quizStreakDays = freezed,
    Object? quizLastSession = freezed,
    Object? speakingTotalSessions = freezed,
    Object? speakingTotalWords = freezed,
    Object? speakingAverageScore = freezed,
    Object? speakingBestScore = freezed,
    Object? speakingStreakDays = freezed,
    Object? speakingLastSession = freezed,
    Object? totalStudyTime = freezed,
    Object? wordsMastered = freezed,
    Object? currentLevel = freezed,
    Object? lastUpdated = freezed,
  }) {
    return _then(_$UserInfoModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordHash: freezed == passwordHash
          ? _value.passwordHash
          : passwordHash // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPoints: freezed == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      streakDays: freezed == streakDays
          ? _value.streakDays
          : streakDays // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      quizTotalSessions: freezed == quizTotalSessions
          ? _value.quizTotalSessions
          : quizTotalSessions // ignore: cast_nullable_to_non_nullable
              as int?,
      quizTotalQuestions: freezed == quizTotalQuestions
          ? _value.quizTotalQuestions
          : quizTotalQuestions // ignore: cast_nullable_to_non_nullable
              as int?,
      quizCorrectAnswers: freezed == quizCorrectAnswers
          ? _value.quizCorrectAnswers
          : quizCorrectAnswers // ignore: cast_nullable_to_non_nullable
              as int?,
      quizAverageScore: freezed == quizAverageScore
          ? _value.quizAverageScore
          : quizAverageScore // ignore: cast_nullable_to_non_nullable
              as String?,
      quizBestScore: freezed == quizBestScore
          ? _value.quizBestScore
          : quizBestScore // ignore: cast_nullable_to_non_nullable
              as int?,
      quizStreakDays: freezed == quizStreakDays
          ? _value.quizStreakDays
          : quizStreakDays // ignore: cast_nullable_to_non_nullable
              as int?,
      quizLastSession: freezed == quizLastSession
          ? _value.quizLastSession
          : quizLastSession // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      speakingTotalSessions: freezed == speakingTotalSessions
          ? _value.speakingTotalSessions
          : speakingTotalSessions // ignore: cast_nullable_to_non_nullable
              as int?,
      speakingTotalWords: freezed == speakingTotalWords
          ? _value.speakingTotalWords
          : speakingTotalWords // ignore: cast_nullable_to_non_nullable
              as int?,
      speakingAverageScore: freezed == speakingAverageScore
          ? _value.speakingAverageScore
          : speakingAverageScore // ignore: cast_nullable_to_non_nullable
              as String?,
      speakingBestScore: freezed == speakingBestScore
          ? _value.speakingBestScore
          : speakingBestScore // ignore: cast_nullable_to_non_nullable
              as int?,
      speakingStreakDays: freezed == speakingStreakDays
          ? _value.speakingStreakDays
          : speakingStreakDays // ignore: cast_nullable_to_non_nullable
              as int?,
      speakingLastSession: freezed == speakingLastSession
          ? _value.speakingLastSession
          : speakingLastSession // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalStudyTime: freezed == totalStudyTime
          ? _value.totalStudyTime
          : totalStudyTime // ignore: cast_nullable_to_non_nullable
              as int?,
      wordsMastered: freezed == wordsMastered
          ? _value.wordsMastered
          : wordsMastered // ignore: cast_nullable_to_non_nullable
              as int?,
      currentLevel: freezed == currentLevel
          ? _value.currentLevel
          : currentLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInfoModelImpl implements _UserInfoModel {
  const _$UserInfoModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'avatar_url') this.avatarUrl,
      @JsonKey(name: 'username') this.username,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'password_hash') this.passwordHash,
      @JsonKey(name: 'full_name') this.fullName,
      @JsonKey(name: 'level') this.level,
      @JsonKey(name: 'total_points') this.totalPoints,
      @JsonKey(name: 'streak_days') this.streakDays,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'quiz_total_sessions') this.quizTotalSessions,
      @JsonKey(name: 'quiz_total_questions') this.quizTotalQuestions,
      @JsonKey(name: 'quiz_correct_answers') this.quizCorrectAnswers,
      @JsonKey(name: 'quiz_average_score') this.quizAverageScore,
      @JsonKey(name: 'quiz_best_score') this.quizBestScore,
      @JsonKey(name: 'quiz_streak_days') this.quizStreakDays,
      @JsonKey(name: 'quiz_last_session') this.quizLastSession,
      @JsonKey(name: 'speaking_total_sessions') this.speakingTotalSessions,
      @JsonKey(name: 'speaking_total_words') this.speakingTotalWords,
      @JsonKey(name: 'speaking_average_score') this.speakingAverageScore,
      @JsonKey(name: 'speaking_best_score') this.speakingBestScore,
      @JsonKey(name: 'speaking_streak_days') this.speakingStreakDays,
      @JsonKey(name: 'speaking_last_session') this.speakingLastSession,
      @JsonKey(name: 'total_study_time') this.totalStudyTime,
      @JsonKey(name: 'words_mastered') this.wordsMastered,
      @JsonKey(name: 'current_level') this.currentLevel,
      @JsonKey(name: 'last_updated') this.lastUpdated});

  factory _$UserInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  @JsonKey(name: 'username')
  final String? username;
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'password_hash')
  final String? passwordHash;
  @override
  @JsonKey(name: 'full_name')
  final String? fullName;
  @override
  @JsonKey(name: 'level')
  final String? level;
  @override
  @JsonKey(name: 'total_points')
  final int? totalPoints;
  @override
  @JsonKey(name: 'streak_days')
  final int? streakDays;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'quiz_total_sessions')
  final int? quizTotalSessions;
  @override
  @JsonKey(name: 'quiz_total_questions')
  final int? quizTotalQuestions;
  @override
  @JsonKey(name: 'quiz_correct_answers')
  final int? quizCorrectAnswers;
  @override
  @JsonKey(name: 'quiz_average_score')
  final String? quizAverageScore;
  @override
  @JsonKey(name: 'quiz_best_score')
  final int? quizBestScore;
  @override
  @JsonKey(name: 'quiz_streak_days')
  final int? quizStreakDays;
  @override
  @JsonKey(name: 'quiz_last_session')
  final DateTime? quizLastSession;
  @override
  @JsonKey(name: 'speaking_total_sessions')
  final int? speakingTotalSessions;
  @override
  @JsonKey(name: 'speaking_total_words')
  final int? speakingTotalWords;
  @override
  @JsonKey(name: 'speaking_average_score')
  final String? speakingAverageScore;
  @override
  @JsonKey(name: 'speaking_best_score')
  final int? speakingBestScore;
  @override
  @JsonKey(name: 'speaking_streak_days')
  final int? speakingStreakDays;
  @override
  @JsonKey(name: 'speaking_last_session')
  final DateTime? speakingLastSession;
  @override
  @JsonKey(name: 'total_study_time')
  final int? totalStudyTime;
  @override
  @JsonKey(name: 'words_mastered')
  final int? wordsMastered;
  @override
  @JsonKey(name: 'current_level')
  final String? currentLevel;
  @override
  @JsonKey(name: 'last_updated')
  final DateTime? lastUpdated;

  @override
  String toString() {
    return 'UserInfoModel(id: $id, avatarUrl: $avatarUrl, username: $username, email: $email, passwordHash: $passwordHash, fullName: $fullName, level: $level, totalPoints: $totalPoints, streakDays: $streakDays, createdAt: $createdAt, updatedAt: $updatedAt, userId: $userId, quizTotalSessions: $quizTotalSessions, quizTotalQuestions: $quizTotalQuestions, quizCorrectAnswers: $quizCorrectAnswers, quizAverageScore: $quizAverageScore, quizBestScore: $quizBestScore, quizStreakDays: $quizStreakDays, quizLastSession: $quizLastSession, speakingTotalSessions: $speakingTotalSessions, speakingTotalWords: $speakingTotalWords, speakingAverageScore: $speakingAverageScore, speakingBestScore: $speakingBestScore, speakingStreakDays: $speakingStreakDays, speakingLastSession: $speakingLastSession, totalStudyTime: $totalStudyTime, wordsMastered: $wordsMastered, currentLevel: $currentLevel, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.passwordHash, passwordHash) ||
                other.passwordHash == passwordHash) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            (identical(other.streakDays, streakDays) ||
                other.streakDays == streakDays) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.quizTotalSessions, quizTotalSessions) ||
                other.quizTotalSessions == quizTotalSessions) &&
            (identical(other.quizTotalQuestions, quizTotalQuestions) ||
                other.quizTotalQuestions == quizTotalQuestions) &&
            (identical(other.quizCorrectAnswers, quizCorrectAnswers) ||
                other.quizCorrectAnswers == quizCorrectAnswers) &&
            (identical(other.quizAverageScore, quizAverageScore) ||
                other.quizAverageScore == quizAverageScore) &&
            (identical(other.quizBestScore, quizBestScore) ||
                other.quizBestScore == quizBestScore) &&
            (identical(other.quizStreakDays, quizStreakDays) ||
                other.quizStreakDays == quizStreakDays) &&
            (identical(other.quizLastSession, quizLastSession) ||
                other.quizLastSession == quizLastSession) &&
            (identical(other.speakingTotalSessions, speakingTotalSessions) ||
                other.speakingTotalSessions == speakingTotalSessions) &&
            (identical(other.speakingTotalWords, speakingTotalWords) ||
                other.speakingTotalWords == speakingTotalWords) &&
            (identical(other.speakingAverageScore, speakingAverageScore) ||
                other.speakingAverageScore == speakingAverageScore) &&
            (identical(other.speakingBestScore, speakingBestScore) ||
                other.speakingBestScore == speakingBestScore) &&
            (identical(other.speakingStreakDays, speakingStreakDays) ||
                other.speakingStreakDays == speakingStreakDays) &&
            (identical(other.speakingLastSession, speakingLastSession) ||
                other.speakingLastSession == speakingLastSession) &&
            (identical(other.totalStudyTime, totalStudyTime) ||
                other.totalStudyTime == totalStudyTime) &&
            (identical(other.wordsMastered, wordsMastered) ||
                other.wordsMastered == wordsMastered) &&
            (identical(other.currentLevel, currentLevel) ||
                other.currentLevel == currentLevel) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        avatarUrl,
        username,
        email,
        passwordHash,
        fullName,
        level,
        totalPoints,
        streakDays,
        createdAt,
        updatedAt,
        userId,
        quizTotalSessions,
        quizTotalQuestions,
        quizCorrectAnswers,
        quizAverageScore,
        quizBestScore,
        quizStreakDays,
        quizLastSession,
        speakingTotalSessions,
        speakingTotalWords,
        speakingAverageScore,
        speakingBestScore,
        speakingStreakDays,
        speakingLastSession,
        totalStudyTime,
        wordsMastered,
        currentLevel,
        lastUpdated
      ]);

  /// Create a copy of UserInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoModelImplCopyWith<_$UserInfoModelImpl> get copyWith =>
      __$$UserInfoModelImplCopyWithImpl<_$UserInfoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoModelImplToJson(
      this,
    );
  }
}

abstract class _UserInfoModel implements UserInfoModel {
  const factory _UserInfoModel(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'avatar_url') final String? avatarUrl,
          @JsonKey(name: 'username') final String? username,
          @JsonKey(name: 'email') final String? email,
          @JsonKey(name: 'password_hash') final String? passwordHash,
          @JsonKey(name: 'full_name') final String? fullName,
          @JsonKey(name: 'level') final String? level,
          @JsonKey(name: 'total_points') final int? totalPoints,
          @JsonKey(name: 'streak_days') final int? streakDays,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt,
          @JsonKey(name: 'user_id') final int? userId,
          @JsonKey(name: 'quiz_total_sessions') final int? quizTotalSessions,
          @JsonKey(name: 'quiz_total_questions') final int? quizTotalQuestions,
          @JsonKey(name: 'quiz_correct_answers') final int? quizCorrectAnswers,
          @JsonKey(name: 'quiz_average_score') final String? quizAverageScore,
          @JsonKey(name: 'quiz_best_score') final int? quizBestScore,
          @JsonKey(name: 'quiz_streak_days') final int? quizStreakDays,
          @JsonKey(name: 'quiz_last_session') final DateTime? quizLastSession,
          @JsonKey(name: 'speaking_total_sessions')
          final int? speakingTotalSessions,
          @JsonKey(name: 'speaking_total_words') final int? speakingTotalWords,
          @JsonKey(name: 'speaking_average_score')
          final String? speakingAverageScore,
          @JsonKey(name: 'speaking_best_score') final int? speakingBestScore,
          @JsonKey(name: 'speaking_streak_days') final int? speakingStreakDays,
          @JsonKey(name: 'speaking_last_session')
          final DateTime? speakingLastSession,
          @JsonKey(name: 'total_study_time') final int? totalStudyTime,
          @JsonKey(name: 'words_mastered') final int? wordsMastered,
          @JsonKey(name: 'current_level') final String? currentLevel,
          @JsonKey(name: 'last_updated') final DateTime? lastUpdated}) =
      _$UserInfoModelImpl;

  factory _UserInfoModel.fromJson(Map<String, dynamic> json) =
      _$UserInfoModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  @JsonKey(name: 'username')
  String? get username;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'password_hash')
  String? get passwordHash;
  @override
  @JsonKey(name: 'full_name')
  String? get fullName;
  @override
  @JsonKey(name: 'level')
  String? get level;
  @override
  @JsonKey(name: 'total_points')
  int? get totalPoints;
  @override
  @JsonKey(name: 'streak_days')
  int? get streakDays;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'quiz_total_sessions')
  int? get quizTotalSessions;
  @override
  @JsonKey(name: 'quiz_total_questions')
  int? get quizTotalQuestions;
  @override
  @JsonKey(name: 'quiz_correct_answers')
  int? get quizCorrectAnswers;
  @override
  @JsonKey(name: 'quiz_average_score')
  String? get quizAverageScore;
  @override
  @JsonKey(name: 'quiz_best_score')
  int? get quizBestScore;
  @override
  @JsonKey(name: 'quiz_streak_days')
  int? get quizStreakDays;
  @override
  @JsonKey(name: 'quiz_last_session')
  DateTime? get quizLastSession;
  @override
  @JsonKey(name: 'speaking_total_sessions')
  int? get speakingTotalSessions;
  @override
  @JsonKey(name: 'speaking_total_words')
  int? get speakingTotalWords;
  @override
  @JsonKey(name: 'speaking_average_score')
  String? get speakingAverageScore;
  @override
  @JsonKey(name: 'speaking_best_score')
  int? get speakingBestScore;
  @override
  @JsonKey(name: 'speaking_streak_days')
  int? get speakingStreakDays;
  @override
  @JsonKey(name: 'speaking_last_session')
  DateTime? get speakingLastSession;
  @override
  @JsonKey(name: 'total_study_time')
  int? get totalStudyTime;
  @override
  @JsonKey(name: 'words_mastered')
  int? get wordsMastered;
  @override
  @JsonKey(name: 'current_level')
  String? get currentLevel;
  @override
  @JsonKey(name: 'last_updated')
  DateTime? get lastUpdated;

  /// Create a copy of UserInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserInfoModelImplCopyWith<_$UserInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
