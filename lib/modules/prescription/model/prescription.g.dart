// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrescriptionImpl _$$PrescriptionImplFromJson(Map<String, dynamic> json) =>
    _$PrescriptionImpl(
      id: json['id'] as String,
      drugName: json['drugName'] as String,
      dosage: json['dosage'] as String,
      frequency: json['frequency'] as String,
      status: $enumDecode(_$PrescriptionStatusEnumMap, json['status']),
      lastRefill: DateTime.parse(json['lastRefill'] as String),
      refillsRemaining: (json['refillsRemaining'] as num).toInt(),
    );

Map<String, dynamic> _$$PrescriptionImplToJson(_$PrescriptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'drugName': instance.drugName,
      'dosage': instance.dosage,
      'frequency': instance.frequency,
      'status': _$PrescriptionStatusEnumMap[instance.status]!,
      'lastRefill': instance.lastRefill.toIso8601String(),
      'refillsRemaining': instance.refillsRemaining,
    };

const _$PrescriptionStatusEnumMap = {
  PrescriptionStatus.active: 'active',
  PrescriptionStatus.stopped: 'stopped',
  PrescriptionStatus.onHold: 'onHold',
  PrescriptionStatus.expired: 'expired',
};
