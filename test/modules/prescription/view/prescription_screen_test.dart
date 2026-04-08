import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindoula_patient_portal/modules/prescription/view/prescription_screen.dart';

void main() {
  Widget createPrescriptionScreen() {
    return const ProviderScope(
      child: MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: PrescriptionScreen(),
          ),
        ),
      ),
    );
  }

  group('PrescriptionScreen Widget Tests', () {
    testWidgets('should render title and prescriptions', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(createPrescriptionScreen());
      await tester.pumpAndSettle();

      expect(find.text('Your Prescriptions'), findsOneWidget);
      expect(find.text('Lisinopril'), findsOneWidget);
      expect(find.text('Amlodipine'), findsOneWidget);
      expect(find.text('Metformin'), findsOneWidget);
      expect(find.text('Amoxicillin'), findsOneWidget);
    });

    testWidgets('should render refills remaining for each card', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(createPrescriptionScreen());
      await tester.pumpAndSettle();

      expect(find.text('2 refills remaining'), findsOneWidget);
      expect(find.text('1 refills remaining'), findsOneWidget);
      expect(find.text('0 refills remaining'), findsNWidgets(2));
    });

    testWidgets('should render dosage and frequency info', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(createPrescriptionScreen());
      await tester.pumpAndSettle();

      expect(find.textContaining('Dosage: 10mg Frequency: Daily'), findsOneWidget);
      expect(find.text('Inactive Button'), findsWidgets);
    });
  });
}
