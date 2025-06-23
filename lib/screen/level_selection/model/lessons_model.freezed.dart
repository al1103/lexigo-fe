// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lessons_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LessonsModel _$LessonsModelFromJson(Map<String, dynamic> json) {
  return _Lessons.fromJson(json);
}

/// @nodoc
mixin _$LessonsModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'level_code')
  String? get levelCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'level_name')
  String? get levelName => throw _privateConstructorUsedError;
  @JsonKey(name: 'level_name_vi')
  String? get levelNameVi => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'description_vi')
  String? get descriptionVi => throw _privateConstructorUsedError;
  @JsonKey(name: 'color')
  String? get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon')
  String? get icon => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_score')
  int? get minScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_score')
  int? get maxScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'sort_order')
  int? get sortOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool? get isActive => throw _privateConstructorUsedError;

  /// Serializes this LessonsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonsModelCopyWith<LessonsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonsModelCopyWith<$Res> {
  factory $LessonsModelCopyWith(
          LessonsModel value, $Res Function(LessonsModel) then) =
      _$LessonsModelCopyWithImpl<$Res, LessonsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'level_code') String? levelCode,
      @JsonKey(name: 'level_name') String? levelName,
      @JsonKey(name: 'level_name_vi') String? levelNameVi,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'description_vi') String? descriptionVi,
      @JsonKey(name: 'color') String? color,
      @JsonKey(name: 'icon') String? icon,
      @JsonKey(name: 'min_score') int? minScore,
      @JsonKey(name: 'max_score') int? maxScore,
      @JsonKey(name: 'sort_order') int? sortOrder,
      @JsonKey(name: 'is_active') bool? isActive});
}

/// @nodoc
class _$LessonsModelCopyWithImpl<$Res, $Val extends LessonsModel>
    implements $LessonsModelCopyWith<$Res> {
  _$LessonsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? levelCode = freezed,
    Object? levelName = freezed,
    Object? levelNameVi = freezed,
    Object? description = freezed,
    Object? descriptionVi = freezed,
    Object? color = freezed,
    Object? icon = freezed,
    Object? minScore = freezed,
    Object? maxScore = freezed,
    Object? sortOrder = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      levelCode: freezed == levelCode
          ? _value.levelCode
          : levelCode // ignore: cast_nullable_to_non_nullable
              as String?,
      levelName: freezed == levelName
          ? _value.levelName
          : levelName // ignore: cast_nullable_to_non_nullable
              as String?,
      levelNameVi: freezed == levelNameVi
          ? _value.levelNameVi
          : levelNameVi // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionVi: freezed == descriptionVi
          ? _value.descriptionVi
          : descriptionVi // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      minScore: freezed == minScore
          ? _value.minScore
          : minScore // ignore: cast_nullable_to_non_nullable
              as int?,
      maxScore: freezed == maxScore
          ? _value.maxScore
          : maxScore // ignore: cast_nullable_to_non_nullable
              as int?,
      sortOrder: freezed == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonsImplCopyWith<$Res>
    implements $LessonsModelCopyWith<$Res> {
  factory _$$LessonsImplCopyWith(
          _$LessonsImpl value, $Res Function(_$LessonsImpl) then) =
      __$$LessonsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'level_code') String? levelCode,
      @JsonKey(name: 'level_name') String? levelName,
      @JsonKey(name: 'level_name_vi') String? levelNameVi,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'description_vi') String? descriptionVi,
      @JsonKey(name: 'color') String? color,
      @JsonKey(name: 'icon') String? icon,
      @JsonKey(name: 'min_score') int? minScore,
      @JsonKey(name: 'max_score') int? maxScore,
      @JsonKey(name: 'sort_order') int? sortOrder,
      @JsonKey(name: 'is_active') bool? isActive});
}

