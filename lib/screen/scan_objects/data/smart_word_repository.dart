import 'package:lexigo/core/infrastructure/datasource/remote/api_response.dart';
import 'package:lexigo/screen/scan_objects/models/smart_word_model.dart';

mixin SmartWordRepository {
  Future<ApiResponse<SmartWord>> getWordDetails(String word);
}
