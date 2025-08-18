import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/common/routes/app_route.dart';
import 'package:lexigo/common/theme/app_theme.dart';
import 'package:lexigo/common/theme/theme_provider.dart';
import 'package:lexigo/common/utils/toast_helper.dart';
import 'package:lexigo/core/infrastructure/service/notification_service.dart';
import 'package:lexigo/core/infrastructure/service/notification_settings_service.dart';
import 'package:lexigo/firebase_options.dart';
import 'package:lexigo/l10n/generated/l10n.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  late final AppRouter appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Initialize services
    final notificationSettingsService =
        ref.read(notificationSettingsServiceProvider);
    ToastHelper.initialize(notificationSettingsService);
    NotificationService.initializeWithSettings(notificationSettingsService);

    // Initialize Firebase
    await _initializeFirebase();
  }

  Future<void> _initializeFirebase() async {
    try {
      // Initialize Firebase with options
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      // Set background message handler
      NotificationService.setBackgroundMessageHandler();

      // Initialize notification service
      final notificationService = ref.read(notificationServiceProvider);
      await notificationService.initialize();

      // Setup foreground notification handler
      notificationService.setupForegroundNotificationHandler(
        onMessageReceived: _showNotification,
      );

      // Setup background notification handler
      notificationService.setupBackgroundNotificationHandler(
        onMessageOpenedApp: _handleNotificationTap,
      );

      // Handle initial message
      await notificationService.handleInitialMessage(
        onInitialMessage: _handleNotificationTap,
      );
    } catch (e) {
      debugPrint('Firebase initialization error: $e');
    }
  }

  void _showNotification(RemoteMessage message) {
    // Handle foreground notification display
    final notification = message.notification;
    if (notification != null) {
      debugPrint('Notification: ${notification.title} - ${notification.body}');

      // Show snackbar for foreground notifications
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (notification.title != null)
                  Text(
                    notification.title!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                if (notification.body != null)
                  Text(
                    notification.body!,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
              ],
            ),
            backgroundColor: const Color(0xFF6366F1),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.all(16),
          ),
        );
      }
    }
  }

  void _handleNotificationTap(RemoteMessage message) {
    // Handle notification tap - navigate to specific screen based on data
    final data = message.data;
    debugPrint('Notification data: $data');

    // Example: Navigate based on notification type
    if (data.containsKey('type')) {
      switch (data['type']) {
        case 'lesson':
          // Navigate to lesson screen
          debugPrint('Navigate to lesson screen');
        case 'speaking':
          // Navigate to speaking screen
          debugPrint('Navigate to speaking screen');
        case 'quiz':
          // Navigate to quiz screen
          debugPrint('Navigate to quiz screen');
        case 'profile':
          // Navigate to profile screen
          debugPrint('Navigate to profile screen');
        default:
          // Navigate to home or default screen
          debugPrint('Navigate to home screen');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: 'Lexigo',
      theme: AppTheme.lightTheme(context),
      darkTheme: AppTheme.darkTheme(context),
      themeMode: themeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: appRouter.config(),
    );
  }
}
