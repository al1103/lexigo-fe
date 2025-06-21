import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_response.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_service.dart';
import 'package:lexigo/injection/di.dart';
import 'package:lexigo/screen/word_learning/data/word_repository.dart';
import 'package:lexigo/screen/word_learning/model/lessons_detail.dart';
import 'package:lexigo/screen/word_learning/word_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'word_repository_impl.g.dart';

class WordRepositoryImpl implements WordRepository {
  WordRepositoryImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<ApiResponse<PayloadPageableDto<LessonsDetail>>> getLessonDetails(
    int id,
  ) async {
    final response = await apiService.getLessonDetails(
      id,
    );
    return response;
  }

  @override
  Future<WordModel> getWords(int? limit) {
    throw UnimplementedError();
  }
}

@Riverpod(keepAlive: true)
WordRepositoryImpl wordRepositoryImpl(Ref ref) =>
    WordRepositoryImpl(ref.read(apiServiceProvider));
