import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http; // Thêm 'as http'
import 'package:lexigo/core/services/network_service.dart';
import 'package:lexigo/screen/chat/data/chat_repository_impl.dart';
import 'package:lexigo/screen/chat/exceptions/network_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_controller.g.dart';

@riverpod
class ChatController extends _$ChatController {
  @override
  FutureOr<String?> build() {
    return null;
  }

  Future<String?> chatAI(String message, {bool? isReset}) async {
    print('🚀 ChatController.chatAI called with:');
    print(
      '   Message: ${message.substring(0, message.length.clamp(0, 100))}...',
    );
    print('   isReset: $isReset');

    // Check network connectivity first
    final networkService = ref.read(networkServiceProvider);
    final hasConnection = await networkService.hasConnection();

    if (!hasConnection) {
      print('❌ No network connection available');
      throw const NetworkException(
        'Không có kết nối internet. Vui lòng kiểm tra kết nối và thử lại.',
        NetworkErrorType.noConnection,
      );
    }

    try {
      final response = await ref.read(chatRepositoryProvider).chatAI(
            message,
            isReset: isReset,
          );

      print(
        '✅ ChatController received response: ${response.substring(0, response.length.clamp(0, 100))}...',
      );
      return response;
    } on SocketException catch (e) {
      print('❌ No internet connection: $e');
      throw const NetworkException(
        'Không có kết nối internet',
        NetworkErrorType.noConnection,
      );
    } on TimeoutException catch (e) {
      print('❌ Connection timeout: $e');
      throw const NetworkException(
        'Kết nối quá chậm hoặc hết thời gian chờ',
        NetworkErrorType.timeout,
      );
    } on HttpException catch (e) {
      print('❌ HTTP error: $e');
      throw const NetworkException(
        'Lỗi kết nối máy chủ',
        NetworkErrorType.serverError,
      );
    } on FormatException catch (e) {
      print('❌ Data format error: $e');
      throw const NetworkException(
        'Dữ liệu trả về không hợp lệ',
        NetworkErrorType.badResponse,
      );
    } catch (e) {
      print('❌ Unknown error: $e');

      // Kiểm tra nếu là network-related errors khác
      final errorMessage = e.toString().toLowerCase();
      if (errorMessage.contains('network') ||
          errorMessage.contains('connection') ||
          errorMessage.contains('host')) {
        throw const NetworkException(
          'Lỗi kết nối mạng',
          NetworkErrorType.noConnection,
        );
      } else if (errorMessage.contains('timeout')) {
        throw const NetworkException(
          'Kết nối quá chậm',
          NetworkErrorType.timeout,
        );
      } else if (errorMessage.contains('500') ||
          errorMessage.contains('502') ||
          errorMessage.contains('503')) {
        throw const NetworkException(
          'Máy chủ đang bảo trì',
          NetworkErrorType.serverError,
        );
      } else {
        throw NetworkException(
          'Có lỗi xảy ra: $e',
          NetworkErrorType.unknown,
        );
      }
    }
  }

  Future<String> fetchTranslatedText(String text) async {
    try {
      // Use Google Translate's internal API endpoint instead of web scraping
      Uri.encodeComponent(text);
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
