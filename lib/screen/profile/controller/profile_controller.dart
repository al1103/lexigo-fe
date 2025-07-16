import 'package:lexigo/screen/profile/data/profile_repository_impl.dart';
import 'package:lexigo/screen/profile/user_info_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_controller.g.dart';

@riverpod
class ProfileController extends _$ProfileController {
  @override
  FutureOr<UserInfoModel?> build() async {
    return _loadUserProfile();
  }

  Future<UserInfoModel?> _loadUserProfile() async {
    final repository = ref.read(profileRepositoryProvider);
    final response = await repository.getUserProfile();

    return response.data;
  }

  Future<void> refreshProfile() async {
    state = const AsyncLoading<UserInfoModel?>();
    state = await AsyncValue.guard(_loadUserProfile);
  }

  Future<void> updateProfile({
    String? fullName,
    String? username,
    String? email,
    String? avatarUrl, // Add avatarUrl if your model supports it
  }) async {
    try {
      final repository = ref.read(profileRepositoryProvider);

      // Call update API
      await repository.updateUserProfile(
        username: username,
        fullName: fullName,
        email: email,
        avatarUrl: avatarUrl, // Ensure your repository supports this
      );

      // Refresh profile data
      await refreshProfile();
    } catch (e) {
      rethrow;
    }
  }
}
