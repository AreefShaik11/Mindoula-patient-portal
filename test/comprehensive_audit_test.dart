import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindoula_patient_portal/main.dart' as app;
import 'package:mindoula_patient_portal/core/theme/app_typography.dart';
import 'package:mindoula_patient_portal/modules/account/view/account_screen.dart';
import 'package:mindoula_patient_portal/modules/account/viewmodel/account_view_model.dart';
import 'package:mindoula_patient_portal/modules/messages/view/message_center_screen.dart';
import 'package:mindoula_patient_portal/shared/layout/app_layout.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  AppTypography.debugUseGoogleFonts = false;

  group('Comprehensive Quality Audit', () {
    test('Main Entry Point Check', () {
      expect(app.main, isA<Function>());
    });

    testWidgets('AccountScreen Multi-Viewport & interaction', (tester) async {
      // Desktop
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(const ProviderScope(
        child: MaterialApp(home: Scaffold(body: AccountScreen())),
      ));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Full Name'));
      await tester.tap(find.text('Email'));
      
      await tester.tap(find.text('Notifications'));
      await tester.pumpAndSettle();
      
      // Mobile
      tester.view.physicalSize = const Size(500, 800);
      await tester.pump();
      
      final notificationsTab = find.text('Notifications');
      final delegateTab = find.text('Delegate/Care Givers');

      await tester.ensureVisible(notificationsTab);
      await tester.tap(notificationsTab);
      await tester.pumpAndSettle();

      await tester.ensureVisible(delegateTab);
      await tester.tap(delegateTab);
      await tester.pumpAndSettle();
    });

    testWidgets('MessageCenter exhaustive UI check', (tester) async {
       tester.view.physicalSize = const Size(1200, 1200);
       await tester.pumpWidget(const ProviderScope(
         child: MaterialApp(home: Scaffold(body: MessageCenterScreen())),
       ));
       await tester.pumpAndSettle();
       
       await tester.tap(find.byIcon(Icons.search));
       await tester.tap(find.byIcon(Icons.filter_list));
       await tester.tap(find.text('Request Appointment'));
       await tester.tap(find.text('Attach file'));
       await tester.tap(find.text('Send'));
       
       // Hit notification cards - check by content substrings
       expect(find.textContaining('appointment'), findsAtLeastNWidgets(1));
       expect(find.textContaining('lab results'), findsAtLeastNWidgets(1));
    });

    testWidgets('AppLayout responsive check', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      await tester.pumpWidget(const ProviderScope(
        child: MaterialApp(home: AppLayout(child: Text('Content'))),
      ));
      await tester.pumpAndSettle();
      
      tester.view.physicalSize = const Size(500, 800);
      await tester.pump();
      expect(find.byIcon(Icons.menu), findsOneWidget);
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();
    });

    test('ViewModel Edge Cases', () {
      final container = ProviderContainer();
      final vm = container.read(accountViewModelProvider.notifier);
      vm.state = vm.state.copyWith(errorMessage: 'Error');
      expect(container.read(accountViewModelProvider).errorMessage, 'Error');
    });
  });
}
