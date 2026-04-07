import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindoula_patient_portal/modules/dashboard/widgets/appointment_card.dart';

void main() {
  group('AppointmentCard Tests', () {
    testWidgets('renders all details correctly', (WidgetTester tester) async {
      bool joinPressed = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppointmentCard(
              date: '10',
              month: 'FEB',
              title: 'Adult Psychiatry Case Management',
              onJoin: () {
                joinPressed = true;
              },
            ),
          ),
        ),
      );

      expect(find.text('10'), findsOneWidget);
      expect(find.text('FEB'), findsOneWidget);
      expect(find.text('Adult Psychiatry Case Management'), findsOneWidget);
      expect(find.text('Upcoming appointment'), findsOneWidget);
      expect(find.text('Join Video'), findsOneWidget);

      await tester.tap(find.text('Join Video'));
      expect(joinPressed, isTrue);
    });
  });
}
