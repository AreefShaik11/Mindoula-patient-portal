import 'package:freezed_annotation/freezed_annotation.dart';

part 'billing_model.freezed.dart';
part 'billing_model.g.dart';

@freezed
class BillingStatement with _$BillingStatement {
  const factory BillingStatement({
    required String id,
    required DateTime date,
    required double amount,
    required String status,
  }) = _BillingStatement;

  factory BillingStatement.fromJson(Map<String, dynamic> json) => _$BillingStatementFromJson(json);
}
