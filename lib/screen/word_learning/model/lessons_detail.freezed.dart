// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lessons_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LessonsDetail _$LessonsDetailFromJson(Map<String, dynamic> json) {
  return _LessonsDetail.fromJson(json);
}

/// @nodoc
mixin _$LessonsDetail {
  @JsonKey(name: 'question_id')
  int? get questionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_text')
  String? get questionText => throw _privateConstructorUsedError;
  @JsonKey(name: 'word')
  String? get word => throw _privateConstructorUsedError;
  @JsonKey(name: 'meaning')
  String? get meaning => throw _privateConstructorUsedError;
  @JsonKey(name: 'pronunciation')
  String? get pronunciation => throw _privateConstructorUsedError;
  @JsonKey(name: 'options')
  List<Option>? get options => throw _privateConstructorUsedError;
  @JsonKey(name: 'points')
  int? get points => throw _privateConstructorUsedError;

  /// Serializes this LessonsDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonsDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonsDetailCopyWith<LessonsDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonsDetailCopyWith<$Res> {
  factory $LessonsDetailCopyWith(
          LessonsDetail value, $Res Function(LessonsDetail) then) =
      _$LessonsDetailCopyWithImpl<$Res, LessonsDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'question_id') int? questionId,
      @JsonKey(name: 'question_text') String? questionText,
      @JsonKey(name: 'word') String? word,
      @JsonKey(name: 'meaning') String? meaning,
      @JsonKey(name: 'pronunciation') String? pronunciation,
      @JsonKey(name: 'options') List<Option>? options,
      @JsonKey(name: 'points') int? points});
}

/// @nodoc
class _$LessonsDetailCopyWithImpl<$Res, $Val extends LessonsDetail>
    implements $LessonsDetailCopyWith<$Res> {
  _$LessonsDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonsDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = freezed,
    Object? questionText = freezed,
    Object? word = freezed,
    Object? meaning = freezed,
    Object? pronunciation = freezed,
    Object? options = freezed,
    Object? points = freezed,
  }) {
    return _then(_value.copyWith(
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int?,
      questionText: freezed == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String?,
      word: freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String?,
      meaning: freezed == meaning
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String?,
      pronunciation: freezed == pronunciation
          ? _value.pronunciation
          : pronunciation // ignore: cast_nullable_to_non_nullable
              as String?,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Option>?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonsDetailImplCopyWith<$Res>
    implements $LessonsDetailCopyWith<$Res> {
  factory _$$LessonsDetailImplCopyWith(
          _$LessonsDetailImpl value, $Res Function(_$LessonsDetailImpl) then) =
      __$$LessonsDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'question_id') int? questionId,
      @JsonKey(name: 'question_text') String? questionText,
      @JsonKey(name: 'word') String? word,
      @JsonKey(name: 'meaning') String? meaning,
      @JsonKey(name: 'pronunciation') String? pronunciation,
      @JsonKey(name: 'options') List<Option>? options,
      @JsonKey(name: 'points') int? points});
}

