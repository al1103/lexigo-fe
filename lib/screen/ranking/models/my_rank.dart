import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_rank.freezed.dart';
part 'my_rank.g.dart';

@freezed
class MyRank with _$MyRank {
  const factory MyRank({
    @JsonKey(name: 'global') Global? global,
    @JsonKey(name: 'weekly') Global? weekly,
    @JsonKey(name: 'monthly') Global? monthly,
  }) = _MyRank;

  factory MyRank.fromJson(Map<String, dynamic> json) => _$MyRankFromJson(json);
}

@freezed
class Global with _$Global {
  const factory Global({
    @JsonKey(name: 'rank') String? rank,
  }) = _Global;

  factory Global.fromJson(Map<String, dynamic> json) => _$GlobalFromJson(json);
}
