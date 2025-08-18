import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lexigo/core/infrastructure/service/notification_settings_service.dart';

/// Helper class để hiển thị toast với kiểm tra settings
class ToastHelper {
  static NotificationSettingsService? _service;

  /// Khởi tạo service
  static void initialize(NotificationSettingsService service) {
    _service = service;
  }

  /// Hiển thị toast thông báo lỗi
  static void showError(String message) {
    if (_service == null || !_service!.isToastEnabled) return;

    _showToast(
      message: message,
      backgroundColor: Colors.red,
      icon: '❌',
    );
  }

  /// Hiển thị toast thông báo cảnh báo
  static void showWarning(String message) {
    if (_service == null || !_service!.isToastEnabled) return;

    _showToast(
      message: message,
      backgroundColor: Colors.orange,
      icon: '⚠️',
    );
  }

  /// Hiển thị toast thông báo thành công
  static void showSuccess(String message) {
    if (_service == null || !_service!.isToastEnabled) return;

    _showToast(
      message: message,
      backgroundColor: Colors.green,
      icon: '✅',
    );
  }

  /// Hiển thị toast thông báo thông thường
  static void showInfo(String message) {
    if (_service == null || !_service!.isToastEnabled) return;

    _showToast(
      message: message,
      backgroundColor: Colors.blue,
      icon: 'ℹ️',
    );
  }

  /// Hiển thị toast tùy chỉnh
  static void showCustom({
    required String message,
    required Color backgroundColor,
    String? icon,
    Toast length = Toast.LENGTH_LONG,
  }) {
    if (_service == null || !_service!.isToastEnabled) return;

    _showToast(
      message: message,
      backgroundColor: backgroundColor,
      icon: icon,
      length: length,
    );
  }

  /// Helper method để hiển thị toast
  static void _showToast({
    required String message,
    required Color backgroundColor,
    String? icon,
    Toast length = Toast.LENGTH_LONG,
  }) {
    final displayMessage = icon != null ? '$icon $message' : message;

    Fluttertoast.showToast(
      msg: displayMessage,
      toastLength: length,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: length == Toast.LENGTH_SHORT ? 2 : 3,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16,
      webBgColor: backgroundColor.toString(),
      webPosition: 'center',
    );
  }

  /// Kiểm tra xem toast có được bật không
  static bool get isEnabled => _service?.isToastEnabled ?? true;

  /// Bật/tắt toast notifications
  static Future<void> setEnabled(bool enabled) async {
    await _service?.setToastEnabled(enabled);
  }
}

/// Extension cho WidgetRef để dễ sử dụng ToastHelper
extension ToastExtension on WidgetRef {
  /// Hiển thị toast lỗi với kiểm tra settings
  void showErrorToast(String message) {
    ToastHelper.showError(message);
  }

  /// Hiển thị toast cảnh báo với kiểm tra settings
  void showWarningToast(String message) {
    ToastHelper.showWarning(message);
  }

  /// Hiển thị toast thành công với kiểm tra settings
  void showSuccessToast(String message) {
    ToastHelper.showSuccess(message);
  }

  /// Hiển thị toast thông tin với kiểm tra settings
  void showInfoToast(String message) {
    ToastHelper.showInfo(message);
  }
}
