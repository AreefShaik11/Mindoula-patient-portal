import 'package:freezed_annotation/freezed_annotation.dart';

part 'billing_model.freezed.dart';
part 'billing_model.g.dart';

enum BillingStatus { paid, outstanding, processing, failed }

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required String id,
    required DateTime date,
    required String description,
    required double amount,
    required BillingStatus status,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}

@freezed
class PaymentMethod with _$PaymentMethod {
  const factory PaymentMethod({
    required String id,
    required String type,
    required String lastFour,
    required bool isDefault,
  }) = _PaymentMethod;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);
}

@freezed
class BillingState with _$BillingState {
  const factory BillingState({
    required double outstandingBalance,
    required List<Transaction> transactions,
    required List<PaymentMethod> paymentMethods,
    @Default(false) bool isLoading,
  }) = _BillingState;

  factory BillingState.fromJson(Map<String, dynamic> json) =>
      _$BillingStateFromJson(json);
}
