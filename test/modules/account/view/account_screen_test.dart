import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindoula_patient_portal/modules/account/view/account_screen.dart';
import 'package:mindoula_patient_portal/modules/account/viewmodel/account_view_model.dart';
import 'package:mindoula_patient_portal/core/theme/app_typography.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  AppTypography.debugUseGoogleFonts = false;

  group('AccountScreen Widget Tests', () {
    testWidgets('should render title and settings tab content by default', (tester) async {
      await tester.pumpWidget(const ProviderScope(
        child: MaterialApp(
          home: Scaffold(body: AccountScreen()),
        ),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Account'), findsOneWidget);
      expect(find.text('Full Name'), findsOneWidget);
      expect(find.text('Jane Doe'), findsOneWidget);

      // Hit the ProfileItem taps
      await tester.tap(find.text('Full Name'));
      await tester.tap(find.text('Email'));
      await tester.tap(find.text('Password'));
      await tester.tap(find.text('Language'));
      await tester.pumpAndSettle();
    });

    testWidgets('should switch to Notifications tab and toggle switches', (tester) async {
      await tester.pumpWidget(const ProviderScope(
        child: MaterialApp(
          home: Scaffold(body: AccountScreen()),
        ),
      ));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Notifications'));
      await tester.pumpAndSettle();

      expect(find.text('Email Notifications'), findsOneWidget);
      expect(find.text('SMS Notifications'), findsOneWidget);
      
      // Tap a switch
      await tester.tap(find.byType(Switch).first);
      await tester.pumpAndSettle();
    });

    testWidgets('should switch to Delegate tab', (tester) async {
      await tester.pumpWidget(const ProviderScope(
        child: MaterialApp(
          home: Scaffold(body: AccountScreen()),
        ),
      ));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Delegate/Care Givers'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('John Doe'));
      await tester.tap(find.text('Manage Access'));
      await tester.tap(find.text('+ Add Delegate'));
      await tester.pumpAndSettle();
    });
  });
}
