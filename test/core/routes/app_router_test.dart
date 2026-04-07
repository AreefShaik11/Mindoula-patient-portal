import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mindoula_patient_portal/core/routes/app_router.dart';
import 'package:mindoula_patient_portal/modules/dashboard/view/dashboard_screen.dart';

void main() {
  group('AppRouter Tests', () {
    test('appRouter provider returns a GoRouter instance', () {
      final container = ProviderContainer();
      final router = container.read(appRouterWithProvider);
      
      expect(router, isA<GoRouter>());
      expect(router.configuration.initialLocation, '/dashboard');
    });

    testWidgets('provides correct initial route', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp.router(
            routerConfig: null, // We'll get it from provider below
          ),
        ),
      );

      final BuildContext context = tester.element(find.byType(MaterialApp));
      final container = ProviderScope.containerOf(context);
      final router = container.read(appRouterWithProvider);

      await tester.pumpWidget(
        ProviderScope(
          parent: container,
          child: MaterialApp.router(
            routerConfig: router,
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(DashboardScreen), findsOneWidget);
    });

    testWidgets('navigates to account screen', (WidgetTester tester) async {
      final container = ProviderContainer();
      final router = container.read(appRouterWithProvider);

      await tester.pumpWidget(
        ProviderScope(
          parent: container,
          child: MaterialApp.router(
            routerConfig: router,
          ),
        ),
      );

      await tester.pumpAndSettle();
      
      router.go('/account');
      await tester.pumpAndSettle();
      
      expect(find.text('Profile Settings'), findsOneWidget); // Typical text in AccountScreen
    });
    
    testWidgets('navigates to all peripheral routes', (WidgetTester tester) async {
      final container = ProviderContainer();
      final router = container.read(appRouterWithProvider);

      await tester.pumpWidget(
        ProviderScope(
          parent: container,
          child: MaterialApp.router(
            routerConfig: router,
          ),
        ),
      );

      final routes = [
        '/appointments',
        '/lab-results',
        '/questionnaires',
        '/documents',
        '/insurance',
        '/logout'
      ];

      for (final route in routes) {
        router.go(route);
        await tester.pumpAndSettle();
        // Just verify it doesn't crash and renders something
        expect(find.byType(Scaffold), findsWidgets);
      }
    });
  });
}

// Helper to access the provider if the name is different due to generator
// Typical naming for @riverpod GoRouter appRouter is appRouterProvider
final appRouterWithProvider = appRouterProvider;
