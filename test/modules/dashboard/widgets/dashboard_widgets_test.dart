import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindoula_patient_portal/modules/dashboard/widgets/appointment_card.dart';
import 'package:mindoula_patient_portal/modules/dashboard/widgets/quick_action_card.dart';

void main() {
  group('Dashboard Widgets Tests', () {
    testWidgets('AppointmentCard should render date, month, and title', (tester) async {
      bool joined = false;
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: AppointmentCard(
            date: '15',
            month: 'May',
            title: 'Dr. John Doe',
            onJoin: () => joined = true,
          ),
        ),
      ));

      expect(find.text('15'), findsOneWidget);
      expect(find.text('May'), findsOneWidget);
      expect(find.text('Dr. John Doe'), findsOneWidget);
      expect(find.text('Join Video'), findsOneWidget);

      await tester.tap(find.text('Join Video'));
      expect(joined, isTrue);
    });

    testWidgets('QuickActionCard should render title', (tester) async {
      bool tapped = false;
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: QuickActionCard(
            title: 'Test Action',
            onTap: () => tapped = true,
          ),
        ),
      ));

      expect(find.text('Test Action'), findsOneWidget);
      await tester.tap(find.text('Test Action'));
      expect(tapped, isTrue);
    });

    testWidgets('QuickActionCard should render icon when isNotification is true', (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: QuickActionCard(
            title: 'Notification',
            onTap: nullCallback,
            isNotification: true,
          ),
        ),
      ));

      expect(find.byIcon(Icons.mail_outline), findsOneWidget);
    });
  });
}

void nullCallback() {}
