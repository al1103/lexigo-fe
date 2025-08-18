import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Theme mode state
enum AppThemeMode { light, dark, system }

/// Theme provider để quản lý trạng thái theme của ứng dụng
class ThemeNotifier extends StateNotifier<AppThemeMode> {
  ThemeNotifier() : super(AppThemeMode.light) {
    _loadThemeMode();
  }

  static const String _themeModeKey = 'theme_mode';

  /// Load theme mode từ SharedPreferences
  Future<void> _loadThemeMode() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedThemeMode = prefs.getString(_themeModeKey);

      if (savedThemeMode != null) {
        switch (savedThemeMode) {
          case 'light':
            state = AppThemeMode.light;
          case 'dark':
            state = AppThemeMode.dark;
          case 'system':
            state = AppThemeMode.system;
        }
      }
    } catch (e) {
      // Nếu có lỗi, sử dụng theme mặc định
      state = AppThemeMode.light;
    }
  }

  /// Lưu theme mode vào SharedPreferences
  Future<void> _saveThemeMode(AppThemeMode mode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_themeModeKey, mode.name);
    } catch (e) {
      // Ignore save errors
    }
  }

  /// Chuyển đổi theme mode
  Future<void> setThemeMode(AppThemeMode mode) async {
    state = mode;
    await _saveThemeMode(mode);
  }

  /// Toggle giữa light và dark theme
  Future<void> toggleTheme() async {
    switch (state) {
      case AppThemeMode.light:
        await setThemeMode(AppThemeMode.dark);
      case AppThemeMode.dark:
        await setThemeMode(AppThemeMode.light);
      case AppThemeMode.system:
        await setThemeMode(AppThemeMode.light);
    }
  }

  /// Get ThemeMode cho MaterialApp
  ThemeMode get themeMode {
    switch (state) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }

  /// Get string representation cho UI
  String get themeModeString {
    switch (state) {
      case AppThemeMode.light:
        return 'Sáng';
      case AppThemeMode.dark:
        return 'Tối';
      case AppThemeMode.system:
        return 'Theo hệ thống';
    }
  }

  /// Get icon cho theme mode
  IconData get themeModeIcon {
    switch (state) {
      case AppThemeMode.light:
        return Icons.light_mode;
      case AppThemeMode.dark:
        return Icons.dark_mode;
      case AppThemeMode.system:
        return Icons.brightness_auto;
    }
  }

  /// Force reset theme mode (for debugging)
  Future<void> resetTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_themeModeKey);
      state = AppThemeMode.light;
    } catch (e) {
      state = AppThemeMode.light;
    }
  }
}

/// Provider cho theme notifier
final themeProvider = StateNotifierProvider<ThemeNotifier, AppThemeMode>(
  (ref) => ThemeNotifier(),
);

/// Provider để get ThemeMode
final themeModeProvider = Provider<ThemeMode>((ref) {
  final themeNotifier = ref.watch(themeProvider.notifier);
  return themeNotifier.themeMode;
});
