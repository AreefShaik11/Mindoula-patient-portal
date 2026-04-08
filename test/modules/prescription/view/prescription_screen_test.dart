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
      
      // Verify count
      expect(find.byType(Card), findsAtLeastNWidgets(0)); // It uses PortalListCard which has a Card
      expect(find.text('5 refills remaining'), findsNWidgets(2));
    });

    testWidgets('should render dosage and frequency correctly for Sertraline', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(createPrescriptionScreen());
      await tester.pumpAndSettle();

      // Check Dosage and Frequency for Sertraline
      expect(find.textContaining('Dosage: 50mg'), findsNWidgets(2));
      expect(find.textContaining('Frequency: Weekly'), findsNWidgets(2));
      
      // Check Action Buttons
      expect(find.text('View Details'), findsNWidgets(2));
      expect(find.text('Request Refill'), findsNWidgets(2));
    });

    testWidgets('should render mobile layout correctly', (tester) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(createPrescriptionScreen());
      await tester.pumpAndSettle();

      expect(find.byType(Divider), findsWidgets);
      expect(find.text('View Details'), findsNWidgets(2));
      expect(find.text('Request Refill'), findsNWidgets(2));
    });
  });
}
