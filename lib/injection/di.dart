import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/common/routes/app_route.dart';
import 'package:lexigo/core/infrastructure/datasource/local/shared_preferences_manager.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'di.g.dart';

// Core
@Riverpod(keepAlive: true)
Raw<AppRouter> appRouter(Ref ref) => AppRouter();

@Riverpod(keepAlive: true)
ApiService apiService(Ref ref) => ApiService(ref);

// @Riverpod()
// SecuredStorageService securedStorageService(Ref ref) => SecuredStorageService();

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError();
}

@Riverpod()
SharedPreferencesManager sharedPreferencesManager(Ref ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  return SharedPreferencesManager(pref: sharedPrefs);
}

// Auth Example
// @Riverpod()
// AuthRepository authRepository(Ref ref) => AuthRepositoryImpl(
//       ref.watch(apiServiceProvider),
//       ref.watch(securedStorageServiceProvider),
//       ref.watch(sharedPreferencesManagerProvider),
//     );

// Feed
