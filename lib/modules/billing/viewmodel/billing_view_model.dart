import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/billing_model.dart';

part 'billing_view_model.g.dart';

@riverpod
class BillingViewModel extends _$BillingViewModel {
  @override
  BillingState build() {
    return BillingState(
      outstandingBalance: 120.50,
      transactions: [
        Transaction(
          id: '1',
          date: DateTime.now().subtract(const Duration(days: 5)),
          description: 'Office Visit - Dr. Smith',
          amount: 75.00,
          status: BillingStatus.paid,
        ),
        Transaction(
          id: '2',
          date: DateTime.now().subtract(const Duration(days: 30)),
          description: 'Lab Work - Blood Panel',
          amount: 45.50,
          status: BillingStatus.outstanding,
        ),
        Transaction(
          id: '3',
          date: DateTime.now().subtract(const Duration(days: 60)),
          description: 'Pharmacy Co-pay',
          amount: 15.00,
          status: BillingStatus.paid,
        ),
      ],
      paymentMethods: [
        const PaymentMethod(
          id: '1',
          type: 'Visa',
          lastFour: '4242',
          isDefault: true,
        ),
      ],
    );
  }

  void pay(double amount) async {
    state = state.copyWith(isLoading: true);
    await Future.delayed(const Duration(seconds: 1));
    state = state.copyWith(
      isLoading: false,
      outstandingBalance: state.outstandingBalance - amount,
    );
  }
}
