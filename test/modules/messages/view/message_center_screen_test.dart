import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindoula_patient_portal/modules/messages/view/message_center_screen.dart';

void main() {
  group('MessageCenterScreen Tests', () {
    testWidgets('renders message list and selected thread', (WidgetTester tester) async {
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
      expect(find.text('Dr. Sarah Smith'), findsAtLeastNWidgets(2)); // One in list, one in header
      expect(find.text('Care Team'), findsOneWidget); // In list
      
      // Check for bubble content
      expect(find.text("Hello Jane, I've reviewed your recent bloodwork."), findsOneWidget);
    });

    testWidgets('switches thread when selected', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: MessageCenterScreen(),
            ),
          ),
        ),
      );

      // Initially selected is Dr. Sarah Smith
      expect(find.text("Hello Jane, I've reviewed your recent bloodwork."), findsOneWidget);

      // Tap Care Team thread
      await tester.tap(find.text('Care Team'));
      await tester.pumpAndSettle();

      // Should show Care Team message
      expect(find.text('Checking in on your progress with the new medication.'), findsOneWidget);
      expect(find.text("Hello Jane, I've reviewed your recent bloodwork."), findsNothing);
    });

    testWidgets('renders appointment request card', (WidgetTester tester) async {
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
