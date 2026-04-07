import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindoula_patient_portal/modules/dashboard/view/dashboard_screen.dart';

void main() {
  group('DashboardScreen Tests', () {
    testWidgets('renders greeting and appointment details', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: DashboardScreen(),
            ),
          ),
        ),
      );

      expect(find.text('Hello, Jane'), findsOneWidget);
      expect(find.text('Upcoming appointment'), findsWidgets); // Found in screen and card
      expect(find.text('Adult Psychiatry Case Management'), findsOneWidget);
    });

    testWidgets('quick actions navigate correctly', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: DashboardScreen(),
            ),
          ),
        ),
      );

      expect(find.text('How can we help you today?'), findsOneWidget);
      expect(find.text('View 3 new messages'), findsOneWidget);
      expect(find.text('Request an appointment'), findsOneWidget);
      expect(find.text('Request a prescription refill'), findsOneWidget);
    });
  });
}
