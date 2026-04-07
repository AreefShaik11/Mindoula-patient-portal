import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindoula_patient_portal/modules/prescription/view/prescription_screen.dart';

void main() {
  group('PrescriptionScreen Tests', () {
    testWidgets('renders both active and history sections', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: PrescriptionScreen(),
            ),
          ),
        ),
      );

      expect(find.text('Prescriptions'), findsOneWidget);
      expect(find.text('Active prescriptions'), findsOneWidget);
      expect(find.text('Refill requests & history'), findsOneWidget);
      
      expect(find.text('Lisinopril'), findsOneWidget);
      expect(find.text('Amlodipine'), findsOneWidget);
    });

    testWidgets('refill button is disabled when no refills left', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: PrescriptionScreen(),
            ),
          ),
        ),
      );

      // Metformin has 0 refills
      final metforminCard = find.ancestor(
        of: find.text('Metformin'),
        matching: find.byType(Container),
      ).first;
      
      final refillButton = find.descendant(
        of: metforminCard,
        matching: find.byType(ElevatedButton),
      );
      
      expect(tester.widget<ElevatedButton>(refillButton).enabled, isFalse);
    });
  });
}
