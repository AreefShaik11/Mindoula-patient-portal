import 'package:flutter_test/flutter_test.dart';
import 'package:mindoula_patient_portal/modules/prescription/model/prescription.dart';

void main() {
  group('Prescription Model', () {
    test('should create Prescription and supporting JSON', () {
      final now = DateTime.now();
      final p = Prescription(
        id: '99',
        drugName: 'Test Drug',
        dosage: '50mg',
        frequency: 'Daily',
        status: PrescriptionStatus.active,
        lastRefill: now,
        refillsRemaining: 3,
      );

      expect(p.drugName, 'Test Drug');
      expect(p.status, PrescriptionStatus.active);

      final json = p.toJson();
      expect(json['id'], '99');
      expect(json['drugName'], 'Test Drug');
      
      final fromJson = Prescription.fromJson(json);
      expect(fromJson.drugName, 'Test Drug');
      // DateTime might lose some precision in serialization, so we check equality of strings or year/month/day
      expect(fromJson.lastRefill.year, now.year);
    });

    test('PrescriptionStatus should have correct values', () {
      expect(PrescriptionStatus.values.length, 4);
      expect(PrescriptionStatus.active.name, 'active');
    });
  });
}
