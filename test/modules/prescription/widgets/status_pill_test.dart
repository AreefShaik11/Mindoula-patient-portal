import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindoula_patient_portal/modules/prescription/widgets/status_pill.dart';
import 'package:mindoula_patient_portal/modules/prescription/model/prescription.dart';

void main() {
  group('StatusPill Tests', () {
    testWidgets('renders correct label and color for active status', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StatusPill(status: PrescriptionStatus.active),
          ),
        ),
      );

      expect(find.text('Active'), findsOneWidget);
    });

    testWidgets('renders correct label for stopped status', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StatusPill(status: PrescriptionStatus.stopped),
          ),
        ),
      );

      expect(find.text('Stopped'), findsOneWidget);
    });

    testWidgets('renders correct label for onHold status', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StatusPill(status: PrescriptionStatus.onHold),
          ),
        ),
      );

      expect(find.text('On Hold'), findsOneWidget);
    });

    testWidgets('renders correct label for expired status', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StatusPill(status: PrescriptionStatus.expired),
          ),
        ),
      );

      expect(find.text('Expired'), findsOneWidget);
    });
  });
}
