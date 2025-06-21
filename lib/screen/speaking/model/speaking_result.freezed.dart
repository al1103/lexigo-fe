// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'speaking_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SpeakingResult _$SpeakingResultFromJson(Map<String, dynamic> json) {
  return _SpeakingResult.fromJson(json);
}

/// @nodoc
mixin _$SpeakingResult {
  @JsonKey(name: 'accuracy_level')
  String? get accuracyLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'overall_score')
  int? get overallScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'reference_ipa')
  String? get referenceIpa => throw _privateConstructorUsedError;
  @JsonKey(name: 'reference_text')
  String? get referenceText => throw _privateConstructorUsedError;
  @JsonKey(name: 'spoken_ipa')
  String? get spokenIpa => throw _privateConstructorUsedError;
  @JsonKey(name: 'spoken_text')
  String? get spokenText => throw _privateConstructorUsedError;
  @JsonKey(name: 'word_analysis')
  List<WordAnalysis>? get wordAnalysis => throw _privateConstructorUsedError;

  /// Serializes this SpeakingResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpeakingResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpeakingResultCopyWith<SpeakingResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpeakingResultCopyWith<$Res> {
  factory $SpeakingResultCopyWith(
          SpeakingResult value, $Res Function(SpeakingResult) then) =
      _$SpeakingResultCopyWithImpl<$Res, SpeakingResult>;
  @useResult
  $Res call(
      {@JsonKey(name: 'accuracy_level') String? accuracyLevel,
      @JsonKey(name: 'overall_score') int? overallScore,
      @JsonKey(name: 'reference_ipa') String? referenceIpa,
      @JsonKey(name: 'reference_text') String? referenceText,
      @JsonKey(name: 'spoken_ipa') String? spokenIpa,
      @JsonKey(name: 'spoken_text') String? spokenText,
      @JsonKey(name: 'word_analysis') List<WordAnalysis>? wordAnalysis});
}

/// @nodoc
class _$SpeakingResultCopyWithImpl<$Res, $Val extends SpeakingResult>
    implements $SpeakingResultCopyWith<$Res> {
  _$SpeakingResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpeakingResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accuracyLevel = freezed,
    Object? overallScore = freezed,
    Object? referenceIpa = freezed,
    Object? referenceText = freezed,
    Object? spokenIpa = freezed,
    Object? spokenText = freezed,
    Object? wordAnalysis = freezed,
  }) {
    return _then(_value.copyWith(
      accuracyLevel: freezed == accuracyLevel
          ? _value.accuracyLevel
          : accuracyLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      overallScore: freezed == overallScore
          ? _value.overallScore
          : overallScore // ignore: cast_nullable_to_non_nullable
              as int?,
      referenceIpa: freezed == referenceIpa
          ? _value.referenceIpa
          : referenceIpa // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceText: freezed == referenceText
          ? _value.referenceText
          : referenceText // ignore: cast_nullable_to_non_nullable
              as String?,
      spokenIpa: freezed == spokenIpa
          ? _value.spokenIpa
          : spokenIpa // ignore: cast_nullable_to_non_nullable
              as String?,
      spokenText: freezed == spokenText
          ? _value.spokenText
          : spokenText // ignore: cast_nullable_to_non_nullable
              as String?,
      wordAnalysis: freezed == wordAnalysis
          ? _value.wordAnalysis
          : wordAnalysis // ignore: cast_nullable_to_non_nullable
              as List<WordAnalysis>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpeakingResultImplCopyWith<$Res>
    implements $SpeakingResultCopyWith<$Res> {
  factory _$$SpeakingResultImplCopyWith(_$SpeakingResultImpl value,
          $Res Function(_$SpeakingResultImpl) then) =
      __$$SpeakingResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'accuracy_level') String? accuracyLevel,
      @JsonKey(name: 'overall_score') int? overallScore,
      @JsonKey(name: 'reference_ipa') String? referenceIpa,
      @JsonKey(name: 'reference_text') String? referenceText,
      @JsonKey(name: 'spoken_ipa') String? spokenIpa,
      @JsonKey(name: 'spoken_text') String? spokenText,
      @JsonKey(name: 'word_analysis') List<WordAnalysis>? wordAnalysis});
}

