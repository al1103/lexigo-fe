// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LeaderboardUser _$LeaderboardUserFromJson(Map<String, dynamic> json) {
  return _LeaderboardUser.fromJson(json);
}

/// @nodoc
mixin _$LeaderboardUser {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'level')
  String? get level => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_points')
  int? get totalPoints => throw _privateConstructorUsedError;
  @JsonKey(name: 'period_points')
  int? get periodPoints => throw _privateConstructorUsedError;
  @JsonKey(name: 'weekly_points')
  int? get weeklyPoints => throw _privateConstructorUsedError;
  @JsonKey(name: 'monthly_points')
  int? get monthlyPoints => throw _privateConstructorUsedError;
  @JsonKey(name: 'streak_days')
  int? get streakDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'rank')
  String? get rank => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_current_user')
  bool? get isCurrentUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'weekly_quiz_completions')
  int? get weeklyQuizCompletions => throw _privateConstructorUsedError;
  @JsonKey(name: 'monthly_quiz_completions')
  int? get monthlyQuizCompletions => throw _privateConstructorUsedError;
  @JsonKey(name: 'weekly_lesson_completions')
  int? get weeklyLessonCompletions => throw _privateConstructorUsedError;
  @JsonKey(name: 'monthly_lesson_completions')
  int? get monthlyLessonCompletions => throw _privateConstructorUsedError;

  /// Serializes this LeaderboardUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeaderboardUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeaderboardUserCopyWith<LeaderboardUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaderboardUserCopyWith<$Res> {
  factory $LeaderboardUserCopyWith(
          LeaderboardUser value, $Res Function(LeaderboardUser) then) =
      _$LeaderboardUserCopyWithImpl<$Res, LeaderboardUser>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
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
      @JsonKey(name: 'monthly_lesson_completions')
      int? monthlyLessonCompletions});
}

/// @nodoc
class _$LeaderboardUserCopyWithImpl<$Res, $Val extends LeaderboardUser>
    implements $LeaderboardUserCopyWith<$Res> {
  _$LeaderboardUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeaderboardUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? fullName = freezed,
    Object? level = freezed,
    Object? totalPoints = freezed,
    Object? periodPoints = freezed,
    Object? weeklyPoints = freezed,
    Object? monthlyPoints = freezed,
    Object? streakDays = freezed,
    Object? rank = freezed,
    Object? isCurrentUser = freezed,
    Object? weeklyQuizCompletions = freezed,
    Object? monthlyQuizCompletions = freezed,
    Object? weeklyLessonCompletions = freezed,
    Object? monthlyLessonCompletions = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
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
      periodPoints: freezed == periodPoints
          ? _value.periodPoints
          : periodPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      weeklyPoints: freezed == weeklyPoints
          ? _value.weeklyPoints
          : weeklyPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      monthlyPoints: freezed == monthlyPoints
          ? _value.monthlyPoints
          : monthlyPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      streakDays: freezed == streakDays
          ? _value.streakDays
          : streakDays // ignore: cast_nullable_to_non_nullable
              as int?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as String?,
      isCurrentUser: freezed == isCurrentUser
          ? _value.isCurrentUser
          : isCurrentUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      weeklyQuizCompletions: freezed == weeklyQuizCompletions
          ? _value.weeklyQuizCompletions
          : weeklyQuizCompletions // ignore: cast_nullable_to_non_nullable
              as int?,
      monthlyQuizCompletions: freezed == monthlyQuizCompletions
          ? _value.monthlyQuizCompletions
          : monthlyQuizCompletions // ignore: cast_nullable_to_non_nullable
              as int?,
      weeklyLessonCompletions: freezed == weeklyLessonCompletions
          ? _value.weeklyLessonCompletions
          : weeklyLessonCompletions // ignore: cast_nullable_to_non_nullable
              as int?,
      monthlyLessonCompletions: freezed == monthlyLessonCompletions
          ? _value.monthlyLessonCompletions
          : monthlyLessonCompletions // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaderboardUserImplCopyWith<$Res>
    implements $LeaderboardUserCopyWith<$Res> {
  factory _$$LeaderboardUserImplCopyWith(_$LeaderboardUserImpl value,
          $Res Function(_$LeaderboardUserImpl) then) =
      __$$LeaderboardUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
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
      @JsonKey(name: 'monthly_lesson_completions')
      int? monthlyLessonCompletions});
}

