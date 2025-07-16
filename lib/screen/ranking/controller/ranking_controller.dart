import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/screen/ranking/models/leaderboard_user.dart';
import 'package:lexigo/screen/ranking/rank_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ranking_controller.g.dart';

@riverpod
class RankingController extends _$RankingController {
  @override
  FutureOr<List<LeaderboardUser>> build() {
    return fetchGlobalLeaderboard();
  }

  Future<List<LeaderboardUser>> fetchGlobalLeaderboard() async {
    try {
      final response =
          await ref.read(rankingRepositoryProvider).getGlobalLeaderboard();

      // Extract data from PayloadPageableDto
      return response.data?.contents ?? [];
    } catch (e) {
      return [];
    }
  }

  Future<List<LeaderboardUser>> getWeeklyLeaderboard() async {
    try {
      final response =
          await ref.read(rankingRepositoryProvider).getWeeklyLeaderboard();
      return response.data?.contents ?? [];
    } catch (e) {
      return [];
    }
  }

  Future<List<LeaderboardUser>> getMonthlyLeaderboard() async {
    try {
      final response =
          await ref.read(rankingRepositoryProvider).getMonthlyLeaderboard();
      return response.data?.contents ?? [];
    } catch (e) {
      return [];
    }
  }
}