/// @nodoc
class __$$SpeakingResultImplCopyWithImpl<$Res>
    extends _$SpeakingResultCopyWithImpl<$Res, _$SpeakingResultImpl>
    implements _$$SpeakingResultImplCopyWith<$Res> {
  __$$SpeakingResultImplCopyWithImpl(
      _$SpeakingResultImpl _value, $Res Function(_$SpeakingResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpeakingResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accuracyLevel = freezed,
    Object? overallScore = freezed,
    Object? referenceIpa = freezed,
    Object? referenceText = freezed,
    Object? spokenIpa = freezed,
    Object? spokenText = freezed,
    Object? wordAnalysis = freezed,
  }) {
    return _then(_$SpeakingResultImpl(
      accuracyLevel: freezed == accuracyLevel
          ? _value.accuracyLevel
          : accuracyLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      overallScore: freezed == overallScore
          ? _value.overallScore
          : overallScore // ignore: cast_nullable_to_non_nullable
              as int?,
      referenceIpa: freezed == referenceIpa
          ? _value.referenceIpa
          : referenceIpa // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceText: freezed == referenceText
          ? _value.referenceText
          : referenceText // ignore: cast_nullable_to_non_nullable
              as String?,
      spokenIpa: freezed == spokenIpa
          ? _value.spokenIpa
          : spokenIpa // ignore: cast_nullable_to_non_nullable
              as String?,
      spokenText: freezed == spokenText
          ? _value.spokenText
          : spokenText // ignore: cast_nullable_to_non_nullable
              as String?,
      wordAnalysis: freezed == wordAnalysis
          ? _value._wordAnalysis
          : wordAnalysis // ignore: cast_nullable_to_non_nullable
              as List<WordAnalysis>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpeakingResultImpl implements _SpeakingResult {
  const _$SpeakingResultImpl(
      {@JsonKey(name: 'accuracy_level') this.accuracyLevel,
      @JsonKey(name: 'overall_score') this.overallScore,
      @JsonKey(name: 'reference_ipa') this.referenceIpa,
      @JsonKey(name: 'reference_text') this.referenceText,
      @JsonKey(name: 'spoken_ipa') this.spokenIpa,
      @JsonKey(name: 'spoken_text') this.spokenText,
      @JsonKey(name: 'word_analysis') final List<WordAnalysis>? wordAnalysis})
      : _wordAnalysis = wordAnalysis;

  factory _$SpeakingResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpeakingResultImplFromJson(json);

  @override
  @JsonKey(name: 'accuracy_level')
  final String? accuracyLevel;
  @override
  @JsonKey(name: 'overall_score')
  final int? overallScore;
  @override
  @JsonKey(name: 'reference_ipa')
  final String? referenceIpa;
  @override
  @JsonKey(name: 'reference_text')
  final String? referenceText;
  @override
  @JsonKey(name: 'spoken_ipa')
  final String? spokenIpa;
  @override
  @JsonKey(name: 'spoken_text')
  final String? spokenText;
  final List<WordAnalysis>? _wordAnalysis;
  @override
  @JsonKey(name: 'word_analysis')
  List<WordAnalysis>? get wordAnalysis {
    final value = _wordAnalysis;
    if (value == null) return null;
    if (_wordAnalysis is EqualUnmodifiableListView) return _wordAnalysis;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SpeakingResult(accuracyLevel: $accuracyLevel, overallScore: $overallScore, referenceIpa: $referenceIpa, referenceText: $referenceText, spokenIpa: $spokenIpa, spokenText: $spokenText, wordAnalysis: $wordAnalysis)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpeakingResultImpl &&
            (identical(other.accuracyLevel, accuracyLevel) ||
                other.accuracyLevel == accuracyLevel) &&
            (identical(other.overallScore, overallScore) ||
                other.overallScore == overallScore) &&
            (identical(other.referenceIpa, referenceIpa) ||
                other.referenceIpa == referenceIpa) &&
            (identical(other.referenceText, referenceText) ||
                other.referenceText == referenceText) &&
            (identical(other.spokenIpa, spokenIpa) ||
                other.spokenIpa == spokenIpa) &&
            (identical(other.spokenText, spokenText) ||
                other.spokenText == spokenText) &&
            const DeepCollectionEquality()
                .equals(other._wordAnalysis, _wordAnalysis));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      accuracyLevel,
      overallScore,
      referenceIpa,
      referenceText,
      spokenIpa,
      spokenText,
      const DeepCollectionEquality().hash(_wordAnalysis));

  /// Create a copy of SpeakingResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpeakingResultImplCopyWith<_$SpeakingResultImpl> get copyWith =>
      __$$SpeakingResultImplCopyWithImpl<_$SpeakingResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpeakingResultImplToJson(
      this,
    );
  }
}

abstract class _SpeakingResult implements SpeakingResult {
  const factory _SpeakingResult(
      {@JsonKey(name: 'accuracy_level') final String? accuracyLevel,
      @JsonKey(name: 'overall_score') final int? overallScore,
      @JsonKey(name: 'reference_ipa') final String? referenceIpa,
      @JsonKey(name: 'reference_text') final String? referenceText,
      @JsonKey(name: 'spoken_ipa') final String? spokenIpa,
      @JsonKey(name: 'spoken_text') final String? spokenText,
      @JsonKey(name: 'word_analysis')
      final List<WordAnalysis>? wordAnalysis}) = _$SpeakingResultImpl;

  factory _SpeakingResult.fromJson(Map<String, dynamic> json) =
      _$SpeakingResultImpl.fromJson;

  @override
  @JsonKey(name: 'accuracy_level')
  String? get accuracyLevel;
  @override
  @JsonKey(name: 'overall_score')
  int? get overallScore;
  @override
  @JsonKey(name: 'reference_ipa')
  String? get referenceIpa;
  @override
  @JsonKey(name: 'reference_text')
  String? get referenceText;
  @override
  @JsonKey(name: 'spoken_ipa')
  String? get spokenIpa;
  @override
  @JsonKey(name: 'spoken_text')
  String? get spokenText;
  @override
  @JsonKey(name: 'word_analysis')
  List<WordAnalysis>? get wordAnalysis;

  /// Create a copy of SpeakingResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpeakingResultImplCopyWith<_$SpeakingResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WordAnalysis _$WordAnalysisFromJson(Map<String, dynamic> json) {
  return _WordAnalysis.fromJson(json);
}

/// @nodoc
mixin _$WordAnalysis {
  @JsonKey(name: 'reference')
  String? get reference => throw _privateConstructorUsedError;
  @JsonKey(name: 'score')
  int? get score => throw _privateConstructorUsedError;
  @JsonKey(name: 'spoken')
  String? get spoken => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;

  /// Serializes this WordAnalysis to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WordAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordAnalysisCopyWith<WordAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordAnalysisCopyWith<$Res> {
  factory $WordAnalysisCopyWith(
          WordAnalysis value, $Res Function(WordAnalysis) then) =
      _$WordAnalysisCopyWithImpl<$Res, WordAnalysis>;
  @useResult
  $Res call(
      {@JsonKey(name: 'reference') String? reference,
      @JsonKey(name: 'score') int? score,
      @JsonKey(name: 'spoken') String? spoken,
      @JsonKey(name: 'status') String? status});
}

/// @nodoc
class _$WordAnalysisCopyWithImpl<$Res, $Val extends WordAnalysis>
    implements $WordAnalysisCopyWith<$Res> {
  _$WordAnalysisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = freezed,
    Object? score = freezed,
    Object? spoken = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      spoken: freezed == spoken
          ? _value.spoken
          : spoken // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WordAnalysisImplCopyWith<$Res>
    implements $WordAnalysisCopyWith<$Res> {
  factory _$$WordAnalysisImplCopyWith(
          _$WordAnalysisImpl value, $Res Function(_$WordAnalysisImpl) then) =
      __$$WordAnalysisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'reference') String? reference,
      @JsonKey(name: 'score') int? score,
      @JsonKey(name: 'spoken') String? spoken,
      @JsonKey(name: 'status') String? status});
}

