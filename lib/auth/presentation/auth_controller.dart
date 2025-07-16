import 'package:lexigo/auth/infrastructure/auth_repository_impl.dart';
import 'package:lexigo/auth/infrastructure/token_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {
    return null;
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        final token = await ref.read(authRepositoryProvider).signIn(
              email,
              password,
            );

        // Lưu token vào SharedPreferences
        await ref.read(tokenServiceProvider).saveToken(token);
      },
    );
  }
}
