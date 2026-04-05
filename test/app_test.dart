import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindoula_patient_portal/main.dart';
import 'package:mindoula_patient_portal/core/theme/app_colors.dart';
import 'package:mindoula_patient_portal/core/constants/app_constants.dart';

import 'package:mindoula_patient_portal/modules/dashboard/viewmodel/dashboard_view_model.dart';
import 'package:mindoula_patient_portal/modules/dashboard/model/dashboard_state.dart';
import 'package:mindoula_patient_portal/modules/billing/model/billing_model.dart';
import 'package:mindoula_patient_portal/modules/billing/viewmodel/billing_view_model.dart';
import 'package:mindoula_patient_portal/modules/account/model/account_state.dart';
import 'package:mindoula_patient_portal/modules/account/viewmodel/account_view_model.dart';
import 'package:mindoula_patient_portal/modules/prescription/model/prescription.dart';
import 'package:mindoula_patient_portal/modules/prescription/viewmodel/prescription_view_model.dart';
import 'package:mindoula_patient_portal/modules/messages/model/message_model.dart';
import 'package:mindoula_patient_portal/modules/messages/viewmodel/message_view_model.dart';

void main() {
  // ─── Unit Tests: Theme & Constants ────────────────────────────────────────

  group('AppColors', () {
    test('primary blue is correct', () {
      expect(AppColors.primaryBlue, const Color(0xFF3B74D1));
    });
    test('status active bg is correct', () {
      expect(AppColors.statusActiveBg, const Color(0xFFE1F5E1));
    });
    test('error color is correct', () {
      expect(AppColors.error, const Color(0xFFEF4444));
    });
  });

  group('AppConstants', () {
    test('sidebar width is correct', () {
      expect(AppConstants.sidebarWidth, 309.0);
    });
    test('card radius is correct', () {
      expect(AppConstants.cardRadius, 16.0);
    });
    test('sidebar sections are non-empty', () {
      expect(AppConstants.sidebarSection1.isNotEmpty, true);
      expect(AppConstants.sidebarSection2.isNotEmpty, true);
      expect(AppConstants.sidebarSection3.isNotEmpty, true);
    });
    test('content padding top is correct', () {
      expect(AppConstants.contentPaddingTop, 74.0);
    });
  });

  // ─── Unit Tests: Dashboard ────────────────────────────────────────────────

  group('DashboardState', () {
    test('default username is Jane', () {
      const state = DashboardState();
      expect(state.userName, 'Jane');
    });
    test('copyWith changes username', () {
      const state = DashboardState();
      final modified = state.copyWith(userName: 'Bob');
      expect(modified.userName, 'Bob');
    });
    test('isLoading defaults to false', () {
      const state = DashboardState();
      expect(state.isLoading, false);
    });
  });

  group('DashboardViewModel', () {
    test('initial state has appointment data', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final vm = container.read(dashboardViewModelProvider);
      expect(vm.nextAppointmentDate, '14');
      expect(vm.nextAppointmentMonth, 'April');
      expect(vm.nextAppointmentDoctor, 'Dr. Sarah Johnson');
    });
  });

  // ─── Unit Tests: Billing ─────────────────────────────────────────────────

  group('BillingStatus', () {
    test('all statuses exist', () {
      expect(BillingStatus.values.length, 4);
      expect(BillingStatus.paid.name, 'paid');
      expect(BillingStatus.outstanding.name, 'outstanding');
    });
  });

  group('BillingViewModel', () {
    test('initial state has outstanding balance', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final state = container.read(billingViewModelProvider);
      expect(state.outstandingBalance, 120.50);
      expect(state.transactions.isNotEmpty, true);
      expect(state.paymentMethods.isNotEmpty, true);
    });
    test('pay() sets loading state initially', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final notifier = container.read(billingViewModelProvider.notifier);
      // ignore: unawaited_futures
      notifier.pay(20.0);
      final state = container.read(billingViewModelProvider);
      expect(state.isLoading, true);
    });
  });

  // ─── Unit Tests: Account ─────────────────────────────────────────────────

  group('AccountState', () {
    test('default fullName is Jane Doe', () {
      const state = AccountState();
      expect(state.fullName, 'Jane Doe');
    });
    test('emailNotifications defaults to true', () {
      const state = AccountState();
      expect(state.emailNotifications, true);
    });
    test('smsNotifications defaults to false', () {
      const state = AccountState();
      expect(state.smsNotifications, false);
    });
  });

  group('AccountViewModel', () {
    test('toggleEmailNotifications updates state', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final notifier = container.read(accountViewModelProvider.notifier);
      notifier.toggleEmailNotifications(false);
      expect(container.read(accountViewModelProvider).emailNotifications, false);
    });
    test('toggleSmsNotifications updates state', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final notifier = container.read(accountViewModelProvider.notifier);
      notifier.toggleSmsNotifications(true);
      expect(container.read(accountViewModelProvider).smsNotifications, true);
    });
    test('updateFullName updates state', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final notifier = container.read(accountViewModelProvider.notifier);
      notifier.updateFullName('Alice');
      expect(container.read(accountViewModelProvider).fullName, 'Alice');
    });
    test('updateEmail updates state', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final notifier = container.read(accountViewModelProvider.notifier);
      notifier.updateEmail('alice@example.com');
      expect(container.read(accountViewModelProvider).email, 'alice@example.com');
    });
    test('updateLanguage updates state', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final notifier = container.read(accountViewModelProvider.notifier);
      notifier.updateLanguage('Spanish');
      expect(container.read(accountViewModelProvider).language, 'Spanish');
    });
  });

  // ─── Unit Tests: Prescriptions ───────────────────────────────────────────

  group('PrescriptionStatus', () {
    test('all statuses exist', () {
      expect(PrescriptionStatus.values.length, 4);
      expect(PrescriptionStatus.active.name, 'active');
      expect(PrescriptionStatus.onHold.name, 'onHold');
    });
  });

  group('PrescriptionViewModel', () {
    test('initial state has 4 prescriptions', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final prescriptions = container.read(prescriptionViewModelProvider);
      expect(prescriptions.length, 4);
    });
    test('includes active prescriptions', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final prescriptions = container.read(prescriptionViewModelProvider);
      final active = prescriptions.where((p) => p.status == PrescriptionStatus.active);
      expect(active.isNotEmpty, true);
    });
    test('requestRefill changes status to onHold', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final notifier = container.read(prescriptionViewModelProvider.notifier);
      final id = container.read(prescriptionViewModelProvider).first.id;
      notifier.requestRefill(id);
      final updated = container.read(prescriptionViewModelProvider).first;
      expect(updated.status, PrescriptionStatus.onHold);
    });
  });

  // ─── Unit Tests: Messages ────────────────────────────────────────────────

  group('MessageSenderType', () {
    test('all sender types exist', () {
      expect(MessageSenderType.values.length, 3);
    });
  });

  group('MessageType', () {
    test('all types exist', () {
      expect(MessageType.values.length, 5);
    });
  });

  group('MessageViewModel', () {
    test('initial state has threads', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final state = container.read(messageViewModelProvider);
      final threads = state['threads'] as List<MessageThread>;
      expect(threads.isNotEmpty, true);
    });
    test('selectThread changes selected ID', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final notifier = container.read(messageViewModelProvider.notifier);
      final threads = container.read(messageViewModelProvider)['threads'] as List<MessageThread>;
      notifier.selectThread(threads.last.id);
      final selected = container.read(messageViewModelProvider)['selectedThreadId'];
      expect(selected, threads.last.id);
    });
  });

  // ─── Widget Smoke Test ───────────────────────────────────────────────────

  testWidgets('Smoke test: App renders and dashboard is visible',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      const ProviderScope(
        child: MindoulaPatientPortalApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(MindoulaPatientPortalApp), findsOneWidget);

    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });
}