/// @nodoc
class __$$LeaderboardUserImplCopyWithImpl<$Res>
    extends _$LeaderboardUserCopyWithImpl<$Res, _$LeaderboardUserImpl>
    implements _$$LeaderboardUserImplCopyWith<$Res> {
  __$$LeaderboardUserImplCopyWithImpl(
      _$LeaderboardUserImpl _value, $Res Function(_$LeaderboardUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of LeaderboardUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? fullName = freezed,
    Object? level = freezed,
    Object? totalPoints = freezed,
    Object? periodPoints = freezed,
    Object? weeklyPoints = freezed,
    Object? monthlyPoints = freezed,
    Object? streakDays = freezed,
    Object? rank = freezed,
    Object? isCurrentUser = freezed,
    Object? weeklyQuizCompletions = freezed,
    Object? monthlyQuizCompletions = freezed,
    Object? weeklyLessonCompletions = freezed,
    Object? monthlyLessonCompletions = freezed,
  }) {
    return _then(_$LeaderboardUserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
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
      periodPoints: freezed == periodPoints
          ? _value.periodPoints
          : periodPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      weeklyPoints: freezed == weeklyPoints
          ? _value.weeklyPoints
          : weeklyPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      monthlyPoints: freezed == monthlyPoints
          ? _value.monthlyPoints
          : monthlyPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      streakDays: freezed == streakDays
          ? _value.streakDays
          : streakDays // ignore: cast_nullable_to_non_nullable
              as int?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as String?,
      isCurrentUser: freezed == isCurrentUser
          ? _value.isCurrentUser
          : isCurrentUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      weeklyQuizCompletions: freezed == weeklyQuizCompletions
          ? _value.weeklyQuizCompletions
          : weeklyQuizCompletions // ignore: cast_nullable_to_non_nullable
              as int?,
      monthlyQuizCompletions: freezed == monthlyQuizCompletions
          ? _value.monthlyQuizCompletions
          : monthlyQuizCompletions // ignore: cast_nullable_to_non_nullable
              as int?,
      weeklyLessonCompletions: freezed == weeklyLessonCompletions
          ? _value.weeklyLessonCompletions
          : weeklyLessonCompletions // ignore: cast_nullable_to_non_nullable
              as int?,
      monthlyLessonCompletions: freezed == monthlyLessonCompletions
          ? _value.monthlyLessonCompletions
          : monthlyLessonCompletions // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaderboardUserImpl implements _LeaderboardUser {
  const _$LeaderboardUserImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'username') this.username,
      @JsonKey(name: 'full_name') this.fullName,
      @JsonKey(name: 'level') this.level,
      @JsonKey(name: 'total_points') this.totalPoints,
      @JsonKey(name: 'period_points') this.periodPoints,
      @JsonKey(name: 'weekly_points') this.weeklyPoints,
      @JsonKey(name: 'monthly_points') this.monthlyPoints,
      @JsonKey(name: 'streak_days') this.streakDays,
      @JsonKey(name: 'rank') this.rank,
      @JsonKey(name: 'is_current_user') this.isCurrentUser,
      @JsonKey(name: 'weekly_quiz_completions') this.weeklyQuizCompletions,
      @JsonKey(name: 'monthly_quiz_completions') this.monthlyQuizCompletions,
      @JsonKey(name: 'weekly_lesson_completions') this.weeklyLessonCompletions,
      @JsonKey(name: 'monthly_lesson_completions')
      this.monthlyLessonCompletions});

  factory _$LeaderboardUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaderboardUserImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'username')
  final String? username;
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
  @JsonKey(name: 'period_points')
  final int? periodPoints;
  @override
  @JsonKey(name: 'weekly_points')
  final int? weeklyPoints;
  @override
  @JsonKey(name: 'monthly_points')
  final int? monthlyPoints;
  @override
  @JsonKey(name: 'streak_days')
  final int? streakDays;
  @override
  @JsonKey(name: 'rank')
  final String? rank;
  @override
  @JsonKey(name: 'is_current_user')
  final bool? isCurrentUser;
  @override
  @JsonKey(name: 'weekly_quiz_completions')
  final int? weeklyQuizCompletions;
  @override
  @JsonKey(name: 'monthly_quiz_completions')
  final int? monthlyQuizCompletions;
  @override
  @JsonKey(name: 'weekly_lesson_completions')
  final int? weeklyLessonCompletions;
  @override
  @JsonKey(name: 'monthly_lesson_completions')
  final int? monthlyLessonCompletions;

  @override
  String toString() {
    return 'LeaderboardUser(id: $id, username: $username, fullName: $fullName, level: $level, totalPoints: $totalPoints, periodPoints: $periodPoints, weeklyPoints: $weeklyPoints, monthlyPoints: $monthlyPoints, streakDays: $streakDays, rank: $rank, isCurrentUser: $isCurrentUser, weeklyQuizCompletions: $weeklyQuizCompletions, monthlyQuizCompletions: $monthlyQuizCompletions, weeklyLessonCompletions: $weeklyLessonCompletions, monthlyLessonCompletions: $monthlyLessonCompletions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaderboardUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            (identical(other.periodPoints, periodPoints) ||
                other.periodPoints == periodPoints) &&
            (identical(other.weeklyPoints, weeklyPoints) ||
                other.weeklyPoints == weeklyPoints) &&
            (identical(other.monthlyPoints, monthlyPoints) ||
                other.monthlyPoints == monthlyPoints) &&
            (identical(other.streakDays, streakDays) ||
                other.streakDays == streakDays) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.isCurrentUser, isCurrentUser) ||
                other.isCurrentUser == isCurrentUser) &&
            (identical(other.weeklyQuizCompletions, weeklyQuizCompletions) ||
                other.weeklyQuizCompletions == weeklyQuizCompletions) &&
            (identical(other.monthlyQuizCompletions, monthlyQuizCompletions) ||
                other.monthlyQuizCompletions == monthlyQuizCompletions) &&
            (identical(
                    other.weeklyLessonCompletions, weeklyLessonCompletions) ||
                other.weeklyLessonCompletions == weeklyLessonCompletions) &&
            (identical(
                    other.monthlyLessonCompletions, monthlyLessonCompletions) ||
                other.monthlyLessonCompletions == monthlyLessonCompletions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      username,
      fullName,
      level,
      totalPoints,
      periodPoints,
      weeklyPoints,
      monthlyPoints,
      streakDays,
      rank,
      isCurrentUser,
      weeklyQuizCompletions,
      monthlyQuizCompletions,
      weeklyLessonCompletions,
      monthlyLessonCompletions);

  /// Create a copy of LeaderboardUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaderboardUserImplCopyWith<_$LeaderboardUserImpl> get copyWith =>
      __$$LeaderboardUserImplCopyWithImpl<_$LeaderboardUserImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaderboardUserImplToJson(
      this,
    );
  }
}

