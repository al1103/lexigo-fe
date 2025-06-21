import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/common/routes/app_route.dart';
import 'package:lexigo/l10n/generated/l10n.dart';

class App extends ConsumerWidget {
  App({super.key});

  late final appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF13B9FF),
      ),
      localizationsDelegates: S.localizationsDelegates,
      supportedLocales: S.supportedLocales,
      routerConfig: appRouter.config(),
    );
  }
}
