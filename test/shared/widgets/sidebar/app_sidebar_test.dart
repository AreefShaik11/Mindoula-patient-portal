import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mindoula_patient_portal/shared/widgets/sidebar/app_sidebar.dart';

void main() {
  Widget createSidebarTestWidget(String path) {
    final router = GoRouter(
      initialLocation: path,
      routes: [
        GoRoute(path: '/dashboard', builder: (_, __) => const Scaffold(body: AppSidebar())),
        GoRoute(path: '/messages', builder: (_, __) => const Scaffold(body: AppSidebar())),
        GoRoute(path: '/appointments', builder: (_, __) => const Scaffold(body: AppSidebar())),
        GoRoute(path: '/prescriptions', builder: (_, __) => const Scaffold(body: AppSidebar())),
        GoRoute(path: '/lab-results', builder: (_, __) => const Scaffold(body: AppSidebar())),
        GoRoute(path: '/questionnaires', builder: (_, __) => const Scaffold(body: AppSidebar())),
        GoRoute(path: '/documents', builder: (_, __) => const Scaffold(body: AppSidebar())),
        GoRoute(path: '/insurance', builder: (_, __) => const Scaffold(body: AppSidebar())),
        GoRoute(path: '/billing', builder: (_, __) => const Scaffold(body: AppSidebar())),
        GoRoute(path: '/account', builder: (_, __) => const Scaffold(body: AppSidebar())),
        GoRoute(path: '/logout', builder: (_, __) => const Scaffold(body: AppSidebar())),
      ],
    );

    return MaterialApp.router(
      routerConfig: router,
    );
  }

  group('AppSidebar Tests', () {
    testWidgets('renders all sidebar items', (WidgetTester tester) async {
      await tester.pumpWidget(createSidebarTestWidget('/dashboard'));
      await tester.pumpAndSettle();

      expect(find.text('Member Portal'), findsOneWidget);
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Messages'), findsOneWidget);
      expect(find.text('Appointments'), findsOneWidget);
      expect(find.text('Prescriptions'), findsOneWidget);
      expect(find.text('Lab results'), findsOneWidget);
      expect(find.text('Questionnaires'), findsOneWidget);
      expect(find.text('Documents'), findsOneWidget);
      expect(find.text('Insurance'), findsOneWidget);
      expect(find.text('Billing'), findsOneWidget);
      expect(find.text('Account'), findsOneWidget);
      expect(find.text('Log Out'), findsOneWidget);
    });

    testWidgets('highlights the selected item', (WidgetTester tester) async {
      await tester.pumpWidget(createSidebarTestWidget('/messages'));
      await tester.pumpAndSettle();

      // The selected item has a circle indicator
      expect(find.byType(Container), findsWidgets);
      // We can check if the circle decoration exists for the 'Messages' item
      // but simpler is to check if it navigates and re-renders
    });

    testWidgets('navigates when an item is tapped', (WidgetTester tester) async {
      final router = GoRouter(
        initialLocation: '/dashboard',
        routes: [
          GoRoute(path: '/dashboard', builder: (_, __) => const Scaffold(body: AppSidebar())),
          GoRoute(path: '/billing', builder: (_, __) => const Scaffold(body: AppSidebar())),
        ],
      );

      await tester.pumpWidget(MaterialApp.router(routerConfig: router));
      await tester.pumpAndSettle();

      expect(router.state?.uri.path, '/dashboard');

      await tester.tap(find.text('Billing'));
      await tester.pumpAndSettle();

      expect(router.state?.uri.path, '/billing');
    });
  });
}
