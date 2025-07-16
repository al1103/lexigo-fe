// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuizResult _$QuizResultFromJson(Map<String, dynamic> json) {
  return _QuizResult.fromJson(json);
}

/// @nodoc
mixin _$QuizResult {
  int get quizId => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  List<QuizAnswer> get answers => throw _privateConstructorUsedError;
  int get totalScore => throw _privateConstructorUsedError;
  int get maxScore => throw _privateConstructorUsedError;
  double get percentageScore => throw _privateConstructorUsedError;
  bool get isPassed => throw _privateConstructorUsedError;
  int get timeSpent => throw _privateConstructorUsedError; // in seconds
  DateTime get completedAt => throw _privateConstructorUsedError;
  String? get sessionId => throw _privateConstructorUsedError;

  /// Serializes this QuizResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizResultCopyWith<QuizResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizResultCopyWith<$Res> {
  factory $QuizResultCopyWith(
          QuizResult value, $Res Function(QuizResult) then) =
      _$QuizResultCopyWithImpl<$Res, QuizResult>;
  @useResult
  $Res call(
      {int quizId,
      int userId,
      List<QuizAnswer> answers,
      int totalScore,
      int maxScore,
      double percentageScore,
      bool isPassed,
      int timeSpent,
      DateTime completedAt,
      String? sessionId});
}

