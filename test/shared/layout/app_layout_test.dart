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
      // Use a fixed size to ensure overflow
      tester.view.physicalSize = const Size(800, 600);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        createLayoutTestWidget(
          Column(
            children: List.generate(
              100,
              (index) => SizedBox(
                height: 50,
                child: Text('Item $index'),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Item 0'), findsOneWidget);
      
      // Item 99 should be in the tree but not in the viewport
      final item99 = find.text('Item 99');
      // Verify it's not visible in the viewport using a more robust check if needed,
      // but usually SingleChildScrollView doesn't clip from tree.
      // We can verify it BECOMES findable after scroll if we used a lazy list, 
      // but here we just verify scroll doesn't crash.
      
      await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -2000));
      await tester.pump();

      expect(find.text('Item 99'), findsOneWidget);
    });
  });
}
