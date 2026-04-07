import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindoula_patient_portal/modules/account/view/account_screen.dart';

void main() {
  group('AccountScreen Tests', () {
    testWidgets('renders tabs correctly', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: AccountScreen(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Settings'), findsOneWidget);
      expect(find.text('Notifications'), findsWidgets); // Found in Tab and Toggle
      expect(find.text('Delegate / Care Givers'), findsOneWidget);
    });

    testWidgets('switches between tabs', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: AccountScreen(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Tap Notifications tab
      await tester.tap(find.text('Notifications').first);
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      
      expect(find.text('Email Notifications'), findsOneWidget);
      expect(find.text('SMS Notifications'), findsOneWidget);
    });

    testWidgets('notification toggles work', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: AccountScreen(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      
      // Navigate to Notifications tab
      await tester.tap(find.text('Notifications').first);
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      // Find all switches
      final switches = find.byType(Switch);
      expect(switches, findsWidgets);
      
      // Toggle first switch
      await tester.tap(switches.first);
      await tester.pumpAndSettle();
    });
  });
}
