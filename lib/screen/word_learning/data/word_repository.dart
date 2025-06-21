import 'package:lexigo/core/infrastructure/datasource/remote/api_response.dart';
import 'package:lexigo/screen/word_learning/model/lessons_detail.dart';
import 'package:lexigo/screen/word_learning/word_model.dart';

mixin WordRepository {
  Future<WordModel> getWords(
    int? limit,
  );
  Future<ApiResponse<PayloadPageableDto<LessonsDetail>>> getLessonDetails(
    int id,
  );
}
