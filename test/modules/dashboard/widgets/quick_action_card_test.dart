import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindoula_patient_portal/modules/dashboard/widgets/quick_action_card.dart';

void main() {
  group('QuickActionCard Tests', () {
    testWidgets('renders title and icon, and responds to tap', (WidgetTester tester) async {
      bool tapped = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: QuickActionCard(
              title: 'Test Quick Action',
              icon: Icons.add,
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      expect(find.text('Test Quick Action'), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);

      await tester.tap(find.byType(QuickActionCard));
      expect(tapped, isTrue);
    });
  });
}
