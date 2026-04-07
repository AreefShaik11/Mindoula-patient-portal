import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindoula_patient_portal/shared/widgets/cards/section_card.dart';

void main() {
  group('SectionCard Tests', () {
    testWidgets('renders child correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SectionCard(
              child: Text('Test Child Content'),
            ),
          ),
        ),
      );

      expect(find.text('Test Child Content'), findsOneWidget);
      expect(find.byType(Divider), findsNothing);
    });

    testWidgets('renders title and divider when title is provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SectionCard(
              title: 'Test Section Title',
              child: Text('Test Child Content'),
            ),
          ),
        ),
      );

      expect(find.text('Test Section Title'), findsOneWidget);
      expect(find.text('Test Child Content'), findsOneWidget);
      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('renders actions when provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SectionCard(
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
              ],
              child: const Text('Test Child Content'),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('renders title and actions together', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SectionCard(
              title: 'Section with Active Title',
              actions: [
                const Text('Action 1'),
              ],
              child: const Text('Test Child Content'),
            ),
          ),
        ),
      );

      expect(find.text('Section with Active Title'), findsOneWidget);
      expect(find.text('Action 1'), findsOneWidget);
      expect(find.byType(Divider), findsOneWidget);
    });
  });
}
