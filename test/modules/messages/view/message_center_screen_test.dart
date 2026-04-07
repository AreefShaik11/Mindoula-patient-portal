import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindoula_patient_portal/modules/messages/view/message_center_screen.dart';

void main() {
  group('MessageCenterScreen Tests', () {
    testWidgets('renders message list and selected thread', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: MessageCenterScreen(),
            ),
          ),
        ),
      );

      expect(find.text('Messages'), findsOneWidget);
      expect(find.text('Dr. Sarah Smith'), findsAtLeastNWidgets(2));
      expect(find.text('Care Team'), findsOneWidget);
      expect(find.text("Hello Jane, I've reviewed your recent bloodwork."), findsOneWidget);
    });

    testWidgets('switches thread when selected', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: MessageCenterScreen(),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Care Team'));
      await tester.pumpAndSettle();

      expect(find.text('Checking in on your progress with the new medication.'), findsOneWidget);
    });

    testWidgets('renders appointment request card', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: MessageCenterScreen(),
            ),
          ),
        ),
      );

      expect(find.text('Appointment request'), findsOneWidget);
      expect(find.text('Request Appointment'), findsOneWidget);
    });

    testWidgets('renders input area', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: MessageCenterScreen(),
            ),
          ),
        ),
      );

      expect(find.byType(TextField), findsOneWidget);
      expect(find.byIcon(Icons.attach_file), findsOneWidget);
      expect(find.byIcon(Icons.send), findsOneWidget);
    });
  });
}
