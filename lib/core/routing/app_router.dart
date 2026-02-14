import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ballot_eye/features/auth/presentation/controllers/auth_controller.dart';
import 'package:ballot_eye/features/auth/presentation/views/login_view.dart';
import 'package:ballot_eye/features/auth/presentation/views/register_view.dart';
import 'package:ballot_eye/features/reports/presentation/views/create_report_view.dart';
import 'package:ballot_eye/features/reports/presentation/views/incident_feed_view.dart';
import 'package:ballot_eye/features/reports/presentation/views/incident_detail_view.dart';
import 'package:ballot_eye/features/reports/presentation/views/moderation_hub_view.dart';
import 'package:ballot_eye/features/reports/presentation/views/incident_map_view.dart';
import 'package:ballot_eye/features/leaderboard/presentation/views/leaderboard_view.dart';
import 'package:ballot_eye/shared/widgets/observer_shell.dart';
import 'package:ballot_eye/shared/widgets/admin_shell.dart';

// Placeholder screen for sections not yet implemented
class SectionPlaceholder extends StatelessWidget {
  final String title;
  const SectionPlaceholder({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(title, style: Theme.of(context).textTheme.headlineMedium));
  }
}

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authControllerProvider);

  return GoRouter(
    initialLocation: '/',
    refreshListenable: authState.maybeWhen(
      data: (user) => null, // We could use a Listenable here if we wrapped authState
      orElse: () => null,
    ),
    redirect: (context, state) {
      final user = authState.value;
      final isLoggingIn = state.uri.path == '/login' || state.uri.path == '/register';

      if (user == null) {
        return isLoggingIn ? null : '/login';
      }

      if (isLoggingIn) {
        if (user.isObserver) return '/';
        return '/moderation';
      }

      // If admin/moderator tries to go to observer root '/', send to moderation
      if (!user.isObserver && state.uri.path == '/') {
        return '/moderation';
      }

      // Role-specific path protection
      if (user.isObserver && (state.uri.path.startsWith('/moderation') || 
                              state.uri.path.startsWith('/audit') || 
                              state.uri.path.startsWith('/map'))) {
        return '/';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      
      // Observer Shell
      ShellRoute(
        builder: (context, state, child) => ObserverShell(child: child),
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const IncidentFeedView(),
          ),
          GoRoute(
            path: '/reports',
            builder: (context, state) => const SectionPlaceholder(title: 'My Reports'),
            routes: [
              GoRoute(
                path: 'create',
                builder: (context, state) => const CreateReportScreen(),
              ),
              GoRoute(
                path: 'detail/:id',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return IncidentDetailView(reportId: id);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const SectionPlaceholder(title: 'Profile'),
          ),
          GoRoute(
            path: '/leaderboard',
            builder: (context, state) => const LeaderboardView(),
          ),
        ],
      ),

      // Admin Shell
      ShellRoute(
        builder: (context, state, child) => AdminShell(child: child),
        routes: [
          GoRoute(
            path: '/moderation',
            builder: (context, state) => const ModerationHubView(),
          ),
          GoRoute(
            path: '/map',
            builder: (context, state) => const IncidentMapView(),
          ),
          GoRoute(
            path: '/audit',
            builder: (context, state) => const SectionPlaceholder(title: 'Audit Logs'),
          ),
        ],
      ),
    ],
  );
});
