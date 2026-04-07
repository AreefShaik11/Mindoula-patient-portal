import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mindoula_patient_portal/shared/layout/app_layout.dart';
import 'package:mindoula_patient_portal/shared/widgets/sidebar/app_sidebar.dart';

void main() {
  Widget createLayoutTestWidget(Widget child) {
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (_, __) => AppLayout(child: child),
        ),
        GoRoute(
          path: '/dashboard',
          builder: (_, __) => AppLayout(child: child),
        ),
      ],
    );

    return MaterialApp.router(
      routerConfig: router,
    );
  }

  group('AppLayout Tests', () {
    testWidgets('renders sidebar and content', (WidgetTester tester) async {
      await tester.pumpWidget(createLayoutTestWidget(const Text('Main Content')));
      await tester.pumpAndSettle();

      expect(find.byType(AppSidebar), findsOneWidget);
      expect(find.text('Main Content'), findsOneWidget);
    });

    testWidgets('scrolls content when it exceeds screen height', (WidgetTester tester) async {
      await tester.pumpWidget(
        createLayoutTestWidget(
          Column(
            children: List.generate(
              50,
              (index) => Text('Item $index', key: Key('item_$index')),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Item 0'), findsOneWidget);
      expect(find.text('Item 49'), findsNothing); // Should be offscreen

      // Scroll down
      await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -500));
      await tester.pump();

      expect(find.text('Item 49'), findsWidgets);
    });
  });
}
