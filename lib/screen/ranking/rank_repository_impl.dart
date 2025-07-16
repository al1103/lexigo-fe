import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_response.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_service.dart';
import 'package:lexigo/screen/ranking/models/leaderboard_user.dart';
import 'package:lexigo/screen/ranking/repository/ranking_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rank_repository_impl.g.dart';

class RankingRepositoryImpl implements RankingRepository {
  const RankingRepositoryImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<ApiResponse<PayloadPageableDto<LeaderboardUser>>>
      getGlobalLeaderboard() async {
    final response = await _apiService.getGlobalLeaderboard();
    return response;
  }

  @override
  Future<ApiResponse<PayloadPageableDto<LeaderboardUser>>>
      getWeeklyLeaderboard() async {
    final response = await _apiService.getWeeklyLeaderboard();
    return response;
  }

  @override
  Future<ApiResponse<PayloadPageableDto<LeaderboardUser>>>
      getMonthlyLeaderboard() async {
    final response = await _apiService.getMonthlyLeaderboard();

    return response;
  }
}

@riverpod
RankingRepository rankingRepository(Ref ref) {
  return RankingRepositoryImpl(ref.watch(apiServiceProvider));
}
