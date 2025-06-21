import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/app.dart';
import 'package:lexigo/env/env_fields.dart';

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

        debugPrint('$appMode ready !!! ');

        runApp(ProviderScope(child: App()));
      },
      (error, stackTrace) => debugPrint(error.toString()),
    );
  }
}
