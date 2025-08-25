import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/common/routes/app_route.dart';
import 'package:lexigo/common/theme/theme_provider.dart';
import 'package:lexigo/common/widgets/common_tab_bar.dart';
import 'package:lexigo/common/widgets/loading_widget.dart';
import 'package:lexigo/core/infrastructure/service/notification_service.dart';
import 'package:lexigo/core/infrastructure/service/notification_settings_service.dart';
import 'package:lexigo/screen/profile/controller/profile_controller.dart';
import 'package:lexigo/screen/profile/edit_profile_screen.dart';
import 'package:lexigo/screen/profile/user_info_model.dart';

@RoutePage()
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  Future<void> _handleRefresh(WidgetRef ref) async {
    // Refresh profile data
    await ref.read(profileControllerProvider.notifier).refreshProfile();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileControllerProvider);

    return Scaffold(
      bottomNavigationBar: const CommonTabBar(),
      body: SafeArea(
        child: profileState.when(
          data: (userInfo) => _buildProfileContent(context, ref, userInfo),
          loading: () => const AppLoading(message: 'Đang tải hồ sơ...'),
          error: (error, stack) => _buildErrorContent(context, ref, error),
        ),
      ),
    );
  }

  Widget _buildErrorContent(BuildContext context, WidgetRef ref, Object error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(height: 16),
          Text(
            'Lỗi khi tải hồ sơ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).textTheme.titleLarge?.color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            error.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.color
                  ?.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              ref.read(profileControllerProvider.notifier).refreshProfile();
            },
            child: const Text('Thử lại'),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileContent(
    BuildContext context,
    WidgetRef ref,
    UserInfoModel? userInfo,
  ) {
    // Handle null userInfo
    if (userInfo == null) {
      return _buildErrorContent(context, ref, 'Không có dữ liệu hồ sơ');
    }

    return RefreshIndicator(
      onRefresh: () => _handleRefresh(ref),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Header Section
              _buildHeader(context),

              const SizedBox(height: 24),

              // User Profile Section with real data
              _buildUserProfileSection(userInfo),

              const SizedBox(height: 32),

              // Preferences Section
              _buildSectionHeader('Tùy chọn', Icons.settings),

              // Preference Items
              _buildThemePreferenceItem(ref),
              _buildNotificationSettingItem(ref),
              _buildPushNotificationSettingItem(ref),
              _buildSectionHeader('Tài khoản', Icons.account_circle),

              _buildAccountAction(context, ref, 'Chỉnh sửa hồ sơ', Icons.edit),
              _buildAccountAction(context, ref, 'Gửi phản hồi', Icons.feedback),
              _buildAccountAction(context, ref, 'Đăng xuất', Icons.logout),

              const SizedBox(height: 32),

              const SizedBox(height: 20), // Extra padding at bottom
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.settings,
              color: Theme.of(context).primaryColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'Hồ sơ & Cài đặt',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).textTheme.titleLarge?.color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserProfileSection(UserInfoModel userInfo) {
    return Builder(
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: Theme.of(context).brightness == Brightness.dark
                ? [
                    Theme.of(context).primaryColor.withValues(alpha: 0.2),
                    Theme.of(context).primaryColor.withValues(alpha: 0.1),
                  ]
                : [
                    const Color(0xFFE0E7FF),
                    const Color(0xFFF3E8FF),
                  ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withValues(alpha: 0.12),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            // Avatar
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 40,
                backgroundColor:
                    Theme.of(context).cardColor.withValues(alpha: 0.9),
                backgroundImage:
                    userInfo.avatarUrl != null && userInfo.avatarUrl!.isNotEmpty
                        ? NetworkImage(userInfo.avatarUrl!)
                        : null,
                child:
                    (userInfo.avatarUrl == null || userInfo.avatarUrl!.isEmpty)
                        ? Icon(
                            Icons.person,
                            color: Theme.of(context).primaryColor,
                            size: 40,
                          )
                        : null,
              ),
            ),
            const SizedBox(width: 20),
            // User Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userInfo.fullName ?? userInfo.username ?? 'Người dùng',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).textTheme.titleLarge?.color,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    userInfo.currentLevel ?? userInfo.level ?? 'Cấp độ 1',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.color
                          ?.withValues(alpha: 0.7),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // XP Progress
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).primaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Theme.of(context)
                            .primaryColor
                            .withValues(alpha: 0.2),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.stars,
                          color: Theme.of(context).primaryColor,
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '${userInfo.totalPoints ?? 0} XP',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Builder(
      builder: (context) => Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).textTheme.titleLarge?.color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountAction(
    BuildContext context,
    WidgetRef ref,
    String title,
    IconData icon,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () async {
            if (title == 'Chỉnh sửa hồ sơ') {
              final updated = await Navigator.of(context).push<bool>(
                MaterialPageRoute<bool>(
                  builder: (context) => const EditProfileScreen(),
                ),
              );
              if (updated ?? false) {
                await ref
                    .read(profileControllerProvider.notifier)
                    .refreshProfile();
              }
            } else if (title == 'Đăng xuất') {
              _showLogoutDialog(context, ref);
            } else {}
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: title == 'Đăng xuất'
                        ? Theme.of(context)
                            .colorScheme
                            .error
                            .withValues(alpha: 0.1)
                        : Theme.of(context).primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: title == 'Đăng xuất'
                        ? Theme.of(context).colorScheme.error
                        : Theme.of(context).primaryColor,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: title == 'Đăng xuất'
                          ? Theme.of(context).colorScheme.error
                          : Theme.of(context).textTheme.titleMedium?.color,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.color
                      ?.withValues(alpha: 0.5),
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildThemePreferenceItem(WidgetRef ref) {
    return Builder(
      builder: (context) {
        final themeNotifier = ref.watch(themeProvider.notifier);

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () => _showThemeDialog(context, ref),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF6366F1).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        themeNotifier.themeModeIcon,
                        color: const Color(0xFF6366F1),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Giao diện',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color:
                                  Theme.of(context).textTheme.bodyLarge?.color,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            themeNotifier.themeModeString,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.color
                                  ?.withValues(alpha: 0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.color
                          ?.withValues(alpha: 0.5),
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showLogoutDialog(BuildContext context, WidgetRef ref) {
    showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Xác nhận đăng xuất',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
          content: const Text(
            'Bạn có chắc chắn muốn đăng xuất khỏi tài khoản?',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF6B7280),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: const Text(
                'Hủy',
                style: TextStyle(
                  color: Color(0xFF6B7280),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(dialogContext).pop();
                await _handleLogout(context, ref);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Đăng xuất',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildNotificationSettingItem(WidgetRef ref) {
    return StatefulBuilder(
      builder: (context, setState) {
        final service = ref.read(notificationSettingsServiceProvider);
        final toastEnabled = service.isToastEnabled;

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withValues(alpha: 0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.message,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thông báo Toast',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).textTheme.titleMedium?.color,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Hiển thị thông báo phân tích ảnh',
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).textTheme.bodySmall?.color,
                      ),
                    ),
                  ],
                ),
              ),
              Switch(
                value: toastEnabled,
                onChanged: (bool value) async {
                  await service.setToastEnabled(value);
                  setState(() {}); // Refresh UI
                },
                activeColor: Theme.of(context).primaryColor,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPushNotificationSettingItem(WidgetRef ref) {
    return StatefulBuilder(
      builder: (context, setState) {
        final settingsService = ref.read(notificationSettingsServiceProvider);
        final pushEnabled = settingsService.isPushEnabled;

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withValues(alpha: 0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.notifications_active,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thông báo Push',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).textTheme.titleMedium?.color,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Nhận thông báo từ server',
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).textTheme.bodySmall?.color,
                      ),
                    ),
                  ],
                ),
              ),
              Switch(
                value: pushEnabled,
                onChanged: (bool value) async {
                  await settingsService.setPushEnabled(value);

                  // Enable/disable Firebase notifications
                  try {
                    final notificationService =
                        ref.read(notificationServiceProvider);
                    if (value) {
                      await notificationService.enablePushNotifications();
                    } else {
                      await notificationService.disablePushNotifications();
                    }
                  } catch (e) {
                    debugPrint('Error toggling push notifications: $e');
                  }

                  setState(() {}); // Refresh UI
                },
                activeColor: Theme.of(context).primaryColor,
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _handleLogout(BuildContext context, WidgetRef ref) async {
    // Hiển thị loading dialog
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext loadingContext) {
        return const AlertDialog(
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 16),
              Text('Đang đăng xuất...'),
            ],
          ),
        );
      },
    );

    try {
      // Điều hướng về màn hình đăng nhập và xóa tất cả các route trước đó
      if (context.mounted) {
        context.router.pushAndPopUntil(
          const SignInRoute(),
          predicate: (route) => false,
        );
      }
    } catch (e) {
      // Đóng loading dialog
      if (context.mounted) {
        Navigator.of(context).pop();
      }

      // Hiển thị thông báo lỗi nếu có
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Có lỗi xảy ra khi đăng xuất. Vui lòng thử lại.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _showThemeDialog(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeProvider.notifier);
    final currentTheme = ref.read(themeProvider);

    showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            'Chọn giao diện',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildThemeOption(
                context,
                title: 'Giao diện sáng',
                subtitle: 'Giao diện truyền thống với nền sáng',
                icon: Icons.light_mode,
                isSelected: currentTheme == AppThemeMode.light,
                onTap: () {
                  themeNotifier.setThemeMode(AppThemeMode.light);
                  Navigator.of(dialogContext).pop();
                },
              ),
              const SizedBox(height: 12),
              _buildThemeOption(
                context,
                title: 'Giao diện tối',
                subtitle: 'Giao diện tối dễ nhìn cho mắt',
                icon: Icons.dark_mode,
                isSelected: currentTheme == AppThemeMode.dark,
                onTap: () {
                  themeNotifier.setThemeMode(AppThemeMode.dark);
                  Navigator.of(dialogContext).pop();
                },
              ),
              const SizedBox(height: 12),
              _buildThemeOption(
                context,
                title: 'Theo hệ thống',
                subtitle: 'Tự động thay đổi theo cài đặt thiết bị',
                icon: Icons.brightness_auto,
                isSelected: currentTheme == AppThemeMode.system,
                onTap: () {
                  themeNotifier.setThemeMode(AppThemeMode.system);
                  Navigator.of(dialogContext).pop();
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: Text(
                'Đóng',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildThemeOption(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFF6366F1).withValues(alpha: 0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected
                  ? const Color(0xFF6366F1)
                  : Theme.of(context).dividerColor,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF6366F1)
                      : const Color(0xFF6366F1).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: isSelected ? Colors.white : const Color(0xFF6366F1),
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isSelected
                            ? const Color(0xFF6366F1)
                            : Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.color
                            ?.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
              if (isSelected)
                const Icon(
                  Icons.check_circle,
                  color: Color(0xFF6366F1),
                  size: 24,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDebugThemeItem(WidgetRef ref) {
    return Builder(
      builder: (context) {
        final themeNotifier = ref.watch(themeProvider.notifier);
        final currentTheme = ref.watch(themeProvider);

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.orange, width: 2),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withValues(alpha: 0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'DEBUG: Theme Status',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Current Theme: ${currentTheme.name}',
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ),
              Text(
                'Brightness: ${Theme.of(context).brightness.name}',
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        await themeNotifier.resetTheme();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Reset Theme'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        await themeNotifier.toggleTheme();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Toggle'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
