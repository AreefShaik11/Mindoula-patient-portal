import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'billing_view_model.g.dart';

@riverpod
class BillingViewModel extends _$BillingViewModel {
  @override
  Map<String, dynamic> build() {
    return {
      'balance': 120.0,
      'nextStatementDate': DateTime.now().add(const Duration(days: 15)),
      'statements': [
        {'id': 'S1', 'date': DateTime.now().subtract(const Duration(days: 30)), 'amount': 120.0, 'status': 'Due'},
        {'id': 'S2', 'date': DateTime.now().subtract(const Duration(days: 60)), 'amount': 250.0, 'status': 'Paid'},
      ],
    };
  }

  void pay(double amount) {
    // Mock logic for payment
  }
}
