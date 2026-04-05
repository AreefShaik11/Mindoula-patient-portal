import 'package:flutter_test/flutter_test.dart';
import 'package:mindoula_patient_portal/modules/billing/model/billing_model.dart';

void main() {
  group('BillingModel', () {
    group('BillingStatus', () {
      test('should have correct enum values', () {
        expect(BillingStatus.values, contains(BillingStatus.paid));
        expect(BillingStatus.values, contains(BillingStatus.outstanding));
        expect(BillingStatus.values, contains(BillingStatus.processing));
        expect(BillingStatus.values, contains(BillingStatus.failed));
      });
    });

    group('Transaction', () {
      test('should create Transaction with required fields', () {
        final transaction = Transaction(
          id: 'txn_123',
          date: DateTime(2024, 1, 15),
          description: 'Consultation fee',
          amount: 150.0,
          status: BillingStatus.paid,
        );

        expect(transaction.id, 'txn_123');
        expect(transaction.date, DateTime(2024, 1, 15));
        expect(transaction.description, 'Consultation fee');
        expect(transaction.amount, 150.0);
        expect(transaction.status, BillingStatus.paid);
      });

      test('should create Transaction from JSON', () {
        final json = {
          'id': 'txn_456',
          'date': '2024-02-20T10:30:00.000Z',
          'description': 'Lab test',
          'amount': 75.50,
          'status': 'outstanding',
        };

        final transaction = Transaction.fromJson(json);

        expect(transaction.id, 'txn_456');
        expect(transaction.description, 'Lab test');
        expect(transaction.amount, 75.50);
        expect(transaction.status, BillingStatus.outstanding);
      });

      test('should support equality', () {
        final transaction1 = Transaction(
          id: 'txn_789',
          date: DateTime(2024, 3, 10),
          description: 'Payment',
          amount: 100.0,
          status: BillingStatus.paid,
        );
        final transaction2 = Transaction(
          id: 'txn_789',
          date: DateTime(2024, 3, 10),
          description: 'Payment',
          amount: 100.0,
          status: BillingStatus.paid,
        );
        final transaction3 = Transaction(
          id: 'txn_999',
          date: DateTime(2024, 3, 10),
          description: 'Payment',
          amount: 100.0,
          status: BillingStatus.paid,
        );

        expect(transaction1, equals(transaction2));
        expect(transaction1, isNot(equals(transaction3)));
      });
    });

    group('PaymentMethod', () {
      test('should create PaymentMethod with required fields', () {
        final paymentMethod = PaymentMethod(
          id: 'pm_123',
          type: 'credit_card',
          lastFour: '1234',
          isDefault: true,
        );

        expect(paymentMethod.id, 'pm_123');
        expect(paymentMethod.type, 'credit_card');
        expect(paymentMethod.lastFour, '1234');
        expect(paymentMethod.isDefault, true);
      });

      test('should create PaymentMethod from JSON', () {
        final json = {
          'id': 'pm_456',
          'type': 'debit_card',
          'lastFour': '5678',
          'isDefault': false,
        };

        final paymentMethod = PaymentMethod.fromJson(json);

        expect(paymentMethod.id, 'pm_456');
        expect(paymentMethod.type, 'debit_card');
        expect(paymentMethod.lastFour, '5678');
        expect(paymentMethod.isDefault, false);
      });

      test('should support copyWith', () {
        final paymentMethod = PaymentMethod(
          id: 'pm_789',
          type: 'credit_card',
          lastFour: '9999',
          isDefault: false,
        );
        final updatedMethod = paymentMethod.copyWith(isDefault: true);

        expect(updatedMethod.isDefault, true);
        expect(updatedMethod.id, paymentMethod.id); // unchanged
        expect(updatedMethod.type, paymentMethod.type); // unchanged
        expect(updatedMethod.lastFour, paymentMethod.lastFour); // unchanged
      });
    });

    group('BillingState', () {
      test('should create BillingState with required fields', () {
        final billingState = BillingState(
          outstandingBalance: 250.75,
          transactions: [
            Transaction(
              id: 'txn_1',
              date: DateTime(2024, 1, 1),
              description: 'Test transaction',
              amount: 100.0,
              status: BillingStatus.paid,
            ),
          ],
          paymentMethods: [
            PaymentMethod(
              id: 'pm_1',
              type: 'credit_card',
              lastFour: '1111',
              isDefault: true,
            ),
          ],
        );

        expect(billingState.outstandingBalance, 250.75);
        expect(billingState.transactions.length, 1);
        expect(billingState.paymentMethods.length, 1);
        expect(billingState.isLoading, false); // default value
      });

      test('should create BillingState with isLoading', () {
        final billingState = BillingState(
          outstandingBalance: 250.75,
          transactions: [],
          paymentMethods: [],
          isLoading: true,
        );

        expect(billingState.isLoading, true);
      });

      test('should create BillingState from JSON', () {
        final json = {
          'outstandingBalance': 500.25,
          'transactions': [
            {
              'id': 'txn_json',
              'date': '2024-04-01T12:00:00.000Z',
              'description': 'JSON Transaction',
              'amount': 200.0,
              'status': 'processing',
            }
          ],
          'paymentMethods': [
            {
              'id': 'pm_json',
              'type': 'bank_transfer',
              'lastFour': '2222',
              'isDefault': false,
            }
          ],
          'isLoading': false,
        };

        final billingState = BillingState.fromJson(json);

        expect(billingState.outstandingBalance, 500.25);
        expect(billingState.transactions.length, 1);
        expect(billingState.paymentMethods.length, 1);
        expect(billingState.isLoading, false);
      });
    });
  });
}
