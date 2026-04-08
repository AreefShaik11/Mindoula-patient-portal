import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindoula_patient_portal/modules/account/view/account_screen.dart';
import 'package:mindoula_patient_portal/modules/billing/view/billing_screen.dart';
import 'package:mindoula_patient_portal/modules/dashboard/view/dashboard_screen.dart';
import 'package:mindoula_patient_portal/modules/messages/view/message_center_screen.dart';
import 'package:mindoula_patient_portal/modules/prescription/view/prescription_screen.dart';
import 'package:mindoula_patient_portal/modules/account/viewmodel/account_view_model.dart';
import 'package:mindoula_patient_portal/modules/billing/viewmodel/billing_view_model.dart';
import 'package:mindoula_patient_portal/modules/dashboard/viewmodel/dashboard_view_model.dart';
import 'package:mindoula_patient_portal/modules/messages/viewmodel/message_view_model.dart';
import 'package:mindoula_patient_portal/modules/prescription/viewmodel/prescription_view_model.dart';

void main() {
  group('Complete Coverage Test for SonarCloud', () {
    testWidgets('test all screens and view models for 100% coverage', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  // Test all screens
                  Expanded(child: DashboardScreen()),
                  Expanded(child: AccountScreen()),
                  Expanded(child: BillingScreen()),
                  Expanded(child: MessageCenterScreen()),
                  Expanded(child: PrescriptionScreen()),
                ],
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      // Test DashboardScreen
      expect(find.text('Welcome back'), findsOneWidget);
      expect(find.text('Upcoming Appointments'), findsOneWidget);
      expect(find.text('Recent Activity'), findsOneWidget);

      // Test AccountScreen
      expect(find.text('Profile'), findsOneWidget);
      expect(find.text('Notifications'), findsOneWidget);

      // Test BillingScreen
      expect(find.text('Billing'), findsOneWidget);
      expect(find.text('Balance'), findsOneWidget);

      // Test MessageCenterScreen
      expect(find.text('Messages'), findsOneWidget);
      expect(find.text('Inbox'), findsOneWidget);

      // Test PrescriptionScreen
      expect(find.text('Prescriptions'), findsOneWidget);
      expect(find.text('Active prescriptions'), findsOneWidget);
      expect(find.text('Refill requests & history'), findsOneWidget);
    });

    testWidgets('test all view models and their methods', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Consumer(
                builder: (context, ref, child) {
                  // Test all view models by watching their state
                  final accountState = ref.watch(accountViewModelProvider);
                  final billingData = ref.watch(billingViewModelProvider);
                  final dashboardState = ref.watch(dashboardViewModelProvider);
                  final messageData = ref.watch(messageViewModelProvider);
                  final prescriptions = ref.watch(prescriptionViewModelProvider);

                  // Test AccountViewModel methods by reading the provider
                  final accountViewModel = ref.read(accountViewModelProvider.notifier);
                  accountViewModel.updateFullName('New Name');
                  accountViewModel.updateEmail('new@email.com');
                  accountViewModel.updateLanguage('Spanish');
                  accountViewModel.toggleEmailNotifications(false);
                  accountViewModel.toggleSmsNotifications(true);

                  return Column(
                    children: [
                      // AccountViewModel display
                      Text('Account: ${accountState.fullName}'),
                      Text('Email: ${accountState.email}'),
                      Text('Language: ${accountState.language}'),
                      Text('Email Notifications: ${accountState.emailNotifications}'),
                      Text('SMS Notifications: ${accountState.smsNotifications}'),
                      
                      // BillingViewModel display
                      Text('Billing Balance: ${billingData['outstandingBalance']}'),
                      Text('Transactions: ${billingData['transactions'].length}'),
                      Text('Payment Methods: ${billingData['paymentMethods'].length}'),
                      
                      // DashboardViewModel display
                      Text('Dashboard Loading: ${dashboardState.isLoading}'),
                      Text('Dashboard User: ${dashboardState.userName}'),
                      
                      // MessageViewModel display
                      Text('Message Threads: ${messageData['threads'].length}'),
                      Text('Unread Count: ${messageData['unreadCount']}'),
                      
                      // PrescriptionViewModel display
                      Text('Prescriptions: ${prescriptions.length}'),
                      ...prescriptions.map((p) => Text(p.drugName)),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      // Verify all view model elements are rendered
      expect(find.byType(Text), findsWidgets);
      expect(find.textContaining('Account:'), findsOneWidget);
      expect(find.textContaining('Email:'), findsOneWidget);
      expect(find.textContaining('Language:'), findsOneWidget);
      expect(find.textContaining('Email Notifications:'), findsOneWidget);
      expect(find.textContaining('SMS Notifications:'), findsOneWidget);
      expect(find.textContaining('Billing Balance:'), findsOneWidget);
      expect(find.textContaining('Transactions:'), findsOneWidget);
      expect(find.textContaining('Payment Methods:'), findsOneWidget);
      expect(find.textContaining('Dashboard Loading:'), findsOneWidget);
      expect(find.textContaining('Dashboard Error:'), findsOneWidget);
      expect(find.textContaining('Message Threads:'), findsOneWidget);
      expect(find.textContaining('Unread Count:'), findsOneWidget);
      expect(find.textContaining('Prescriptions:'), findsOneWidget);
    });

    testWidgets('test all UI interactions and user flows', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  Expanded(child: AccountScreen()),
                  Expanded(child: PrescriptionScreen()),
                ],
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      // Test AccountScreen interactions
      expect(find.byType(TabBar), findsOneWidget);
      expect(find.byType(TabBarView), findsOneWidget);
      expect(find.byType(Tab), findsWidgets);

      // Test tab switching
      await tester.tap(find.text('Notifications'));
      await tester.pump();

      // Test notification toggles
      await tester.tap(find.byType(Switch).first);
      await tester.pump();

      // Test PrescriptionScreen interactions
      expect(find.text('Lisinopril'), findsOneWidget);
      expect(find.text('Amlodipine'), findsOneWidget);
      expect(find.text('Metformin'), findsOneWidget);
      expect(find.text('Amoxicillin'), findsOneWidget);
      expect(find.text('Request Refill'), findsAtLeastNWidgets(1));

      // Test refill button interactions
      await tester.tap(find.text('Request Refill').first);
      await tester.pump();

      // Verify all UI elements are present
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(Row), findsWidgets);
      expect(find.byType(Text), findsWidgets);
      expect(find.byType(ElevatedButton), findsWidgets);
      expect(find.byType(Switch), findsWidgets);
    });
  });
}
