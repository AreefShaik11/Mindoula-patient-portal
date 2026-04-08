import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindoula_patient_portal/modules/billing/viewmodel/billing_view_model.dart';

void main() {
  group('BillingViewModel', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('should have initial state with mock data', () {
      final state = container.read(billingViewModelProvider);
      
      expect(state.outstandingBalance, 120.50);
      expect(state.transactions.length, 3);
      expect(state.paymentMethods.length, 1);
      expect(state.isLoading, false);
    });

    test('pay should update outstanding balance', () async {
      final viewModel = container.read(billingViewModelProvider.notifier);
      
      // Initial check
      expect(container.read(billingViewModelProvider).outstandingBalance, 120.50);
      
      // Start payment and await it
      await viewModel.pay(20.50);
      
      final state = container.read(billingViewModelProvider);
      expect(state.outstandingBalance, 100.00);
    });
  });
}
