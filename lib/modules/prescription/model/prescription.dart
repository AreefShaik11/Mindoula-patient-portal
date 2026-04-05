import 'package:freezed_annotation/freezed_annotation.dart';

part 'prescription.freezed.dart';
part 'prescription.g.dart';

@freezed
class Prescription with _$Prescription {
  const factory Prescription({
    required String id,
    required String medicationName,
    required String dosage,
    required String instructions,
    required String providerName,
    required DateTime lastFilled,
    required int refillsRemaining,
    required PrescriptionStatus status,
  }) = _Prescription;

  factory Prescription.fromJson(Map<String, dynamic> json) => _$PrescriptionFromJson(json);
}

enum PrescriptionStatus { active, pending, expired }
