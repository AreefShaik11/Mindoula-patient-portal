import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mindoula_patient_portal/shared/widgets/sidebar/app_sidebar.dart';
import 'package:mindoula_patient_portal/core/theme/app_typography.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  AppTypography.debugUseGoogleFonts = false;

  group('AppSidebar Widget Tests', () {
    testWidgets('should render all sidebar items', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final router = GoRouter(
        routes: [
          GoRoute(path: '/', builder: (context, state) => const Scaffold(body: Material(child: AppSidebar()))),
        ],
      );

      await tester.pumpWidget(MaterialApp.router(routerConfig: router));
      await tester.pumpAndSettle();

      expect(find.text('Member Portal'), findsOneWidget);
    });

    testWidgets('should handle context without GoRouter (coverage for catch block)', (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(body: Material(child: AppSidebar())),
      ));
      await tester.pumpAndSettle();
      
      expect(find.text('Dashboard'), findsOneWidget);
    });

    testWidgets('should navigate when each item is tapped', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final routes = [
        'Dashboard', 'Messaging Center', 'Appointments',
        'Prescription', 'Lab results', 'Questionnaires', 'Documents',
        'Insurance', 'Billing', 'Account', 'Log Out'
      ];

      final router = GoRouter(
        initialLocation: '/',
        routes: [
          ShellRoute(
            builder: (context, state, child) => Scaffold(
              body: Row(
                children: [
                   const Material(child: AppSidebar()),
                   Expanded(child: child),
                ],
              ),
            ),
            routes: [
              GoRoute(path: '/', builder: (_, __) => const Text('Dashboard Page')),
              GoRoute(path: '/messages', builder: (_, __) => const Text('Messaging Center Page')),
              GoRoute(path: '/appointments', builder: (_, __) => const Text('Appointments Page')),
              GoRoute(path: '/prescriptions', builder: (_, __) => const Text('Prescription Page')),
              GoRoute(path: '/lab-results', builder: (_, __) => const Text('Lab results Page')),
              GoRoute(path: '/questionnaires', builder: (_, __) => const Text('Questionnaires Page')),
              GoRoute(path: '/documents', builder: (_, __) => const Text('Documents Page')),
              GoRoute(path: '/insurance', builder: (_, __) => const Text('Insurance Page')),
              GoRoute(path: '/billing', builder: (_, __) => const Text('Billing Page')),
              GoRoute(path: '/account', builder: (_, __) => const Text('Account Page')),
              GoRoute(path: '/logout', builder: (_, __) => const Text('Log Out Page')),
            ],
          ),
        ],
      );

      await tester.pumpWidget(MaterialApp.router(routerConfig: router));
      await tester.pumpAndSettle();

      for (final label in routes) {
        final finder = find.text(label);
        await tester.ensureVisible(finder);
        await tester.tap(finder);
        await tester.pumpAndSettle();
        expect(find.text('$label Page'), findsOneWidget);
      }
    });
  });
}
