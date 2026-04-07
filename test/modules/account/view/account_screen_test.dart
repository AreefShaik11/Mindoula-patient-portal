import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindoula_patient_portal/modules/account/view/account_screen.dart';
import 'package:mindoula_patient_portal/modules/account/viewmodel/account_view_model.dart';

void main() {
  group('AccountScreen Tests', () {
    testWidgets('renders tabs correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: AccountScreen(),
            ),
          ),
        ),
      );

      expect(find.text('Settings'), findsOneWidget);
      expect(find.text('Notifications'), findsOneWidget);
      expect(find.text('Delegate / Care Givers'), findsOneWidget);
    });

    testWidgets('switches between tabs', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: AccountScreen(),
            ),
          ),
        ),
      );

      // Settings tab (default)
      expect(find.text('Full Name'), findsOneWidget);
      expect(find.text('Email Notifications'), findsNothing);

      // Tap Notifications tab
      await tester.tap(find.text('Notifications'));
      await tester.pumpAndSettle();
      expect(find.text('Email Notifications'), findsOneWidget);
      expect(find.text('Full Name'), findsNothing);

      // Tap Delegate tab
      await tester.tap(find.text('Delegate / Care Givers'));
      await tester.pumpAndSettle();
      expect(find.text('John Doe'), findsOneWidget);
      expect(find.text('Email Notifications'), findsNothing);
    });

    testWidgets('notification toggles work', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: AccountScreen(),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Notifications'));
      await tester.pumpAndSettle();

      final emailSwitch = find.byType(Switch).first;
      expect(tester.widget<Switch>(emailSwitch).value, isTrue); // Default

      await tester.tap(emailSwitch);
      await tester.pumpAndSettle();
      
      // In a real app we'd check if the state changed, here it's enough to see if it responds
      // Actually, since we're using ProviderScope, it SHOULD change if the notifier works
      expect(tester.widget<Switch>(emailSwitch).value, isFalse);
    });
  });
}
