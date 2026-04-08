import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindoula_patient_portal/modules/billing/view/billing_screen.dart';
import 'package:mindoula_patient_portal/modules/billing/viewmodel/billing_view_model.dart';
import 'package:mindoula_patient_portal/modules/billing/model/billing_model.dart';
import 'package:mindoula_patient_portal/shared/widgets/navigation/portal_tab_bar.dart';

void main() {
  Widget createBillingScreen() {
    return const ProviderScope(
      child: MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: BillingScreen(),
          ),
        ),
      ),
    );
  }

  group('BillingScreen Widget Tests', () {
    testWidgets('should render billing title and tabs', (tester) async {
      await tester.pumpWidget(createBillingScreen());
      await tester.pumpAndSettle();

      expect(find.text('Billing'), findsOneWidget);
      expect(find.byType(PortalTabBar), findsOneWidget);
      expect(find.text('Outstanding'), findsOneWidget);
      expect(find.text('History'), findsOneWidget);
      expect(find.text('Payment'), findsOneWidget);
    });

    testWidgets('should render summary statistics', (tester) async {
      await tester.pumpWidget(createBillingScreen());
      await tester.pumpAndSettle();

      expect(find.text('Total outstanding balance:'), findsOneWidget);
      // The default mock outstanding balance is $120.50
      expect(find.text('\$120.50'), findsOneWidget);
      expect(find.text('Last payment'), findsOneWidget);
    });


    testWidgets('should switch tabs and show correct content', (tester) async {
      await tester.pumpWidget(createBillingScreen());
      await tester.pumpAndSettle();

      // Initial tab is 'Outstanding'
      // Transaction '2' is outstanding ($45.50)
      expect(find.text('Lab Work - Blood Panel'), findsOneWidget);
      
      // Switch to 'History'
      await tester.tap(find.text('History'));
      await tester.pumpAndSettle();

      // Transaction '1' and '3' are paid ($75.00, $15.00)
      expect(find.text('Office Visit - Dr. Smith'), findsOneWidget);
      expect(find.text('Pharmacy Co-pay'), findsOneWidget);
      
      // Switch to 'Payment'
      await tester.tap(find.text('Payment'));
      await tester.pumpAndSettle();
      
      expect(find.text('Payment settings placeholder'), findsOneWidget);
    });

    testWidgets('should show "Pay Now" button only for unpaid transactions', (tester) async {
      // Set a larger screen size to avoid overflows in the test
      tester.view.physicalSize = const Size(1200, 1000);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createBillingScreen());
      await tester.pumpAndSettle();

      // On 'Outstanding' tab, transaction '2' should have 'Pay Now'
      // We use ensureVisible just in case
      final payNowFinder = find.text('Pay Now');
      expect(payNowFinder, findsOneWidget);

      // Switch to 'History'
      await tester.tap(find.text('History'));
      await tester.pumpAndSettle();

      // On 'History' tab, transactions are paid, so no 'Pay Now' buttons
      expect(find.text('Pay Now'), findsNothing);
      
      // Reset physical size
      tester.view.resetPhysicalSize();
    });
  });
}
