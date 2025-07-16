import 'package:lexigo/screen/home/data/quotes_repository_impl.dart';
import 'package:lexigo/screen/home/model/quotes_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quotes_controller.g.dart';

@riverpod
class QuotesController extends _$QuotesController {
  @override
  FutureOr<QuotesModel?> build() async {
    return _loadQuotes();
  }

  Future<QuotesModel?> _loadQuotes() async {
    final response = await ref.read(quotesRepositoryProvider).getDailyQuotes();

    return response.data;
  }
}
