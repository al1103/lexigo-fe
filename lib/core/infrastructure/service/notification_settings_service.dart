import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Service để quản lý cài đặt thông báo
class NotificationSettingsService {
  NotificationSettingsService(this._prefs);
  static const String _toastEnabledKey = 'toast_notifications_enabled';
  static const String _pushEnabledKey = 'push_notifications_enabled';

  final SharedPreferences _prefs;

  /// Kiểm tra xem toast notifications có được bật không
  bool get isToastEnabled {
    return _prefs.getBool(_toastEnabledKey) ?? true; // Mặc định bật
  }

  /// Kiểm tra xem push notifications có được bật không
  bool get isPushEnabled {
    return _prefs.getBool(_pushEnabledKey) ?? true; // Mặc định bật
  }

  /// Bật/tắt toast notifications
  Future<void> setToastEnabled(bool enabled) async {
    await _prefs.setBool(_toastEnabledKey, enabled);
  }

  /// Bật/tắt push notifications
  Future<void> setPushEnabled(bool enabled) async {
    await _prefs.setBool(_pushEnabledKey, enabled);
  }

  /// Reset về cài đặt mặc định
  Future<void> resetToDefaults() async {
    await _prefs.setBool(_toastEnabledKey, true);
    await _prefs.setBool(_pushEnabledKey, true);
  }
}

/// Provider cho NotificationSettingsService
final notificationSettingsServiceProvider =
    Provider<NotificationSettingsService>((ref) {
  throw UnimplementedError(
    'NotificationSettingsService must be initialized in main()',
  );
});

/// StateProvider để theo dõi trạng thái toast notifications
final toastEnabledProvider = StateProvider<bool>((ref) {
  final service = ref.watch(notificationSettingsServiceProvider);
  return service.isToastEnabled;
});

/// StateProvider để theo dõi trạng thái push notifications
final pushEnabledProvider = StateProvider<bool>((ref) {
  final service = ref.watch(notificationSettingsServiceProvider);
  return service.isPushEnabled;
});
