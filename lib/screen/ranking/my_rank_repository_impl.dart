import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_response.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_service.dart';
import 'package:lexigo/screen/ranking/models/my_rank.dart';
import 'package:lexigo/screen/ranking/repository/my_rank_repository.dart';

class MyRankRepositoryImpl implements MyRankRepository {
  const MyRankRepositoryImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<ApiResponse<MyRank>> getMyAllRankings() async {
    try {
      final response = await _apiService.getMyAllRankings();

      if (response.data != null) {
        final myRank = MyRank.fromJson(response.data as Map<String, dynamic>);
        return ApiResponse(
          data: myRank,
          message: response.message,
          status: response.status,
        );
      }

      return const ApiResponse(
        message: 'No ranking data available',
        status: 'error',
      );
    } catch (error) {
      return ApiResponse(
        message: 'Failed to fetch user rankings: $error',
        status: 'error',
      );
    }
  }
}

// Provider
final myRankRepositoryProvider = Provider<MyRankRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return MyRankRepositoryImpl(apiService);
});
