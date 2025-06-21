// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detection_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetectionResult _$DetectionResultFromJson(Map<String, dynamic> json) {
  return _DetectionResult.fromJson(json);
}

/// @nodoc
mixin _$DetectionResult {
  String get name => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;
  BoundingPoly get boundingPoly => throw _privateConstructorUsedError;

  /// Serializes this DetectionResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetectionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetectionResultCopyWith<DetectionResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetectionResultCopyWith<$Res> {
  factory $DetectionResultCopyWith(
          DetectionResult value, $Res Function(DetectionResult) then) =
      _$DetectionResultCopyWithImpl<$Res, DetectionResult>;
  @useResult
  $Res call({String name, double score, BoundingPoly boundingPoly});

  $BoundingPolyCopyWith<$Res> get boundingPoly;
}

/// @nodoc
class _$DetectionResultCopyWithImpl<$Res, $Val extends DetectionResult>
    implements $DetectionResultCopyWith<$Res> {
  _$DetectionResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetectionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? score = null,
    Object? boundingPoly = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      boundingPoly: null == boundingPoly
          ? _value.boundingPoly
          : boundingPoly // ignore: cast_nullable_to_non_nullable
              as BoundingPoly,
    ) as $Val);
  }

  /// Create a copy of DetectionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BoundingPolyCopyWith<$Res> get boundingPoly {
    return $BoundingPolyCopyWith<$Res>(_value.boundingPoly, (value) {
      return _then(_value.copyWith(boundingPoly: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetectionResultImplCopyWith<$Res>
    implements $DetectionResultCopyWith<$Res> {
  factory _$$DetectionResultImplCopyWith(_$DetectionResultImpl value,
          $Res Function(_$DetectionResultImpl) then) =
      __$$DetectionResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, double score, BoundingPoly boundingPoly});

  @override
  $BoundingPolyCopyWith<$Res> get boundingPoly;
}

/// @nodoc
class __$$DetectionResultImplCopyWithImpl<$Res>
    extends _$DetectionResultCopyWithImpl<$Res, _$DetectionResultImpl>
    implements _$$DetectionResultImplCopyWith<$Res> {
  __$$DetectionResultImplCopyWithImpl(
      _$DetectionResultImpl _value, $Res Function(_$DetectionResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetectionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? score = null,
    Object? boundingPoly = null,
  }) {
    return _then(_$DetectionResultImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      boundingPoly: null == boundingPoly
          ? _value.boundingPoly
          : boundingPoly // ignore: cast_nullable_to_non_nullable
              as BoundingPoly,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetectionResultImpl implements _DetectionResult {
  const _$DetectionResultImpl(
      {required this.name, required this.score, required this.boundingPoly});

  factory _$DetectionResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetectionResultImplFromJson(json);

  @override
  final String name;
  @override
  final double score;
  @override
  final BoundingPoly boundingPoly;

  @override
  String toString() {
    return 'DetectionResult(name: $name, score: $score, boundingPoly: $boundingPoly)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetectionResultImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.boundingPoly, boundingPoly) ||
                other.boundingPoly == boundingPoly));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, score, boundingPoly);

  /// Create a copy of DetectionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetectionResultImplCopyWith<_$DetectionResultImpl> get copyWith =>
      __$$DetectionResultImplCopyWithImpl<_$DetectionResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetectionResultImplToJson(
      this,
    );
  }
}

abstract class _DetectionResult implements DetectionResult {
  const factory _DetectionResult(
      {required final String name,
      required final double score,
      required final BoundingPoly boundingPoly}) = _$DetectionResultImpl;

  factory _DetectionResult.fromJson(Map<String, dynamic> json) =
      _$DetectionResultImpl.fromJson;

  @override
  String get name;
  @override
  double get score;
  @override
  BoundingPoly get boundingPoly;

  /// Create a copy of DetectionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetectionResultImplCopyWith<_$DetectionResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BoundingPoly _$BoundingPolyFromJson(Map<String, dynamic> json) {
  return _BoundingPoly.fromJson(json);
}

/// @nodoc
mixin _$BoundingPoly {
  List<Vertex> get vertices => throw _privateConstructorUsedError;

  /// Serializes this BoundingPoly to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BoundingPoly
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BoundingPolyCopyWith<BoundingPoly> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoundingPolyCopyWith<$Res> {
  factory $BoundingPolyCopyWith(
          BoundingPoly value, $Res Function(BoundingPoly) then) =
      _$BoundingPolyCopyWithImpl<$Res, BoundingPoly>;
  @useResult
  $Res call({List<Vertex> vertices});
}

/// @nodoc
class _$BoundingPolyCopyWithImpl<$Res, $Val extends BoundingPoly>
    implements $BoundingPolyCopyWith<$Res> {
  _$BoundingPolyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BoundingPoly
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vertices = null,
  }) {
    return _then(_value.copyWith(
      vertices: null == vertices
          ? _value.vertices
          : vertices // ignore: cast_nullable_to_non_nullable
              as List<Vertex>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BoundingPolyImplCopyWith<$Res>
    implements $BoundingPolyCopyWith<$Res> {
  factory _$$BoundingPolyImplCopyWith(
          _$BoundingPolyImpl value, $Res Function(_$BoundingPolyImpl) then) =
      __$$BoundingPolyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Vertex> vertices});
}

/// @nodoc
class __$$BoundingPolyImplCopyWithImpl<$Res>
    extends _$BoundingPolyCopyWithImpl<$Res, _$BoundingPolyImpl>
    implements _$$BoundingPolyImplCopyWith<$Res> {
  __$$BoundingPolyImplCopyWithImpl(
      _$BoundingPolyImpl _value, $Res Function(_$BoundingPolyImpl) _then)
      : super(_value, _then);

  /// Create a copy of BoundingPoly
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vertices = null,
  }) {
    return _then(_$BoundingPolyImpl(
      vertices: null == vertices
          ? _value._vertices
          : vertices // ignore: cast_nullable_to_non_nullable
              as List<Vertex>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BoundingPolyImpl implements _BoundingPoly {
  const _$BoundingPolyImpl({required final List<Vertex> vertices})
      : _vertices = vertices;

  factory _$BoundingPolyImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoundingPolyImplFromJson(json);

  final List<Vertex> _vertices;
  @override
  List<Vertex> get vertices {
    if (_vertices is EqualUnmodifiableListView) return _vertices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vertices);
  }

  @override
  String toString() {
    return 'BoundingPoly(vertices: $vertices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoundingPolyImpl &&
            const DeepCollectionEquality().equals(other._vertices, _vertices));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_vertices));

  /// Create a copy of BoundingPoly
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BoundingPolyImplCopyWith<_$BoundingPolyImpl> get copyWith =>
      __$$BoundingPolyImplCopyWithImpl<_$BoundingPolyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoundingPolyImplToJson(
      this,
    );
  }
}

abstract class _BoundingPoly implements BoundingPoly {
  const factory _BoundingPoly({required final List<Vertex> vertices}) =
      _$BoundingPolyImpl;

  factory _BoundingPoly.fromJson(Map<String, dynamic> json) =
      _$BoundingPolyImpl.fromJson;

  @override
  List<Vertex> get vertices;

  /// Create a copy of BoundingPoly
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BoundingPolyImplCopyWith<_$BoundingPolyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Vertex _$VertexFromJson(Map<String, dynamic> json) {
  return _Vertex.fromJson(json);
}

/// @nodoc
mixin _$Vertex {
  /// X coordinate as a percentage (0.0 to 1.0) of image width
  double get x => throw _privateConstructorUsedError;

  /// Y coordinate as a percentage (0.0 to 1.0) of image height
  double get y => throw _privateConstructorUsedError;

  /// Serializes this Vertex to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Vertex
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VertexCopyWith<Vertex> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VertexCopyWith<$Res> {
  factory $VertexCopyWith(Vertex value, $Res Function(Vertex) then) =
      _$VertexCopyWithImpl<$Res, Vertex>;
  @useResult
  $Res call({double x, double y});
}

/// @nodoc
class _$VertexCopyWithImpl<$Res, $Val extends Vertex>
    implements $VertexCopyWith<$Res> {
  _$VertexCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Vertex
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VertexImplCopyWith<$Res> implements $VertexCopyWith<$Res> {
  factory _$$VertexImplCopyWith(
          _$VertexImpl value, $Res Function(_$VertexImpl) then) =
      __$$VertexImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double x, double y});
}

/// @nodoc
class __$$VertexImplCopyWithImpl<$Res>
    extends _$VertexCopyWithImpl<$Res, _$VertexImpl>
    implements _$$VertexImplCopyWith<$Res> {
  __$$VertexImplCopyWithImpl(
      _$VertexImpl _value, $Res Function(_$VertexImpl) _then)
      : super(_value, _then);

  /// Create a copy of Vertex
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_$VertexImpl(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VertexImpl implements _Vertex {
  const _$VertexImpl({required this.x, required this.y});

  factory _$VertexImpl.fromJson(Map<String, dynamic> json) =>
      _$$VertexImplFromJson(json);

  /// X coordinate as a percentage (0.0 to 1.0) of image width
  @override
  final double x;

  /// Y coordinate as a percentage (0.0 to 1.0) of image height
  @override
  final double y;

  @override
  String toString() {
    return 'Vertex(x: $x, y: $y)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VertexImpl &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, x, y);

  /// Create a copy of Vertex
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VertexImplCopyWith<_$VertexImpl> get copyWith =>
      __$$VertexImplCopyWithImpl<_$VertexImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VertexImplToJson(
      this,
    );
  }
}

abstract class _Vertex implements Vertex {
  const factory _Vertex({required final double x, required final double y}) =
      _$VertexImpl;

  factory _Vertex.fromJson(Map<String, dynamic> json) = _$VertexImpl.fromJson;

  /// X coordinate as a percentage (0.0 to 1.0) of image width
  @override
  double get x;

  /// Y coordinate as a percentage (0.0 to 1.0) of image height
  @override
  double get y;

  /// Create a copy of Vertex
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VertexImplCopyWith<_$VertexImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
