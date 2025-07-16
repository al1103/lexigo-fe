import 'package:freezed_annotation/freezed_annotation.dart';

part 'quotes_model.freezed.dart';
part 'quotes_model.g.dart';

@freezed
class QuotesModel with _$QuotesModel {
  const factory QuotesModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'content') String? content,
    @JsonKey(name: 'author') String? author,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _QuotesModel;

  factory QuotesModel.fromJson(Map<String, dynamic> json) =>
      _$QuotesModelFromJson(json);
}
