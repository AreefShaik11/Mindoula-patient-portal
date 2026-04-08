import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindoula_patient_portal/modules/prescription/view/prescription_screen.dart';
import 'package:mindoula_patient_portal/core/theme/app_typography.dart';

void main() {
  AppTypography.debugUseGoogleFonts = false;

  Widget createPrescriptionScreen() {
    return const ProviderScope(
      child: MaterialApp(
        home: Scaffold(
          body: PrescriptionScreen(),
        ),
      ),
    );
  }

  group('PrescriptionScreen Widget Tests', () {
    testWidgets('should render title and 2 prescriptions', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(createPrescriptionScreen());
      await tester.pumpAndSettle();

      expect(find.text('Your Prescriptions'), findsOneWidget);
      expect(find.text('Sertraline'), findsOneWidget);
      expect(find.text('Lorazepam'), findsOneWidget);
      
      // Verify refill count
      expect(find.text('5 refills remaining'), findsNWidgets(2));
    });

    testWidgets('should render dosage and frequency correctly for Sertraline', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(createPrescriptionScreen());
      await tester.pumpAndSettle();

      // Check Dosage and Frequency (Verify both prefix and value)
      expect(find.textContaining('Dosage:', findRichText: true), findsWidgets);
      expect(find.textContaining('50mg', findRichText: true), findsNWidgets(2));
      expect(find.textContaining('Frequency:', findRichText: true), findsWidgets);
      expect(find.textContaining('Weekly', findRichText: true), findsNWidgets(2));
      
      // Check Action Buttons
      expect(find.text('View Details'), findsNWidgets(2));
      expect(find.text('Request Refill'), findsNWidgets(2));
    });

    testWidgets('should render mobile layout correctly without overflow', (tester) async {
      // Very narrow viewport to test Wrap
      tester.view.physicalSize = const Size(350, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(createPrescriptionScreen());
      await tester.pumpAndSettle();

      expect(find.byType(Divider), findsWidgets);
      expect(find.text('View Details'), findsNWidgets(2));
      expect(find.text('Request Refill'), findsNWidgets(2));
      
      // Ensure no overflow occurred
      expect(tester.takeException(), isNull);
    });
  });
}
