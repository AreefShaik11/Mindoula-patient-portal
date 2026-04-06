import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../shared/layout/app_layout.dart';
import '../../modules/dashboard/view/dashboard_screen.dart';
import '../../modules/messages/view/message_center_screen.dart';
import '../../modules/prescription/view/prescription_screen.dart';
import '../../modules/billing/view/billing_screen.dart';
import '../../modules/account/view/account_screen.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return AppLayout(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const DashboardScreen(),
          ),
          GoRoute(
            path: '/messages',
            builder: (context, state) => const MessageCenterScreen(),
          ),
          GoRoute(
            path: '/appointments',
            builder: (context, state) =>
                const _PlaceholderScreen(title: 'Appointments'),
          ),
          GoRoute(
            path: '/prescriptions',
            builder: (context, state) => const PrescriptionScreen(),
          ),
          GoRoute(
            path: '/lab-results',
            builder: (context, state) =>
                const _PlaceholderScreen(title: 'Lab Results'),
          ),
          GoRoute(
            path: '/questionnaires',
            builder: (context, state) =>
                const _PlaceholderScreen(title: 'Questionnaires'),
          ),
          GoRoute(
            path: '/documents',
            builder: (context, state) =>
                const _PlaceholderScreen(title: 'Documents'),
          ),
          GoRoute(
            path: '/insurance',
            builder: (context, state) =>
                const _PlaceholderScreen(title: 'Insurance'),
          ),
          GoRoute(
            path: '/billing',
            builder: (context, state) => const BillingScreen(),
          ),
          GoRoute(
            path: '/account',
            builder: (context, state) => const AccountScreen(),
          ),
          GoRoute(
            path: '/logout',
            builder: (context, state) =>
                const _PlaceholderScreen(title: 'Logging Out...'),
          ),
        ],
      ),
    ],
  );
}

class _PlaceholderScreen extends StatelessWidget {
  final String title;
  const _PlaceholderScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Coming Soon: $title', style: const TextStyle(fontSize: 24)),
    );
  }
}
