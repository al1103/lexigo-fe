import 'package:http/http.dart' as http; // Thêm 'as http'
import 'package:lexigo/screen/chat/data/chat_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_controller.g.dart';

@riverpod
class ChatController extends _$ChatController {
  @override
  FutureOr<String?> build() {
    return null;
  }

  Future<String?> chatAI(String message, {bool? isReset}) async {
    final response = await ref.read(chatRepositoryProvider).chatAI(
          message,
          isReset: isReset,
        );

    return response;
  }

  Future<String> fetchTranslatedText(String text) async {
    try {
      // Use Google Translate's internal API endpoint instead of web scraping
      final encodedText = Uri.encodeComponent(text);
      final response = await http.get(
        Uri.parse(
          'https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=vi&dt=t&q=hello',
        ),
        headers: {
          'User-Agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
        },
      );

      if (response.statusCode == 200) {
        // Parse the JSON response
        final body = response.body;

        // The response is a nested array, extract the translated text
        final regExp = RegExp(r'\[\[\["([^"]+)"');
        final match = regExp.firstMatch(body);

        if (match != null && match.group(1) != null) {
          return match.group(1)!;
        } else {
          return 'Không thể dịch văn bản';
        }
      } else {
        return 'Lỗi kết nối: ${response.statusCode}';
      }
    } catch (e) {
      return 'Lỗi dịch thuật: $e';
    }
  }
}
