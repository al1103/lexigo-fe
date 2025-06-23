import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_response.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_service.dart';
import 'package:lexigo/injection/di.dart';
import 'package:lexigo/screen/scan_objects/data/smart_word_repository.dart';
import 'package:lexigo/screen/scan_objects/models/smart_word_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'smart_word_repository_impl.g.dart';

class SmartWordRepositoryImpl implements SmartWordRepository {
  SmartWordRepositoryImpl(this.apiService);

  final ApiService apiService;
  @override
  Future<ApiResponse<SmartWord>> getWordDetails(String word) async {
    try {
      return await apiService.getWordDetails(word);
    } catch (e) {
      throw Exception('Failed to get word details: $e');
    }
  }
}

@Riverpod(keepAlive: true)
SmartWordRepositoryImpl smartWordRepositoryImpl(Ref ref) =>
    SmartWordRepositoryImpl(ref.read(apiServiceProvider));
