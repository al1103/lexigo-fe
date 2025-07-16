import 'package:lexigo/core/infrastructure/datasource/remote/api_response.dart';
import 'package:lexigo/screen/home/model/quotes_model.dart';

abstract class QuotesRepository {
  Future<ApiResponse<QuotesModel>> getDailyQuotes();
}
