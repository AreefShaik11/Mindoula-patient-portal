import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindoula_patient_portal/modules/billing/viewmodel/billing_view_model.dart';
import 'package:mindoula_patient_portal/modules/billing/model/billing_model.dart';

void main() {
  group('BillingViewModel Tests', () {
    test('initial state contains expected data', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      
      final state = container.read(billingViewModelProvider);
      
      expect(state['outstandingBalance'], 120.50);
      expect(state['transactions'], isA<List<Transaction>>());
      expect((state['transactions'] as List).length, 3);
      expect(state['paymentMethods'], isA<List<PaymentMethod>>());
      expect((state['paymentMethods'] as List).length, 1);
    });
  });
}