/// @nodoc
class __$$WordAnalysisImplCopyWithImpl<$Res>
    extends _$WordAnalysisCopyWithImpl<$Res, _$WordAnalysisImpl>
    implements _$$WordAnalysisImplCopyWith<$Res> {
  __$$WordAnalysisImplCopyWithImpl(
      _$WordAnalysisImpl _value, $Res Function(_$WordAnalysisImpl) _then)
      : super(_value, _then);

  /// Create a copy of WordAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = freezed,
    Object? score = freezed,
    Object? spoken = freezed,
    Object? status = freezed,
  }) {
    return _then(_$WordAnalysisImpl(
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      spoken: freezed == spoken
          ? _value.spoken
          : spoken // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WordAnalysisImpl implements _WordAnalysis {
  const _$WordAnalysisImpl(
      {@JsonKey(name: 'reference') this.reference,
      @JsonKey(name: 'score') this.score,
      @JsonKey(name: 'spoken') this.spoken,
      @JsonKey(name: 'status') this.status});

  factory _$WordAnalysisImpl.fromJson(Map<String, dynamic> json) =>
      _$$WordAnalysisImplFromJson(json);

  @override
  @JsonKey(name: 'reference')
  final String? reference;
  @override
  @JsonKey(name: 'score')
  final int? score;
  @override
  @JsonKey(name: 'spoken')
  final String? spoken;
  @override
  @JsonKey(name: 'status')
  final String? status;

  @override
  String toString() {
    return 'WordAnalysis(reference: $reference, score: $score, spoken: $spoken, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordAnalysisImpl &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.spoken, spoken) || other.spoken == spoken) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, reference, score, spoken, status);

  /// Create a copy of WordAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordAnalysisImplCopyWith<_$WordAnalysisImpl> get copyWith =>
      __$$WordAnalysisImplCopyWithImpl<_$WordAnalysisImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WordAnalysisImplToJson(
      this,
    );
  }
}

abstract class _WordAnalysis implements WordAnalysis {
  const factory _WordAnalysis(
      {@JsonKey(name: 'reference') final String? reference,
      @JsonKey(name: 'score') final int? score,
      @JsonKey(name: 'spoken') final String? spoken,
      @JsonKey(name: 'status') final String? status}) = _$WordAnalysisImpl;

  factory _WordAnalysis.fromJson(Map<String, dynamic> json) =
      _$WordAnalysisImpl.fromJson;

  @override
  @JsonKey(name: 'reference')
  String? get reference;
  @override
  @JsonKey(name: 'score')
  int? get score;
  @override
  @JsonKey(name: 'spoken')
  String? get spoken;
  @override
  @JsonKey(name: 'status')
  String? get status;

  /// Create a copy of WordAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordAnalysisImplCopyWith<_$WordAnalysisImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
