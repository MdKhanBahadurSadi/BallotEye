import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ballot_eye/core/providers/firebase_providers.dart';
import 'package:ballot_eye/features/auth/presentation/controllers/auth_controller.dart';
import 'package:ballot_eye/core/theme/app_theme.dart';
import 'package:ballot_eye/core/routing/app_router.dart';

class BallotEyeApp extends ConsumerWidget {
  const BallotEyeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    // Initialize FCM when user is logged in
    ref.listen(authControllerProvider, (previous, next) {
      next.whenData((user) {
        if (user != null) {
          ref.read(messagingServiceProvider).initialize(user.id);
        }
      });
    });

    return MaterialApp.router(
      title: 'BallotEye',
      routerConfig: router,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}
