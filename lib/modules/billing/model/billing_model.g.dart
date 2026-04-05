// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BillingStatementImpl _$$BillingStatementImplFromJson(
  Map<String, dynamic> json,
) => _$BillingStatementImpl(
  id: json['id'] as String,
  date: DateTime.parse(json['date'] as String),
  amount: (json['amount'] as num).toDouble(),
  status: json['status'] as String,
);

Map<String, dynamic> _$$BillingStatementImplToJson(
  _$BillingStatementImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'date': instance.date.toIso8601String(),
  'amount': instance.amount,
  'status': instance.status,
};