/// @nodoc
class __$$LessonsImplCopyWithImpl<$Res>
    extends _$LessonsModelCopyWithImpl<$Res, _$LessonsImpl>
    implements _$$LessonsImplCopyWith<$Res> {
  __$$LessonsImplCopyWithImpl(
      _$LessonsImpl _value, $Res Function(_$LessonsImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? levelCode = freezed,
    Object? levelName = freezed,
    Object? levelNameVi = freezed,
    Object? description = freezed,
    Object? descriptionVi = freezed,
    Object? color = freezed,
    Object? icon = freezed,
    Object? minScore = freezed,
    Object? maxScore = freezed,
    Object? sortOrder = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$LessonsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      levelCode: freezed == levelCode
          ? _value.levelCode
          : levelCode // ignore: cast_nullable_to_non_nullable
              as String?,
      levelName: freezed == levelName
          ? _value.levelName
          : levelName // ignore: cast_nullable_to_non_nullable
              as String?,
      levelNameVi: freezed == levelNameVi
          ? _value.levelNameVi
          : levelNameVi // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionVi: freezed == descriptionVi
          ? _value.descriptionVi
          : descriptionVi // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      minScore: freezed == minScore
          ? _value.minScore
          : minScore // ignore: cast_nullable_to_non_nullable
              as int?,
      maxScore: freezed == maxScore
          ? _value.maxScore
          : maxScore // ignore: cast_nullable_to_non_nullable
              as int?,
      sortOrder: freezed == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonsImpl implements _Lessons {
  const _$LessonsImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'level_code') this.levelCode,
      @JsonKey(name: 'level_name') this.levelName,
      @JsonKey(name: 'level_name_vi') this.levelNameVi,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'description_vi') this.descriptionVi,
      @JsonKey(name: 'color') this.color,
      @JsonKey(name: 'icon') this.icon,
      @JsonKey(name: 'min_score') this.minScore,
      @JsonKey(name: 'max_score') this.maxScore,
      @JsonKey(name: 'sort_order') this.sortOrder,
      @JsonKey(name: 'is_active') this.isActive});

  factory _$LessonsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonsImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'level_code')
  final String? levelCode;
  @override
  @JsonKey(name: 'level_name')
  final String? levelName;
  @override
  @JsonKey(name: 'level_name_vi')
  final String? levelNameVi;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'description_vi')
  final String? descriptionVi;
  @override
  @JsonKey(name: 'color')
  final String? color;
  @override
  @JsonKey(name: 'icon')
  final String? icon;
  @override
  @JsonKey(name: 'min_score')
  final int? minScore;
  @override
  @JsonKey(name: 'max_score')
  final int? maxScore;
  @override
  @JsonKey(name: 'sort_order')
  final int? sortOrder;
  @override
  @JsonKey(name: 'is_active')
  final bool? isActive;

  @override
  String toString() {
    return 'LessonsModel(id: $id, levelCode: $levelCode, levelName: $levelName, levelNameVi: $levelNameVi, description: $description, descriptionVi: $descriptionVi, color: $color, icon: $icon, minScore: $minScore, maxScore: $maxScore, sortOrder: $sortOrder, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.levelCode, levelCode) ||
                other.levelCode == levelCode) &&
            (identical(other.levelName, levelName) ||
                other.levelName == levelName) &&
            (identical(other.levelNameVi, levelNameVi) ||
                other.levelNameVi == levelNameVi) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.descriptionVi, descriptionVi) ||
                other.descriptionVi == descriptionVi) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.minScore, minScore) ||
                other.minScore == minScore) &&
            (identical(other.maxScore, maxScore) ||
                other.maxScore == maxScore) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      levelCode,
      levelName,
      levelNameVi,
      description,
      descriptionVi,
      color,
      icon,
      minScore,
      maxScore,
      sortOrder,
      isActive);

  /// Create a copy of LessonsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonsImplCopyWith<_$LessonsImpl> get copyWith =>
      __$$LessonsImplCopyWithImpl<_$LessonsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonsImplToJson(
      this,
    );
  }
}

abstract class _Lessons implements LessonsModel {
  const factory _Lessons(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'level_code') final String? levelCode,
      @JsonKey(name: 'level_name') final String? levelName,
      @JsonKey(name: 'level_name_vi') final String? levelNameVi,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'description_vi') final String? descriptionVi,
      @JsonKey(name: 'color') final String? color,
      @JsonKey(name: 'icon') final String? icon,
      @JsonKey(name: 'min_score') final int? minScore,
      @JsonKey(name: 'max_score') final int? maxScore,
      @JsonKey(name: 'sort_order') final int? sortOrder,
      @JsonKey(name: 'is_active') final bool? isActive}) = _$LessonsImpl;

  factory _Lessons.fromJson(Map<String, dynamic> json) = _$LessonsImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'level_code')
  String? get levelCode;
  @override
  @JsonKey(name: 'level_name')
  String? get levelName;
  @override
  @JsonKey(name: 'level_name_vi')
  String? get levelNameVi;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'description_vi')
  String? get descriptionVi;
  @override
  @JsonKey(name: 'color')
  String? get color;
  @override
  @JsonKey(name: 'icon')
  String? get icon;
  @override
  @JsonKey(name: 'min_score')
  int? get minScore;
  @override
  @JsonKey(name: 'max_score')
  int? get maxScore;
  @override
  @JsonKey(name: 'sort_order')
  int? get sortOrder;
  @override
  @JsonKey(name: 'is_active')
  bool? get isActive;

  /// Create a copy of LessonsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonsImplCopyWith<_$LessonsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
