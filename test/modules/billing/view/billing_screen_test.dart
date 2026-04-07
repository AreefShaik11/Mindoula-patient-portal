import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindoula_patient_portal/modules/billing/view/billing_screen.dart';

void main() {
  group('BillingScreen Tests', () {
    testWidgets('renders balance card and transaction table', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: BillingScreen(),
            ),
          ),
        ),
      );

      expect(find.text('Billing'), findsOneWidget);
      expect(find.text('Outstanding balance'), findsOneWidget);
      expect(find.text('\$120.50'), findsOneWidget);
      expect(find.text('Payment history'), findsOneWidget);
      
      // Check for table columns
      expect(find.text('Date'), findsOneWidget);
      expect(find.text('Description'), findsOneWidget);
      expect(find.text('Amount'), findsOneWidget);
      expect(find.text('Status'), findsOneWidget);
    });

    testWidgets('renders status indicators correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: BillingScreen(),
            ),
          ),
        ),
      );

      // Check for specific transactions and statuses from the mock data
      expect(find.text('Office Visit - Dr. Smith'), findsOneWidget);
      expect(find.text('Paid'), findsNWidgets(2)); // Row for id 1 and 3 are 'paid'
      expect(find.text('Outstanding'), findsOneWidget); // Row for id 2
    });
  });
}