/// @nodoc
class __$$LessonsDetailImplCopyWithImpl<$Res>
    extends _$LessonsDetailCopyWithImpl<$Res, _$LessonsDetailImpl>
    implements _$$LessonsDetailImplCopyWith<$Res> {
  __$$LessonsDetailImplCopyWithImpl(
      _$LessonsDetailImpl _value, $Res Function(_$LessonsDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonsDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = freezed,
    Object? questionText = freezed,
    Object? word = freezed,
    Object? meaning = freezed,
    Object? pronunciation = freezed,
    Object? options = freezed,
    Object? points = freezed,
  }) {
    return _then(_$LessonsDetailImpl(
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int?,
      questionText: freezed == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String?,
      word: freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String?,
      meaning: freezed == meaning
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String?,
      pronunciation: freezed == pronunciation
          ? _value.pronunciation
          : pronunciation // ignore: cast_nullable_to_non_nullable
              as String?,
      options: freezed == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Option>?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonsDetailImpl implements _LessonsDetail {
  const _$LessonsDetailImpl(
      {@JsonKey(name: 'question_id') this.questionId,
      @JsonKey(name: 'question_text') this.questionText,
      @JsonKey(name: 'word') this.word,
      @JsonKey(name: 'meaning') this.meaning,
      @JsonKey(name: 'pronunciation') this.pronunciation,
      @JsonKey(name: 'options') final List<Option>? options,
      @JsonKey(name: 'points') this.points})
      : _options = options;

  factory _$LessonsDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonsDetailImplFromJson(json);

  @override
  @JsonKey(name: 'question_id')
  final int? questionId;
  @override
  @JsonKey(name: 'question_text')
  final String? questionText;
  @override
  @JsonKey(name: 'word')
  final String? word;
  @override
  @JsonKey(name: 'meaning')
  final String? meaning;
  @override
  @JsonKey(name: 'pronunciation')
  final String? pronunciation;
  final List<Option>? _options;
  @override
  @JsonKey(name: 'options')
  List<Option>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'points')
  final int? points;

  @override
  String toString() {
    return 'LessonsDetail(questionId: $questionId, questionText: $questionText, word: $word, meaning: $meaning, pronunciation: $pronunciation, options: $options, points: $points)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonsDetailImpl &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText) &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.meaning, meaning) || other.meaning == meaning) &&
            (identical(other.pronunciation, pronunciation) ||
                other.pronunciation == pronunciation) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.points, points) || other.points == points));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      questionId,
      questionText,
      word,
      meaning,
      pronunciation,
      const DeepCollectionEquality().hash(_options),
      points);

  /// Create a copy of LessonsDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonsDetailImplCopyWith<_$LessonsDetailImpl> get copyWith =>
      __$$LessonsDetailImplCopyWithImpl<_$LessonsDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonsDetailImplToJson(
      this,
    );
  }
}

abstract class _LessonsDetail implements LessonsDetail {
  const factory _LessonsDetail(
      {@JsonKey(name: 'question_id') final int? questionId,
      @JsonKey(name: 'question_text') final String? questionText,
      @JsonKey(name: 'word') final String? word,
      @JsonKey(name: 'meaning') final String? meaning,
      @JsonKey(name: 'pronunciation') final String? pronunciation,
      @JsonKey(name: 'options') final List<Option>? options,
      @JsonKey(name: 'points') final int? points}) = _$LessonsDetailImpl;

  factory _LessonsDetail.fromJson(Map<String, dynamic> json) =
      _$LessonsDetailImpl.fromJson;

  @override
  @JsonKey(name: 'question_id')
  int? get questionId;
  @override
  @JsonKey(name: 'question_text')
  String? get questionText;
  @override
  @JsonKey(name: 'word')
  String? get word;
  @override
  @JsonKey(name: 'meaning')
  String? get meaning;
  @override
  @JsonKey(name: 'pronunciation')
  String? get pronunciation;
  @override
  @JsonKey(name: 'options')
  List<Option>? get options;
  @override
  @JsonKey(name: 'points')
  int? get points;

  /// Create a copy of LessonsDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonsDetailImplCopyWith<_$LessonsDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Option _$OptionFromJson(Map<String, dynamic> json) {
  return _Option.fromJson(json);
}

/// @nodoc
mixin _$Option {
  @JsonKey(name: 'option_id')
  int? get optionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'option_text')
  String? get optionText => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_correct')
  bool? get isCorrect => throw _privateConstructorUsedError;
  @JsonKey(name: 'option_order')
  int? get optionOrder => throw _privateConstructorUsedError;

  /// Serializes this Option to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OptionCopyWith<Option> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionCopyWith<$Res> {
  factory $OptionCopyWith(Option value, $Res Function(Option) then) =
      _$OptionCopyWithImpl<$Res, Option>;
  @useResult
  $Res call(
      {@JsonKey(name: 'option_id') int? optionId,
      @JsonKey(name: 'option_text') String? optionText,
      @JsonKey(name: 'is_correct') bool? isCorrect,
      @JsonKey(name: 'option_order') int? optionOrder});
}

