import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindoula_patient_portal/modules/dashboard/view/dashboard_screen.dart';

void main() {
  group('DashboardScreen Widget Tests', () {
    testWidgets('should render hello message with username', (tester) async {
      await tester.pumpWidget(const ProviderScope(
        child: MaterialApp(
          home: Scaffold(body: DashboardScreen()),
        ),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Hello, Jane'), findsOneWidget);
    });

    testWidgets('should render appointment card and quick actions', (tester) async {
      await tester.pumpWidget(const ProviderScope(
        child: MaterialApp(
          home: Scaffold(body: DashboardScreen()),
        ),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Upcoming appointment'), findsNWidgets(2)); // Title and within card
      expect(find.text('How can we help you today?'), findsOneWidget);
      expect(find.text('View 3 new messages'), findsOneWidget);
      expect(find.text('Request an appointment'), findsOneWidget);
    });
  });
}