/// @nodoc
class _$QuizResultCopyWithImpl<$Res, $Val extends QuizResult>
    implements $QuizResultCopyWith<$Res> {
  _$QuizResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizId = null,
    Object? userId = null,
    Object? answers = null,
    Object? totalScore = null,
    Object? maxScore = null,
    Object? percentageScore = null,
    Object? isPassed = null,
    Object? timeSpent = null,
    Object? completedAt = null,
    Object? sessionId = freezed,
  }) {
    return _then(_value.copyWith(
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<QuizAnswer>,
      totalScore: null == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int,
      maxScore: null == maxScore
          ? _value.maxScore
          : maxScore // ignore: cast_nullable_to_non_nullable
              as int,
      percentageScore: null == percentageScore
          ? _value.percentageScore
          : percentageScore // ignore: cast_nullable_to_non_nullable
              as double,
      isPassed: null == isPassed
          ? _value.isPassed
          : isPassed // ignore: cast_nullable_to_non_nullable
              as bool,
      timeSpent: null == timeSpent
          ? _value.timeSpent
          : timeSpent // ignore: cast_nullable_to_non_nullable
              as int,
      completedAt: null == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizResultImplCopyWith<$Res>
    implements $QuizResultCopyWith<$Res> {
  factory _$$QuizResultImplCopyWith(
          _$QuizResultImpl value, $Res Function(_$QuizResultImpl) then) =
      __$$QuizResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int quizId,
      int userId,
      List<QuizAnswer> answers,
      int totalScore,
      int maxScore,
      double percentageScore,
      bool isPassed,
      int timeSpent,
      DateTime completedAt,
      String? sessionId});
}

/// @nodoc
class __$$QuizResultImplCopyWithImpl<$Res>
    extends _$QuizResultCopyWithImpl<$Res, _$QuizResultImpl>
    implements _$$QuizResultImplCopyWith<$Res> {
  __$$QuizResultImplCopyWithImpl(
      _$QuizResultImpl _value, $Res Function(_$QuizResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizId = null,
    Object? userId = null,
    Object? answers = null,
    Object? totalScore = null,
    Object? maxScore = null,
    Object? percentageScore = null,
    Object? isPassed = null,
    Object? timeSpent = null,
    Object? completedAt = null,
    Object? sessionId = freezed,
  }) {
    return _then(_$QuizResultImpl(
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<QuizAnswer>,
      totalScore: null == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int,
      maxScore: null == maxScore
          ? _value.maxScore
          : maxScore // ignore: cast_nullable_to_non_nullable
              as int,
      percentageScore: null == percentageScore
          ? _value.percentageScore
          : percentageScore // ignore: cast_nullable_to_non_nullable
              as double,
      isPassed: null == isPassed
          ? _value.isPassed
          : isPassed // ignore: cast_nullable_to_non_nullable
              as bool,
      timeSpent: null == timeSpent
          ? _value.timeSpent
          : timeSpent // ignore: cast_nullable_to_non_nullable
              as int,
      completedAt: null == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizResultImpl implements _QuizResult {
  const _$QuizResultImpl(
      {required this.quizId,
      required this.userId,
      required final List<QuizAnswer> answers,
      required this.totalScore,
      required this.maxScore,
      required this.percentageScore,
      required this.isPassed,
      required this.timeSpent,
      required this.completedAt,
      this.sessionId})
      : _answers = answers;

  factory _$QuizResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizResultImplFromJson(json);

  @override
  final int quizId;
  @override
  final int userId;
  final List<QuizAnswer> _answers;
  @override
  List<QuizAnswer> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  final int totalScore;
  @override
  final int maxScore;
  @override
  final double percentageScore;
  @override
  final bool isPassed;
  @override
  final int timeSpent;
// in seconds
  @override
  final DateTime completedAt;
  @override
  final String? sessionId;

  @override
  String toString() {
    return 'QuizResult(quizId: $quizId, userId: $userId, answers: $answers, totalScore: $totalScore, maxScore: $maxScore, percentageScore: $percentageScore, isPassed: $isPassed, timeSpent: $timeSpent, completedAt: $completedAt, sessionId: $sessionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizResultImpl &&
            (identical(other.quizId, quizId) || other.quizId == quizId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.totalScore, totalScore) ||
                other.totalScore == totalScore) &&
            (identical(other.maxScore, maxScore) ||
                other.maxScore == maxScore) &&
            (identical(other.percentageScore, percentageScore) ||
                other.percentageScore == percentageScore) &&
            (identical(other.isPassed, isPassed) ||
                other.isPassed == isPassed) &&
            (identical(other.timeSpent, timeSpent) ||
                other.timeSpent == timeSpent) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      quizId,
      userId,
      const DeepCollectionEquality().hash(_answers),
      totalScore,
      maxScore,
      percentageScore,
      isPassed,
      timeSpent,
      completedAt,
      sessionId);

  /// Create a copy of QuizResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizResultImplCopyWith<_$QuizResultImpl> get copyWith =>
      __$$QuizResultImplCopyWithImpl<_$QuizResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizResultImplToJson(
      this,
    );
  }
}

abstract class _QuizResult implements QuizResult {
  const factory _QuizResult(
      {required final int quizId,
      required final int userId,
      required final List<QuizAnswer> answers,
      required final int totalScore,
      required final int maxScore,
      required final double percentageScore,
      required final bool isPassed,
      required final int timeSpent,
      required final DateTime completedAt,
      final String? sessionId}) = _$QuizResultImpl;

  factory _QuizResult.fromJson(Map<String, dynamic> json) =
      _$QuizResultImpl.fromJson;

  @override
  int get quizId;
  @override
  int get userId;
  @override
  List<QuizAnswer> get answers;
  @override
  int get totalScore;
  @override
  int get maxScore;
  @override
  double get percentageScore;
  @override
  bool get isPassed;
  @override
  int get timeSpent; // in seconds
  @override
  DateTime get completedAt;
  @override
  String? get sessionId;

  /// Create a copy of QuizResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizResultImplCopyWith<_$QuizResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizAnswer _$QuizAnswerFromJson(Map<String, dynamic> json) {
  return _QuizAnswer.fromJson(json);
}

/// @nodoc
mixin _$QuizAnswer {
  int get questionId => throw _privateConstructorUsedError;
  int get selectedOptionId => throw _privateConstructorUsedError;
  bool get isCorrect => throw _privateConstructorUsedError;
  int get timeSpent => throw _privateConstructorUsedError;

  /// Serializes this QuizAnswer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizAnswerCopyWith<QuizAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizAnswerCopyWith<$Res> {
  factory $QuizAnswerCopyWith(
          QuizAnswer value, $Res Function(QuizAnswer) then) =
      _$QuizAnswerCopyWithImpl<$Res, QuizAnswer>;
  @useResult
  $Res call(
      {int questionId, int selectedOptionId, bool isCorrect, int timeSpent});
}

/// @nodoc
class _$QuizAnswerCopyWithImpl<$Res, $Val extends QuizAnswer>
    implements $QuizAnswerCopyWith<$Res> {
  _$QuizAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? selectedOptionId = null,
    Object? isCorrect = null,
    Object? timeSpent = null,
  }) {
    return _then(_value.copyWith(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int,
      selectedOptionId: null == selectedOptionId
          ? _value.selectedOptionId
          : selectedOptionId // ignore: cast_nullable_to_non_nullable
              as int,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      timeSpent: null == timeSpent
          ? _value.timeSpent
          : timeSpent // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizAnswerImplCopyWith<$Res>
    implements $QuizAnswerCopyWith<$Res> {
  factory _$$QuizAnswerImplCopyWith(
          _$QuizAnswerImpl value, $Res Function(_$QuizAnswerImpl) then) =
      __$$QuizAnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int questionId, int selectedOptionId, bool isCorrect, int timeSpent});
}

/// @nodoc
class __$$QuizAnswerImplCopyWithImpl<$Res>
    extends _$QuizAnswerCopyWithImpl<$Res, _$QuizAnswerImpl>
    implements _$$QuizAnswerImplCopyWith<$Res> {
  __$$QuizAnswerImplCopyWithImpl(
      _$QuizAnswerImpl _value, $Res Function(_$QuizAnswerImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? selectedOptionId = null,
    Object? isCorrect = null,
    Object? timeSpent = null,
  }) {
    return _then(_$QuizAnswerImpl(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int,
      selectedOptionId: null == selectedOptionId
          ? _value.selectedOptionId
          : selectedOptionId // ignore: cast_nullable_to_non_nullable
              as int,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      timeSpent: null == timeSpent
          ? _value.timeSpent
          : timeSpent // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizAnswerImpl implements _QuizAnswer {
  const _$QuizAnswerImpl(
      {required this.questionId,
      required this.selectedOptionId,
      required this.isCorrect,
      required this.timeSpent});

  factory _$QuizAnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizAnswerImplFromJson(json);

  @override
  final int questionId;
  @override
  final int selectedOptionId;
  @override
  final bool isCorrect;
  @override
  final int timeSpent;

  @override
  String toString() {
    return 'QuizAnswer(questionId: $questionId, selectedOptionId: $selectedOptionId, isCorrect: $isCorrect, timeSpent: $timeSpent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizAnswerImpl &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.selectedOptionId, selectedOptionId) ||
                other.selectedOptionId == selectedOptionId) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.timeSpent, timeSpent) ||
                other.timeSpent == timeSpent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, questionId, selectedOptionId, isCorrect, timeSpent);

  /// Create a copy of QuizAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizAnswerImplCopyWith<_$QuizAnswerImpl> get copyWith =>
      __$$QuizAnswerImplCopyWithImpl<_$QuizAnswerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizAnswerImplToJson(
      this,
    );
  }
}

abstract class _QuizAnswer implements QuizAnswer {
  const factory _QuizAnswer(
      {required final int questionId,
      required final int selectedOptionId,
      required final bool isCorrect,
      required final int timeSpent}) = _$QuizAnswerImpl;

  factory _QuizAnswer.fromJson(Map<String, dynamic> json) =
      _$QuizAnswerImpl.fromJson;

  @override
  int get questionId;
  @override
  int get selectedOptionId;
  @override
  bool get isCorrect;
  @override
  int get timeSpent;

  /// Create a copy of QuizAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizAnswerImplCopyWith<_$QuizAnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizResultResponse _$QuizResultResponseFromJson(Map<String, dynamic> json) {
  return _QuizResultResponse.fromJson(json);
}

/// @nodoc
mixin _$QuizResultResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  QuizResultSummary? get summary => throw _privateConstructorUsedError;
  List<Achievement>? get achievements => throw _privateConstructorUsedError;
  UserProgress? get progress => throw _privateConstructorUsedError;

  /// Serializes this QuizResultResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizResultResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizResultResponseCopyWith<QuizResultResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizResultResponseCopyWith<$Res> {
  factory $QuizResultResponseCopyWith(
          QuizResultResponse value, $Res Function(QuizResultResponse) then) =
      _$QuizResultResponseCopyWithImpl<$Res, QuizResultResponse>;
  @useResult
  $Res call(
      {bool success,
      String message,
      QuizResultSummary? summary,
      List<Achievement>? achievements,
      UserProgress? progress});

  $QuizResultSummaryCopyWith<$Res>? get summary;
  $UserProgressCopyWith<$Res>? get progress;
}

/// @nodoc
class _$QuizResultResponseCopyWithImpl<$Res, $Val extends QuizResultResponse>
    implements $QuizResultResponseCopyWith<$Res> {
  _$QuizResultResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizResultResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? summary = freezed,
    Object? achievements = freezed,
    Object? progress = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as QuizResultSummary?,
      achievements: freezed == achievements
          ? _value.achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<Achievement>?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as UserProgress?,
    ) as $Val);
  }

  /// Create a copy of QuizResultResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuizResultSummaryCopyWith<$Res>? get summary {
    if (_value.summary == null) {
      return null;
    }

    return $QuizResultSummaryCopyWith<$Res>(_value.summary!, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }

  /// Create a copy of QuizResultResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProgressCopyWith<$Res>? get progress {
    if (_value.progress == null) {
      return null;
    }

    return $UserProgressCopyWith<$Res>(_value.progress!, (value) {
      return _then(_value.copyWith(progress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuizResultResponseImplCopyWith<$Res>
    implements $QuizResultResponseCopyWith<$Res> {
  factory _$$QuizResultResponseImplCopyWith(_$QuizResultResponseImpl value,
          $Res Function(_$QuizResultResponseImpl) then) =
      __$$QuizResultResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool success,
      String message,
      QuizResultSummary? summary,
      List<Achievement>? achievements,
      UserProgress? progress});

  @override
  $QuizResultSummaryCopyWith<$Res>? get summary;
  @override
  $UserProgressCopyWith<$Res>? get progress;
}

/// @nodoc
class __$$QuizResultResponseImplCopyWithImpl<$Res>
    extends _$QuizResultResponseCopyWithImpl<$Res, _$QuizResultResponseImpl>
    implements _$$QuizResultResponseImplCopyWith<$Res> {
  __$$QuizResultResponseImplCopyWithImpl(_$QuizResultResponseImpl _value,
      $Res Function(_$QuizResultResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizResultResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? summary = freezed,
    Object? achievements = freezed,
    Object? progress = freezed,
  }) {
    return _then(_$QuizResultResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as QuizResultSummary?,
      achievements: freezed == achievements
          ? _value._achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<Achievement>?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as UserProgress?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizResultResponseImpl implements _QuizResultResponse {
  const _$QuizResultResponseImpl(
      {required this.success,
      required this.message,
      this.summary,
      final List<Achievement>? achievements,
      this.progress})
      : _achievements = achievements;

  factory _$QuizResultResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizResultResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final QuizResultSummary? summary;
  final List<Achievement>? _achievements;
  @override
  List<Achievement>? get achievements {
    final value = _achievements;
    if (value == null) return null;
    if (_achievements is EqualUnmodifiableListView) return _achievements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final UserProgress? progress;

  @override
  String toString() {
    return 'QuizResultResponse(success: $success, message: $message, summary: $summary, achievements: $achievements, progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizResultResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality()
                .equals(other._achievements, _achievements) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, summary,
      const DeepCollectionEquality().hash(_achievements), progress);

  /// Create a copy of QuizResultResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizResultResponseImplCopyWith<_$QuizResultResponseImpl> get copyWith =>
      __$$QuizResultResponseImplCopyWithImpl<_$QuizResultResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizResultResponseImplToJson(
      this,
    );
  }
}

abstract class _QuizResultResponse implements QuizResultResponse {
  const factory _QuizResultResponse(
      {required final bool success,
      required final String message,
      final QuizResultSummary? summary,
      final List<Achievement>? achievements,
      final UserProgress? progress}) = _$QuizResultResponseImpl;

  factory _QuizResultResponse.fromJson(Map<String, dynamic> json) =
      _$QuizResultResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  QuizResultSummary? get summary;
  @override
  List<Achievement>? get achievements;
  @override
  UserProgress? get progress;

  /// Create a copy of QuizResultResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizResultResponseImplCopyWith<_$QuizResultResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizResultSummary _$QuizResultSummaryFromJson(Map<String, dynamic> json) {
  return _QuizResultSummary.fromJson(json);
}

/// @nodoc
mixin _$QuizResultSummary {
  int get resultId => throw _privateConstructorUsedError;
  int get pointsEarned => throw _privateConstructorUsedError;
  int get streakDays => throw _privateConstructorUsedError;
  int get totalQuizzesCompleted => throw _privateConstructorUsedError;
  String get nextRecommendation => throw _privateConstructorUsedError;

  /// Serializes this QuizResultSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizResultSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizResultSummaryCopyWith<QuizResultSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizResultSummaryCopyWith<$Res> {
  factory $QuizResultSummaryCopyWith(
          QuizResultSummary value, $Res Function(QuizResultSummary) then) =
      _$QuizResultSummaryCopyWithImpl<$Res, QuizResultSummary>;
  @useResult
  $Res call(
      {int resultId,
      int pointsEarned,
      int streakDays,
      int totalQuizzesCompleted,
      String nextRecommendation});
}

/// @nodoc
class _$QuizResultSummaryCopyWithImpl<$Res, $Val extends QuizResultSummary>
    implements $QuizResultSummaryCopyWith<$Res> {
  _$QuizResultSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizResultSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resultId = null,
    Object? pointsEarned = null,
    Object? streakDays = null,
    Object? totalQuizzesCompleted = null,
    Object? nextRecommendation = null,
  }) {
    return _then(_value.copyWith(
      resultId: null == resultId
          ? _value.resultId
          : resultId // ignore: cast_nullable_to_non_nullable
              as int,
      pointsEarned: null == pointsEarned
          ? _value.pointsEarned
          : pointsEarned // ignore: cast_nullable_to_non_nullable
              as int,
      streakDays: null == streakDays
          ? _value.streakDays
          : streakDays // ignore: cast_nullable_to_non_nullable
              as int,
      totalQuizzesCompleted: null == totalQuizzesCompleted
          ? _value.totalQuizzesCompleted
          : totalQuizzesCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      nextRecommendation: null == nextRecommendation
          ? _value.nextRecommendation
          : nextRecommendation // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizResultSummaryImplCopyWith<$Res>
    implements $QuizResultSummaryCopyWith<$Res> {
  factory _$$QuizResultSummaryImplCopyWith(_$QuizResultSummaryImpl value,
          $Res Function(_$QuizResultSummaryImpl) then) =
      __$$QuizResultSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int resultId,
      int pointsEarned,
      int streakDays,
      int totalQuizzesCompleted,
      String nextRecommendation});
}

/// @nodoc
class __$$QuizResultSummaryImplCopyWithImpl<$Res>
    extends _$QuizResultSummaryCopyWithImpl<$Res, _$QuizResultSummaryImpl>
    implements _$$QuizResultSummaryImplCopyWith<$Res> {
  __$$QuizResultSummaryImplCopyWithImpl(_$QuizResultSummaryImpl _value,
      $Res Function(_$QuizResultSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizResultSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resultId = null,
    Object? pointsEarned = null,
    Object? streakDays = null,
    Object? totalQuizzesCompleted = null,
    Object? nextRecommendation = null,
  }) {
    return _then(_$QuizResultSummaryImpl(
      resultId: null == resultId
          ? _value.resultId
          : resultId // ignore: cast_nullable_to_non_nullable
              as int,
      pointsEarned: null == pointsEarned
          ? _value.pointsEarned
          : pointsEarned // ignore: cast_nullable_to_non_nullable
              as int,
      streakDays: null == streakDays
          ? _value.streakDays
          : streakDays // ignore: cast_nullable_to_non_nullable
              as int,
      totalQuizzesCompleted: null == totalQuizzesCompleted
          ? _value.totalQuizzesCompleted
          : totalQuizzesCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      nextRecommendation: null == nextRecommendation
          ? _value.nextRecommendation
          : nextRecommendation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizResultSummaryImpl implements _QuizResultSummary {
  const _$QuizResultSummaryImpl(
      {required this.resultId,
      required this.pointsEarned,
      required this.streakDays,
      required this.totalQuizzesCompleted,
      required this.nextRecommendation});

  factory _$QuizResultSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizResultSummaryImplFromJson(json);

  @override
  final int resultId;
  @override
  final int pointsEarned;
  @override
  final int streakDays;
  @override
  final int totalQuizzesCompleted;
  @override
  final String nextRecommendation;

  @override
  String toString() {
    return 'QuizResultSummary(resultId: $resultId, pointsEarned: $pointsEarned, streakDays: $streakDays, totalQuizzesCompleted: $totalQuizzesCompleted, nextRecommendation: $nextRecommendation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizResultSummaryImpl &&
            (identical(other.resultId, resultId) ||
                other.resultId == resultId) &&
            (identical(other.pointsEarned, pointsEarned) ||
                other.pointsEarned == pointsEarned) &&
            (identical(other.streakDays, streakDays) ||
                other.streakDays == streakDays) &&
            (identical(other.totalQuizzesCompleted, totalQuizzesCompleted) ||
                other.totalQuizzesCompleted == totalQuizzesCompleted) &&
            (identical(other.nextRecommendation, nextRecommendation) ||
                other.nextRecommendation == nextRecommendation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, resultId, pointsEarned,
      streakDays, totalQuizzesCompleted, nextRecommendation);

  /// Create a copy of QuizResultSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizResultSummaryImplCopyWith<_$QuizResultSummaryImpl> get copyWith =>
      __$$QuizResultSummaryImplCopyWithImpl<_$QuizResultSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizResultSummaryImplToJson(
      this,
    );
  }
}

abstract class _QuizResultSummary implements QuizResultSummary {
  const factory _QuizResultSummary(
      {required final int resultId,
      required final int pointsEarned,
      required final int streakDays,
      required final int totalQuizzesCompleted,
      required final String nextRecommendation}) = _$QuizResultSummaryImpl;

  factory _QuizResultSummary.fromJson(Map<String, dynamic> json) =
      _$QuizResultSummaryImpl.fromJson;

  @override
  int get resultId;
  @override
  int get pointsEarned;
  @override
  int get streakDays;
  @override
  int get totalQuizzesCompleted;
  @override
  String get nextRecommendation;

  /// Create a copy of QuizResultSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizResultSummaryImplCopyWith<_$QuizResultSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Achievement _$AchievementFromJson(Map<String, dynamic> json) {
  return _Achievement.fromJson(json);
}

/// @nodoc
mixin _$Achievement {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get iconUrl => throw _privateConstructorUsedError;
  DateTime get unlockedAt => throw _privateConstructorUsedError;

  /// Serializes this Achievement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AchievementCopyWith<Achievement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchievementCopyWith<$Res> {
  factory $AchievementCopyWith(
          Achievement value, $Res Function(Achievement) then) =
      _$AchievementCopyWithImpl<$Res, Achievement>;
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      String iconUrl,
      DateTime unlockedAt});
}

/// @nodoc
class _$AchievementCopyWithImpl<$Res, $Val extends Achievement>
    implements $AchievementCopyWith<$Res> {
  _$AchievementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? iconUrl = null,
    Object? unlockedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      unlockedAt: null == unlockedAt
          ? _value.unlockedAt
          : unlockedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AchievementImplCopyWith<$Res>
    implements $AchievementCopyWith<$Res> {
  factory _$$AchievementImplCopyWith(
          _$AchievementImpl value, $Res Function(_$AchievementImpl) then) =
      __$$AchievementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      String iconUrl,
      DateTime unlockedAt});
}

/// @nodoc
class __$$AchievementImplCopyWithImpl<$Res>
    extends _$AchievementCopyWithImpl<$Res, _$AchievementImpl>
    implements _$$AchievementImplCopyWith<$Res> {
  __$$AchievementImplCopyWithImpl(
      _$AchievementImpl _value, $Res Function(_$AchievementImpl) _then)
      : super(_value, _then);

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? iconUrl = null,
    Object? unlockedAt = null,
  }) {
    return _then(_$AchievementImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      unlockedAt: null == unlockedAt
          ? _value.unlockedAt
          : unlockedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AchievementImpl implements _Achievement {
  const _$AchievementImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.iconUrl,
      required this.unlockedAt});

  factory _$AchievementImpl.fromJson(Map<String, dynamic> json) =>
      _$$AchievementImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String iconUrl;
  @override
  final DateTime unlockedAt;

  @override
  String toString() {
    return 'Achievement(id: $id, title: $title, description: $description, iconUrl: $iconUrl, unlockedAt: $unlockedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AchievementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.unlockedAt, unlockedAt) ||
                other.unlockedAt == unlockedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, description, iconUrl, unlockedAt);

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AchievementImplCopyWith<_$AchievementImpl> get copyWith =>
      __$$AchievementImplCopyWithImpl<_$AchievementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AchievementImplToJson(
      this,
    );
  }
}

abstract class _Achievement implements Achievement {
  const factory _Achievement(
      {required final int id,
      required final String title,
      required final String description,
      required final String iconUrl,
      required final DateTime unlockedAt}) = _$AchievementImpl;

  factory _Achievement.fromJson(Map<String, dynamic> json) =
      _$AchievementImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get iconUrl;
  @override
  DateTime get unlockedAt;

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AchievementImplCopyWith<_$AchievementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserProgress _$UserProgressFromJson(Map<String, dynamic> json) {
  return _UserProgress.fromJson(json);
}

/// @nodoc
mixin _$UserProgress {
  int get currentLevel => throw _privateConstructorUsedError;
  int get currentXP => throw _privateConstructorUsedError;
  int get xpToNextLevel => throw _privateConstructorUsedError;
  double get progressToNextLevel => throw _privateConstructorUsedError;

  /// Serializes this UserProgress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProgressCopyWith<UserProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProgressCopyWith<$Res> {
  factory $UserProgressCopyWith(
          UserProgress value, $Res Function(UserProgress) then) =
      _$UserProgressCopyWithImpl<$Res, UserProgress>;
  @useResult
  $Res call(
      {int currentLevel,
      int currentXP,
      int xpToNextLevel,
      double progressToNextLevel});
}

/// @nodoc
class _$UserProgressCopyWithImpl<$Res, $Val extends UserProgress>
    implements $UserProgressCopyWith<$Res> {
  _$UserProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentLevel = null,
    Object? currentXP = null,
    Object? xpToNextLevel = null,
    Object? progressToNextLevel = null,
  }) {
    return _then(_value.copyWith(
      currentLevel: null == currentLevel
          ? _value.currentLevel
          : currentLevel // ignore: cast_nullable_to_non_nullable
              as int,
      currentXP: null == currentXP
          ? _value.currentXP
          : currentXP // ignore: cast_nullable_to_non_nullable
              as int,
      xpToNextLevel: null == xpToNextLevel
          ? _value.xpToNextLevel
          : xpToNextLevel // ignore: cast_nullable_to_non_nullable
              as int,
      progressToNextLevel: null == progressToNextLevel
          ? _value.progressToNextLevel
          : progressToNextLevel // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProgressImplCopyWith<$Res>
    implements $UserProgressCopyWith<$Res> {
  factory _$$UserProgressImplCopyWith(
          _$UserProgressImpl value, $Res Function(_$UserProgressImpl) then) =
      __$$UserProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentLevel,
      int currentXP,
      int xpToNextLevel,
      double progressToNextLevel});
}

/// @nodoc
class __$$UserProgressImplCopyWithImpl<$Res>
    extends _$UserProgressCopyWithImpl<$Res, _$UserProgressImpl>
    implements _$$UserProgressImplCopyWith<$Res> {
  __$$UserProgressImplCopyWithImpl(
      _$UserProgressImpl _value, $Res Function(_$UserProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentLevel = null,
    Object? currentXP = null,
    Object? xpToNextLevel = null,
    Object? progressToNextLevel = null,
  }) {
    return _then(_$UserProgressImpl(
      currentLevel: null == currentLevel
          ? _value.currentLevel
          : currentLevel // ignore: cast_nullable_to_non_nullable
              as int,
      currentXP: null == currentXP
          ? _value.currentXP
          : currentXP // ignore: cast_nullable_to_non_nullable
              as int,
      xpToNextLevel: null == xpToNextLevel
          ? _value.xpToNextLevel
          : xpToNextLevel // ignore: cast_nullable_to_non_nullable
              as int,
      progressToNextLevel: null == progressToNextLevel
          ? _value.progressToNextLevel
          : progressToNextLevel // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProgressImpl implements _UserProgress {
  const _$UserProgressImpl(
      {required this.currentLevel,
      required this.currentXP,
      required this.xpToNextLevel,
      required this.progressToNextLevel});

  factory _$UserProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProgressImplFromJson(json);

  @override
  final int currentLevel;
  @override
  final int currentXP;
  @override
  final int xpToNextLevel;
  @override
  final double progressToNextLevel;

  @override
  String toString() {
    return 'UserProgress(currentLevel: $currentLevel, currentXP: $currentXP, xpToNextLevel: $xpToNextLevel, progressToNextLevel: $progressToNextLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProgressImpl &&
            (identical(other.currentLevel, currentLevel) ||
                other.currentLevel == currentLevel) &&
            (identical(other.currentXP, currentXP) ||
                other.currentXP == currentXP) &&
            (identical(other.xpToNextLevel, xpToNextLevel) ||
                other.xpToNextLevel == xpToNextLevel) &&
            (identical(other.progressToNextLevel, progressToNextLevel) ||
                other.progressToNextLevel == progressToNextLevel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, currentLevel, currentXP, xpToNextLevel, progressToNextLevel);

  /// Create a copy of UserProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProgressImplCopyWith<_$UserProgressImpl> get copyWith =>
      __$$UserProgressImplCopyWithImpl<_$UserProgressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProgressImplToJson(
      this,
    );
  }
}

abstract class _UserProgress implements UserProgress {
  const factory _UserProgress(
      {required final int currentLevel,
      required final int currentXP,
      required final int xpToNextLevel,
      required final double progressToNextLevel}) = _$UserProgressImpl;

  factory _UserProgress.fromJson(Map<String, dynamic> json) =
      _$UserProgressImpl.fromJson;

  @override
  int get currentLevel;
  @override
  int get currentXP;
  @override
  int get xpToNextLevel;
  @override
  double get progressToNextLevel;

  /// Create a copy of UserProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProgressImplCopyWith<_$UserProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
