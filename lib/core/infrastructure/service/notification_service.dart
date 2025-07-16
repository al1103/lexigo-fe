import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider for notification service
final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});

class NotificationService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static String? _fcmToken;

  // Initialize notifications
  Future<void> initialize() async {
    try {
      // Request permission with detailed settings
      final settings = await _messaging.requestPermission();

      debugPrint('Notification permission: ${settings.authorizationStatus}');

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        debugPrint('User granted permission');
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
        debugPrint('User granted provisional permission');
      } else {
        debugPrint('User declined or has not accepted permission');
        return;
      }

      // Get and store FCM token
      await _refreshToken();

      // Subscribe to default topic
      await subscribeToTopic('lexigo_users');

      // Listen for token refresh
      _messaging.onTokenRefresh.listen((newToken) {
        debugPrint('FCM Token refreshed: $newToken');
        _fcmToken = newToken;
        // TODO: Send new token to server
        _sendTokenToServer(newToken);
      });
    } catch (e) {
      debugPrint('Error initializing notifications: $e');
    }
  }

  // Refresh FCM token
  Future<void> _refreshToken() async {
    try {
      _fcmToken = await _messaging.getToken();
      debugPrint('FCM Token: $_fcmToken');

      if (_fcmToken != null) {
        // TODO: Send token to your server
        await _sendTokenToServer(_fcmToken!);
      }
    } catch (e) {
      debugPrint('Error getting FCM token: $e');
    }
  }

  // Send token to server
  Future<void> _sendTokenToServer(String token) async {
    try {
      // TODO: Implement API call to send token to your server
      debugPrint('Sending token to server: $token');

      // Example:
      // final api = ref.read(apiServiceProvider);
      // await api.updateFcmToken(token);
    } catch (e) {
      debugPrint('Error sending token to server: $e');
    }
  }

  // Get current FCM token
  Future<String?> getToken() async {
    if (_fcmToken != null) {
      return _fcmToken;
    }

    try {
      _fcmToken = await _messaging.getToken();
      return _fcmToken;
    } catch (e) {
      debugPrint('Error getting token: $e');
      return null;
    }
  }

  // Subscribe to topic
  Future<void> subscribeToTopic(String topic) async {
    try {
      await _messaging.subscribeToTopic(topic);
      debugPrint('Subscribed to topic: $topic');
    } catch (e) {
      debugPrint('Error subscribing to topic $topic: $e');
    }
  }

  // Unsubscribe from topic
  Future<void> unsubscribeFromTopic(String topic) async {
    try {
      await _messaging.unsubscribeFromTopic(topic);
      debugPrint('Unsubscribed from topic: $topic');
    } catch (e) {
      debugPrint('Error unsubscribing from topic $topic: $e');
    }
  }

  // Handle notification when app is in foreground
  void setupForegroundNotificationHandler({
    required Function(RemoteMessage) onMessageReceived,
  }) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Foreground message received: ${message.messageId}');
      debugPrint('Title: ${message.notification?.title}');
      debugPrint('Body: ${message.notification?.body}');
      debugPrint('Data: ${message.data}');

      onMessageReceived(message);
    });
  }

  // Handle notification tap when app is in background
  void setupBackgroundNotificationHandler({
    required Function(RemoteMessage) onMessageOpenedApp,
  }) {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('Notification tapped (background): ${message.messageId}');
      debugPrint('Data: ${message.data}');

      onMessageOpenedApp(message);
    });
  }

  // Handle notification tap when app is terminated
  Future<void> handleInitialMessage({
    required Function(RemoteMessage) onInitialMessage,
  }) async {
    try {
      final initialMessage = await _messaging.getInitialMessage();
      if (initialMessage != null) {
        debugPrint(
          'App opened from notification (terminated): ${initialMessage.messageId}',
        );
        debugPrint('Data: ${initialMessage.data}');

        onInitialMessage(initialMessage);
      }
    } catch (e) {
      debugPrint('Error handling initial message: $e');
    }
  }

  // Set background message handler
  static void setBackgroundMessageHandler() {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  // Clear notification badge (iOS)
  Future<void> clearBadge() async {
    try {
      await _messaging.setForegroundNotificationPresentationOptions(
        alert: true,
        sound: true,
      );
    } catch (e) {
      debugPrint('Error clearing badge: $e');
    }
  }

  // Delete FCM token (for logout)
  Future<void> deleteToken() async {
    try {
      await _messaging.deleteToken();
      _fcmToken = null;
      debugPrint('FCM Token deleted');
    } catch (e) {
      debugPrint('Error deleting token: $e');
    }
  }
}

// Background message handler
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint('Background message received: ${message.messageId}');

  final notification = message.notification;
  if (notification != null) {
    debugPrint(
      'Background notification: ${notification.title} - ${notification.body}',
    );
  }

  final data = message.data;
  if (data.isNotEmpty) {
    debugPrint('Background notification data: $data');

    // Handle specific data actions
    if (data.containsKey('action')) {
      switch (data['action']) {
        case 'lesson_reminder':
          debugPrint('Lesson reminder received in background');
        case 'speaking_practice':
          debugPrint('Speaking practice reminder received in background');
        case 'quiz_available':
          debugPrint('New quiz available notification received in background');
        default:
          debugPrint('Unknown action: ${data['action']}');
      }
    }
  }
}
