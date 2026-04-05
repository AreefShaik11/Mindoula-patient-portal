// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Transaction _$TransactionFromJson(Map<String, dynamic> json) => _Transaction(
  id: json['id'] as String,
  date: DateTime.parse(json['date'] as String),
  description: json['description'] as String,
  amount: (json['amount'] as num).toDouble(),
  status: $enumDecode(_$BillingStatusEnumMap, json['status']),
);

Map<String, dynamic> _$TransactionToJson(_Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'description': instance.description,
      'amount': instance.amount,
      'status': _$BillingStatusEnumMap[instance.status]!,
    };

const _$BillingStatusEnumMap = {
  BillingStatus.paid: 'paid',
  BillingStatus.outstanding: 'outstanding',
  BillingStatus.processing: 'processing',
  BillingStatus.failed: 'failed',
};

_PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) =>
    _PaymentMethod(
      id: json['id'] as String,
      type: json['type'] as String,
      lastFour: json['lastFour'] as String,
      isDefault: json['isDefault'] as bool,
    );

Map<String, dynamic> _$PaymentMethodToJson(_PaymentMethod instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'lastFour': instance.lastFour,
      'isDefault': instance.isDefault,
    };
