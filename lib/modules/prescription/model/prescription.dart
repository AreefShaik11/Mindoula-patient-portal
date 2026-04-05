import 'package:freezed_annotation/freezed_annotation.dart';

part 'prescription.freezed.dart';
part 'prescription.g.dart';

enum PrescriptionStatus {
  active,
  stopped,
  onHold,
  expired,
}

@freezed
class Prescription with _$Prescription {
  const factory Prescription({
    required String id,
    required String drugName,
    required String dosage,
    required String frequency,
    required PrescriptionStatus status,
    required DateTime lastRefill,
    required int refillsRemaining,
  }) = _Prescription;

  factory Prescription.fromJson(Map<String, dynamic> json) => _$PrescriptionFromJson(json);
}
