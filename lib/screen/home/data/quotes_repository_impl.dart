import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_response.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_service.dart';
import 'package:lexigo/screen/home/model/quotes_model.dart';
import 'package:lexigo/screen/home/model/quotes_repository.dart';

class QuotesRepositoryImpl implements QuotesRepository {
  QuotesRepositoryImpl(this._apiService);
  final ApiService _apiService;

  @override
  Future<ApiResponse<QuotesModel>> getDailyQuotes() async {
    try {
      return await _apiService.getDailyQuotes();
    } catch (e) {
      rethrow;
    }
  }
}

// Provider
final quotesRepositoryProvider = Provider<QuotesRepository>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return QuotesRepositoryImpl(apiService);
});
