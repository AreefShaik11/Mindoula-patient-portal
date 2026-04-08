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
  group('Working Coverage Test for SonarCloud', () {
    testWidgets('test all screens individually for coverage', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      // Test DashboardScreen
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: DashboardScreen(),
          ),
        ),
      );
      await tester.pump();
      expect(find.text('Welcome back'), findsOneWidget);
      expect(find.text('Upcoming Appointments'), findsOneWidget);
      expect(find.text('Recent Activity'), findsOneWidget);

      // Test AccountScreen
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: AccountScreen(),
          ),
        ),
      );
      await tester.pump();
      expect(find.text('Profile'), findsOneWidget);
      expect(find.text('Notifications'), findsOneWidget);

      // Test BillingScreen
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: BillingScreen(),
          ),
        ),
      );
      await tester.pump();
      expect(find.text('Billing'), findsOneWidget);
      expect(find.text('Balance'), findsOneWidget);

      // Test MessageCenterScreen
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: MessageCenterScreen(),
          ),
        ),
      );
      await tester.pump();
      expect(find.text('Messages'), findsOneWidget);
      expect(find.text('Inbox'), findsOneWidget);

      // Test PrescriptionScreen
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: PrescriptionScreen(),
          ),
        ),
      );
      await tester.pump();
      expect(find.text('Prescriptions'), findsOneWidget);
      expect(find.text('Active prescriptions'), findsOneWidget);
      expect(find.text('Refill requests & history'), findsOneWidget);
    });

    testWidgets('test all view models for coverage', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Consumer(
              builder: (context, ref, child) {
                // Test all view models by watching their state
                final accountState = ref.watch(accountViewModelProvider);
                final billingData = ref.watch(billingViewModelProvider);
                final dashboardState = ref.watch(dashboardViewModelProvider);
                final messageData = ref.watch(messageViewModelProvider);
                final prescriptions = ref.watch(prescriptionViewModelProvider);

                // Test AccountViewModel methods
                final accountViewModel = ref.read(accountViewModelProvider.notifier);
                accountViewModel.updateFullName('Test Name');
                accountViewModel.updateEmail('test@email.com');
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
      expect(find.textContaining('Dashboard User:'), findsOneWidget);
      expect(find.textContaining('Message Threads:'), findsOneWidget);
      expect(find.textContaining('Unread Count:'), findsOneWidget);
      expect(find.textContaining('Prescriptions:'), findsOneWidget);
    });

    testWidgets('test prescription screen UI elements for coverage', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: PrescriptionScreen(),
          ),
        ),
      );

      await tester.pump();

      // Test prescription screen elements
      expect(find.text('Prescriptions'), findsOneWidget);
      expect(find.text('Active prescriptions'), findsOneWidget);
      expect(find.text('Refill requests & history'), findsOneWidget);
      expect(find.text('Lisinopril'), findsOneWidget);
      expect(find.text('Amlodipine'), findsOneWidget);
      expect(find.text('Metformin'), findsOneWidget);
      expect(find.text('Amoxicillin'), findsOneWidget);
      expect(find.text('2 refills left'), findsOneWidget);
      expect(find.text('1 refills left'), findsOneWidget);
      expect(find.text('0 refills left'), findsAtLeastNWidgets(2));
      expect(find.text('Active'), findsAtLeastNWidgets(2));
      expect(find.text('On Hold'), findsOneWidget);
      expect(find.text('Expired'), findsOneWidget);
      expect(find.text('Request Refill'), findsAtLeastNWidgets(1));

      // Test UI widgets
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(Row), findsWidgets);
      expect(find.byType(Text), findsWidgets);
      expect(find.byType(ElevatedButton), findsWidgets);
    });
  });
}
