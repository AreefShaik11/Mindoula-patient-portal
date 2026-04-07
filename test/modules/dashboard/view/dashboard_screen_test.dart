import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mindoula_patient_portal/modules/dashboard/view/dashboard_screen.dart';

void main() {
  group('DashboardScreen Tests', () {
    testWidgets('renders greeting and appointment details', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: DashboardScreen(),
            ),
          ),
        ),
      );

      expect(find.text('Hello, Jane'), findsOneWidget);
      expect(find.text('Upcoming appointment'), findsNWidgets(2)); // Title and card text
      expect(find.text('Adult Psychiatry Case Management'), findsOneWidget);
    });

    testWidgets('quick actions navigate correctly', (WidgetTester tester) async {
      final router = GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(path: '/', builder: (_, __) => const Scaffold(body: DashboardScreen())),
          GoRoute(path: '/messages', builder: (_, __) => const Text('Messages Page')),
          GoRoute(path: '/appointments', builder: (_, __) => const Text('Appointments Page')),
          GoRoute(path: '/prescriptions', builder: (_, __) => const Text('Prescriptions Page')),
        ],
      );

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp.router(
            routerConfig: router,
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Tap 'View 3 new messages'
      await tester.tap(find.text('View 3 new messages'));
      await tester.pumpAndSettle();
      expect(find.text('Messages Page'), findsOneWidget);

      // Go back and tap 'Request an appointment'
      router.go('/');
      await tester.pumpAndSettle();
      await tester.tap(find.text('Request an appointment'));
      await tester.pumpAndSettle();
      expect(find.text('Appointments Page'), findsOneWidget);
      
      // Go back and tap 'Request a prescription refill'
      router.go('/');
      await tester.pumpAndSettle();
      await tester.tap(find.text('Request a prescription refill'));
      await tester.pumpAndSettle();
      expect(find.text('Prescriptions Page'), findsOneWidget);
    });
  });
}
