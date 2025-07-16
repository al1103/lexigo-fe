import 'package:lexigo/core/infrastructure/datasource/remote/api_response.dart';
import 'package:lexigo/screen/level_selection/model/lessons_model.dart';
import 'package:lexigo/screen/speaking/data/speaking_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vocabulary_level_controller.g.dart';

@riverpod
class VocabularyLevelController extends _$VocabularyLevelController {
  @override
  FutureOr<PayloadPageableDto<LessonsModel>> build() async {
    return await getLevelVocabulary();
  }

  Future<PayloadPageableDto<LessonsModel>> getLevelVocabulary() async {
    final response =
        await ref.read(speakingRepositoryProvider).getLevelVocabulary();
    return response.data ?? const PayloadPageableDto<LessonsModel>();
  }
}
