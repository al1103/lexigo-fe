class NetworkException implements Exception {
  const NetworkException(this.message, this.type);

  final String message;
  final NetworkErrorType type;

  @override
  String toString() => 'NetworkException: $message (Type: $type)';
}

enum NetworkErrorType {
  noConnection,
  timeout,
  serverError,
  badResponse,
  unknown,
}

extension NetworkErrorTypeExtension on NetworkErrorType {
  String get displayMessage {
    switch (this) {
      case NetworkErrorType.noConnection:
        return 'Không có kết nối mạng. Vui lòng kiểm tra kết nối và thử lại.';
      case NetworkErrorType.timeout:
        return 'Kết nối quá chậm. Vui lòng thử lại sau.';
      case NetworkErrorType.serverError:
        return 'Máy chủ đang gặp sự cố. Vui lòng thử lại sau.';
      case NetworkErrorType.badResponse:
        return 'Dữ liệu trả về không hợp lệ. Vui lòng thử lại.';
      case NetworkErrorType.unknown:
        return 'Có lỗi xảy ra. Vui lòng thử lại.';
    }
  }

  String get userActionMessage {
    switch (this) {
      case NetworkErrorType.noConnection:
        return 'Kiểm tra WiFi hoặc dữ liệu di động';
      case NetworkErrorType.timeout:
        return 'Thử kết nối mạng khác';
      case NetworkErrorType.serverError:
        return 'Đợi vài phút rồi thử lại';
      case NetworkErrorType.badResponse:
        return 'Liên hệ hỗ trợ nếu lỗi lặp lại';
      case NetworkErrorType.unknown:
        return 'Khởi động lại ứng dụng nếu cần';
    }
  }
}