/// @nodoc
class _$OptionCopyWithImpl<$Res, $Val extends Option>
    implements $OptionCopyWith<$Res> {
  _$OptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? optionId = freezed,
    Object? optionText = freezed,
    Object? isCorrect = freezed,
    Object? optionOrder = freezed,
  }) {
    return _then(_value.copyWith(
      optionId: freezed == optionId
          ? _value.optionId
          : optionId // ignore: cast_nullable_to_non_nullable
              as int?,
      optionText: freezed == optionText
          ? _value.optionText
          : optionText // ignore: cast_nullable_to_non_nullable
              as String?,
      isCorrect: freezed == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool?,
      optionOrder: freezed == optionOrder
          ? _value.optionOrder
          : optionOrder // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OptionImplCopyWith<$Res> implements $OptionCopyWith<$Res> {
  factory _$$OptionImplCopyWith(
          _$OptionImpl value, $Res Function(_$OptionImpl) then) =
      __$$OptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'option_id') int? optionId,
      @JsonKey(name: 'option_text') String? optionText,
      @JsonKey(name: 'is_correct') bool? isCorrect,
      @JsonKey(name: 'option_order') int? optionOrder});
}

/// @nodoc
class __$$OptionImplCopyWithImpl<$Res>
    extends _$OptionCopyWithImpl<$Res, _$OptionImpl>
    implements _$$OptionImplCopyWith<$Res> {
  __$$OptionImplCopyWithImpl(
      _$OptionImpl _value, $Res Function(_$OptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? optionId = freezed,
    Object? optionText = freezed,
    Object? isCorrect = freezed,
    Object? optionOrder = freezed,
  }) {
    return _then(_$OptionImpl(
      optionId: freezed == optionId
          ? _value.optionId
          : optionId // ignore: cast_nullable_to_non_nullable
              as int?,
      optionText: freezed == optionText
          ? _value.optionText
          : optionText // ignore: cast_nullable_to_non_nullable
              as String?,
      isCorrect: freezed == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool?,
      optionOrder: freezed == optionOrder
          ? _value.optionOrder
          : optionOrder // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OptionImpl implements _Option {
  const _$OptionImpl(
      {@JsonKey(name: 'option_id') this.optionId,
      @JsonKey(name: 'option_text') this.optionText,
      @JsonKey(name: 'is_correct') this.isCorrect,
      @JsonKey(name: 'option_order') this.optionOrder});

  factory _$OptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$OptionImplFromJson(json);

  @override
  @JsonKey(name: 'option_id')
  final int? optionId;
  @override
  @JsonKey(name: 'option_text')
  final String? optionText;
  @override
  @JsonKey(name: 'is_correct')
  final bool? isCorrect;
  @override
  @JsonKey(name: 'option_order')
  final int? optionOrder;

  @override
  String toString() {
    return 'Option(optionId: $optionId, optionText: $optionText, isCorrect: $isCorrect, optionOrder: $optionOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionImpl &&
            (identical(other.optionId, optionId) ||
                other.optionId == optionId) &&
            (identical(other.optionText, optionText) ||
                other.optionText == optionText) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.optionOrder, optionOrder) ||
                other.optionOrder == optionOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, optionId, optionText, isCorrect, optionOrder);

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionImplCopyWith<_$OptionImpl> get copyWith =>
      __$$OptionImplCopyWithImpl<_$OptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OptionImplToJson(
      this,
    );
  }
}

abstract class _Option implements Option {
  const factory _Option(
      {@JsonKey(name: 'option_id') final int? optionId,
      @JsonKey(name: 'option_text') final String? optionText,
      @JsonKey(name: 'is_correct') final bool? isCorrect,
      @JsonKey(name: 'option_order') final int? optionOrder}) = _$OptionImpl;

  factory _Option.fromJson(Map<String, dynamic> json) = _$OptionImpl.fromJson;

  @override
  @JsonKey(name: 'option_id')
  int? get optionId;
  @override
  @JsonKey(name: 'option_text')
  String? get optionText;
  @override
  @JsonKey(name: 'is_correct')
  bool? get isCorrect;
  @override
  @JsonKey(name: 'option_order')
  int? get optionOrder;

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OptionImplCopyWith<_$OptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
