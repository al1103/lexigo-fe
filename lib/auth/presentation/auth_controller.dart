import 'package:lexigo/auth/domain/sign_up_request.dart';
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

  Future<void> forgotPassword(String email) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        await ref.read(authRepositoryProvider).forgotPassword(email);
      },
    );
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        // Xóa token khỏi SharedPreferences
        await ref.read(tokenServiceProvider).clearToken();
      },
    );
  }

  Future<SignUpResponse?> signUp(
    String username,
    String email,
    String password,
    String fullName,
  ) async {
    state = const AsyncLoading();
    try {
      final response = await ref
          .read(authRepositoryProvider)
          .signUp(username, email, password, fullName);
      state = const AsyncData(null);
      return response;
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
      return null;
    }
  }

  Future<SignUpResponse?> verifyRegistration(String email, String code) async {
    state = const AsyncLoading();
    try {
      final response = await ref
          .read(authRepositoryProvider)
          .verifyRegistration(email, code);
      state = const AsyncData(null);
      return response;
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      return null;
    }
  }
}
