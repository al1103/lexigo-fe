import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences_manager.g.dart';

/// Riverpod provider cho SharedPreferencesManager (singleton, giữ sống)
@Riverpod(keepAlive: true)
Future<SharedPreferencesManager> sharedPreferencesManager(
  SharedPreferencesManagerRef ref,
) async {
  final pref = await SharedPreferences.getInstance();
  return SharedPreferencesManager(pref: pref);
}

/// Wrapper quanh SharedPreferences để dễ mock/test và mở rộng
class SharedPreferencesManager {
  SharedPreferencesManager({required this.pref});

  final SharedPreferences pref;

  // Save data
  Future<bool> putString(String key, String value) =>
      pref.setString(key, value);
  Future<bool> putInt(String key, int value) => pref.setInt(key, value);
  Future<bool> putBool(String key, bool value) => pref.setBool(key, value);
  Future<bool> putStringList(String key, List<String> value) =>
      pref.setStringList(key, value);

  // Get data
  String? getString(String key) => pref.getString(key);
  int? getInt(String key) => pref.getInt(key);
  bool? getBool(String key) => pref.getBool(key);
  List<String>? getStringList(String key) => pref.getStringList(key);

  // Remove key
  Future<bool> remove(String key) => pref.remove(key);
}
