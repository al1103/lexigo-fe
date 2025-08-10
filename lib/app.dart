import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/common/routes/app_route.dart';
import 'package:lexigo/core/infrastructure/service/notification_service.dart';
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
    _initializeFirebase();
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
    return MaterialApp.router(
      title: 'Lexigo',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF6366F1),
        fontFamily: 'Inter',
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Color(0xFF1F2937),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 2,
            shadowColor: const Color(0xFF6366F1).withValues(alpha: 0.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          shadowColor: Colors.black.withValues(alpha: 0.05),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFFAFAFA),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.grey.withValues(alpha: 0.2),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.grey.withValues(alpha: 0.2),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xFF6366F1),
              width: 2,
            ),
          ),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: appRouter.config(),
    );
  }
}
