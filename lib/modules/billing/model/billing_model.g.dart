// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionImpl _$$TransactionImplFromJson(Map<String, dynamic> json) =>
    _$TransactionImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      description: json['description'] as String,
      amount: (json['amount'] as num).toDouble(),
      status: $enumDecode(_$BillingStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
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

_$PaymentMethodImpl _$$PaymentMethodImplFromJson(Map<String, dynamic> json) =>
    _$PaymentMethodImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      lastFour: json['lastFour'] as String,
      isDefault: json['isDefault'] as bool,
    );

Map<String, dynamic> _$$PaymentMethodImplToJson(_$PaymentMethodImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'lastFour': instance.lastFour,
      'isDefault': instance.isDefault,
    };

_$BillingStateImpl _$$BillingStateImplFromJson(Map<String, dynamic> json) =>
    _$BillingStateImpl(
      outstandingBalance: (json['outstandingBalance'] as num).toDouble(),
      transactions: (json['transactions'] as List<dynamic>)
          .map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      paymentMethods: (json['paymentMethods'] as List<dynamic>)
          .map((e) => PaymentMethod.fromJson(e as Map<String, dynamic>))
          .toList(),
      isLoading: json['isLoading'] as bool? ?? false,
    );

Map<String, dynamic> _$$BillingStateImplToJson(_$BillingStateImpl instance) =>
    <String, dynamic>{
      'outstandingBalance': instance.outstandingBalance,
      'transactions': instance.transactions,
      'paymentMethods': instance.paymentMethods,
      'isLoading': instance.isLoading,
    };
