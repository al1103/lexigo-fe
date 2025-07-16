import 'package:lexigo/core/infrastructure/datasource/remote/api_response.dart';
import 'package:lexigo/product/domain/vocabulary_model.dart';
import 'package:lexigo/screen/speaking/data/speaking_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vocabulary_level_detail_controller.g.dart';

@riverpod
class VocabularyLevelDetailController
    extends _$VocabularyLevelDetailController {
  @override
  FutureOr<PayloadPageableDto<VocabularyModel>> build(String level) async {
    return await getLevelVocabularyDetails(
      level,
    );
  }

  Future<PayloadPageableDto<VocabularyModel>> getLevelVocabularyDetails(
    String level,
  ) async {
    final response =
        await ref.read(speakingRepositoryProvider).getLevelVocabularyDetails(
              level,
            );
    return response.data ?? const PayloadPageableDto<VocabularyModel>();
  }
}
