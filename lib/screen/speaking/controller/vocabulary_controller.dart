import 'package:lexigo/core/infrastructure/datasource/remote/api_response.dart';
import 'package:lexigo/product/domain/vocabulary_model.dart';
import 'package:lexigo/screen/speaking/data/speaking_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vocabulary_controller.g.dart';

@riverpod
class VocabularyController extends _$VocabularyController {
  @override
  FutureOr<PayloadPageableDto<VocabularyModel>> build(
    String? search,
    int? page,
  ) async {
    return await _fetchVocabulary(search, page);
  }

  Future<PayloadPageableDto<VocabularyModel>> _fetchVocabulary(
    String? search,
    int? page,
  ) async {
    final response =
        await ref.read(speakingRepositoryProvider).getVocabulary(search, page);

    if (response.data != null) {
      return response.data!;
    } else {
      // Return empty data structure if no data
      return const PayloadPageableDto<VocabularyModel>(
        contents: [],
      );
    }
  }

  Future<void> getVocabulary(
    String? search,
    int? page,
  ) async {
    state = const AsyncValue.loading();

    try {
      final result = await _fetchVocabulary(search, page);
      state = AsyncValue.data(result);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      rethrow;
    }
  }

  Future<void> refreshVocabulary(String? search, int? page) async {
    ref.invalidateSelf();
    await getVocabulary(search, page);
  }

  Future<void> searchVocabulary(String searchTerm) async {
    await getVocabulary(searchTerm, 1);
  }

  Future<void> loadMoreVocabulary(String? search, int nextPage) async {
    final currentState = state.value;
    if (currentState == null) return;

    try {
      final response = await ref
          .read(speakingRepositoryProvider)
          .getVocabulary(search, nextPage);

      // if (response.contents != null) {
      //   final newData = response.contents!;

      //   // Merge with existing data
      //   final mergedData = PayloadPageableDto<VocabularyModel>(
      //     contents: [...currentState.contents, ...newData.contents],
      //     pagination: newData.pagination,
      //   );

      //   state = AsyncValue.data(mergedData);
      // }
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
