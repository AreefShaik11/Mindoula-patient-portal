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
      final router = container.read(appRouterProvider);
      
      expect(router, isA<GoRouter>());
      expect(router.routeInformationProvider.value.uri.toString(), '/dashboard');
    });

    testWidgets('provides correct initial route', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final container = ProviderContainer();
      final router = container.read(appRouterProvider);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp.router(
            routerConfig: router,
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(DashboardScreen), findsOneWidget);
    });

    testWidgets('navigates to account screen', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final container = ProviderContainer();
      final router = container.read(appRouterProvider);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp.router(
            routerConfig: router,
          ),
        ),
      );

      await tester.pumpAndSettle();
      
      router.go('/account');
      await tester.pumpAndSettle();
      
      // Look for Account text or widgets
      expect(find.text('Settings'), findsWidgets);
    });
    
    testWidgets('navigates to all peripheral routes', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final container = ProviderContainer();
      final router = container.read(appRouterProvider);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
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
        expect(find.byType(Scaffold), findsWidgets);
      }
    });
  });
}
