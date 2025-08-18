import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/app.dart';
import 'package:lexigo/core/infrastructure/service/notification_settings_service.dart';
import 'package:lexigo/env/env_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract base class Env implements EnvFields {
  Env() {
    instance = this;
    _init();
  }

  static late Env instance;

  Future<void> _init() async {
    await runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();

        // Initialize SharedPreferences
        final prefs = await SharedPreferences.getInstance();

        // Create overrides for providers
        final container = ProviderContainer(
          overrides: [
            notificationSettingsServiceProvider.overrideWithValue(
              NotificationSettingsService(prefs),
            ),
          ],
        );

        debugPrint('$appMode ready !!! ');

        runApp(
          UncontrolledProviderScope(
            container: container,
            child: const App(),
          ),
        );
      },
      (error, stackTrace) => debugPrint(error.toString()),
    );
  }
}
