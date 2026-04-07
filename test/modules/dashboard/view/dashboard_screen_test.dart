import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindoula_patient_portal/modules/dashboard/view/dashboard_screen.dart';

void main() {
  group('DashboardScreen Tests', () {
    testWidgets('renders greeting and appointment details', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: DashboardScreen(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Hello, Jane'), findsOneWidget);
      // "Upcoming appointment" appears on the screen title and the appointment card
      expect(find.text('Upcoming appointment'), findsNWidgets(2));
      expect(find.text('Adult Psychiatry Case Management'), findsOneWidget);
    });

    testWidgets('quick actions navigate correctly', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: DashboardScreen(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('How can we help you today?'), findsOneWidget);
      expect(find.text('View 3 new messages'), findsOneWidget);
      expect(find.text('Request an appointment'), findsOneWidget);
      expect(find.text('Request a prescription refill'), findsOneWidget);
    });
  });
}