abstract class _LeaderboardUser implements LeaderboardUser {
  const factory _LeaderboardUser(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'username') final String? username,
      @JsonKey(name: 'full_name') final String? fullName,
      @JsonKey(name: 'level') final String? level,
      @JsonKey(name: 'total_points') final int? totalPoints,
      @JsonKey(name: 'period_points') final int? periodPoints,
      @JsonKey(name: 'weekly_points') final int? weeklyPoints,
      @JsonKey(name: 'monthly_points') final int? monthlyPoints,
      @JsonKey(name: 'streak_days') final int? streakDays,
      @JsonKey(name: 'rank') final String? rank,
      @JsonKey(name: 'is_current_user') final bool? isCurrentUser,
      @JsonKey(name: 'weekly_quiz_completions')
      final int? weeklyQuizCompletions,
      @JsonKey(name: 'monthly_quiz_completions')
      final int? monthlyQuizCompletions,
      @JsonKey(name: 'weekly_lesson_completions')
      final int? weeklyLessonCompletions,
      @JsonKey(name: 'monthly_lesson_completions')
      final int? monthlyLessonCompletions}) = _$LeaderboardUserImpl;

  factory _LeaderboardUser.fromJson(Map<String, dynamic> json) =
      _$LeaderboardUserImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'username')
  String? get username;
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
  @JsonKey(name: 'period_points')
  int? get periodPoints;
  @override
  @JsonKey(name: 'weekly_points')
  int? get weeklyPoints;
  @override
  @JsonKey(name: 'monthly_points')
  int? get monthlyPoints;
  @override
  @JsonKey(name: 'streak_days')
  int? get streakDays;
  @override
  @JsonKey(name: 'rank')
  String? get rank;
  @override
  @JsonKey(name: 'is_current_user')
  bool? get isCurrentUser;
  @override
  @JsonKey(name: 'weekly_quiz_completions')
  int? get weeklyQuizCompletions;
  @override
  @JsonKey(name: 'monthly_quiz_completions')
  int? get monthlyQuizCompletions;
  @override
  @JsonKey(name: 'weekly_lesson_completions')
  int? get weeklyLessonCompletions;
  @override
  @JsonKey(name: 'monthly_lesson_completions')
  int? get monthlyLessonCompletions;

  /// Create a copy of LeaderboardUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeaderboardUserImplCopyWith<_$LeaderboardUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
