// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrescriptionImpl _$$PrescriptionImplFromJson(Map<String, dynamic> json) =>
    _$PrescriptionImpl(
      id: json['id'] as String,
      medicationName: json['medicationName'] as String,
      dosage: json['dosage'] as String,
      instructions: json['instructions'] as String,
      providerName: json['providerName'] as String,
      lastFilled: DateTime.parse(json['lastFilled'] as String),
      refillsRemaining: (json['refillsRemaining'] as num).toInt(),
      status: $enumDecode(_$PrescriptionStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$PrescriptionImplToJson(_$PrescriptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'medicationName': instance.medicationName,
      'dosage': instance.dosage,
      'instructions': instance.instructions,
      'providerName': instance.providerName,
      'lastFilled': instance.lastFilled.toIso8601String(),
      'refillsRemaining': instance.refillsRemaining,
      'status': _$PrescriptionStatusEnumMap[instance.status]!,
    };

const _$PrescriptionStatusEnumMap = {
  PrescriptionStatus.active: 'active',
  PrescriptionStatus.pending: 'pending',
  PrescriptionStatus.expired: 'expired',
};
