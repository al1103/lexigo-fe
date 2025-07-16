import 'package:lexigo/core/infrastructure/datasource/remote/api_response.dart';
import 'package:lexigo/screen/ranking/models/my_rank.dart';

abstract class MyRankRepository {
  Future<ApiResponse<MyRank>> getMyAllRankings();
}
