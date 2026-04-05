import 'package:flutter_test/flutter_test.dart';
import 'package:mindoula_patient_portal/modules/prescription/model/prescription.dart';

void main() {
  group('PrescriptionModel', () {
    group('PrescriptionStatus', () {
      test('should have correct enum values', () {
        expect(PrescriptionStatus.values, contains(PrescriptionStatus.active));
        expect(PrescriptionStatus.values, contains(PrescriptionStatus.stopped));
        expect(PrescriptionStatus.values, contains(PrescriptionStatus.onHold));
        expect(PrescriptionStatus.values, contains(PrescriptionStatus.expired));
      });
    });

    group('Prescription', () {
      test('should create Prescription with required fields', () {
        final prescription = Prescription(
          id: 'rx_123',
          drugName: 'Lisinopril',
          dosage: '10mg',
          frequency: 'Once daily',
          status: PrescriptionStatus.active,
          lastRefill: DateTime(2024, 1, 15),
          refillsRemaining: 3,
        );

        expect(prescription.id, 'rx_123');
        expect(prescription.drugName, 'Lisinopril');
        expect(prescription.dosage, '10mg');
        expect(prescription.frequency, 'Once daily');
        expect(prescription.status, PrescriptionStatus.active);
        expect(prescription.lastRefill, DateTime(2024, 1, 15));
        expect(prescription.refillsRemaining, 3);
      });

      test('should create Prescription with different status', () {
        final prescription = Prescription(
          id: 'rx_456',
          drugName: 'Metformin',
          dosage: '500mg',
          frequency: 'Twice daily',
          status: PrescriptionStatus.expired,
          lastRefill: DateTime(2023, 12, 1),
          refillsRemaining: 0,
        );

        expect(prescription.status, PrescriptionStatus.expired);
        expect(prescription.refillsRemaining, 0);
      });

      test('should create Prescription from JSON', () {
        final json = {
          'id': 'rx_789',
          'drugName': 'Atorvastatin',
          'dosage': '20mg',
          'frequency': 'Once daily at bedtime',
          'status': 'onHold',
          'lastRefill': '2024-02-20T00:00:00.000Z',
          'refillsRemaining': 2,
        };

        final prescription = Prescription.fromJson(json);

        expect(prescription.id, 'rx_789');
        expect(prescription.drugName, 'Atorvastatin');
        expect(prescription.dosage, '20mg');
        expect(prescription.frequency, 'Once daily at bedtime');
        expect(prescription.status, PrescriptionStatus.onHold);
        expect(prescription.refillsRemaining, 2);
      });

      test('should create Prescription from JSON with stopped status', () {
        final json = {
          'id': 'rx_stopped',
          'drugName': 'Old Medication',
          'dosage': '100mg',
          'frequency': 'Three times daily',
          'status': 'stopped',
          'lastRefill': '2023-06-15T00:00:00.000Z',
          'refillsRemaining': 0,
        };

        final prescription = Prescription.fromJson(json);

        expect(prescription.status, PrescriptionStatus.stopped);
        expect(prescription.refillsRemaining, 0);
      });

      test('should support equality', () {
        final prescription1 = Prescription(
          id: 'rx_same',
          drugName: 'Same Drug',
          dosage: '10mg',
          frequency: 'Once daily',
          status: PrescriptionStatus.active,
          lastRefill: DateTime(2024, 4, 5),
          refillsRemaining: 5,
        );
        final prescription2 = Prescription(
          id: 'rx_same',
          drugName: 'Same Drug',
          dosage: '10mg',
          frequency: 'Once daily',
          status: PrescriptionStatus.active,
          lastRefill: DateTime(2024, 4, 5),
          refillsRemaining: 5,
        );
        final prescription3 = Prescription(
          id: 'rx_different',
          drugName: 'Same Drug',
          dosage: '10mg',
          frequency: 'Once daily',
          status: PrescriptionStatus.active,
          lastRefill: DateTime(2024, 4, 5),
          refillsRemaining: 5,
        );

        expect(prescription1, equals(prescription2));
        expect(prescription1, isNot(equals(prescription3)));
      });

      test('should support copyWith', () {
        final prescription = Prescription(
          id: 'rx_original',
          drugName: 'Original Drug',
          dosage: '50mg',
          frequency: 'Twice daily',
          status: PrescriptionStatus.active,
          lastRefill: DateTime(2024, 4, 5),
          refillsRemaining: 4,
        );
        final updatedPrescription = prescription.copyWith(
          status: PrescriptionStatus.stopped,
          refillsRemaining: 0,
        );

        expect(updatedPrescription.status, PrescriptionStatus.stopped);
        expect(updatedPrescription.refillsRemaining, 0);
        expect(updatedPrescription.id, prescription.id); // unchanged
        expect(updatedPrescription.drugName, prescription.drugName); // unchanged
      });

      test('should handle different prescription scenarios', () {
        final prescriptions = [
          Prescription(
            id: 'rx_1',
            drugName: 'Aspirin',
            dosage: '81mg',
            frequency: 'Once daily',
            status: PrescriptionStatus.active,
            lastRefill: DateTime(2024, 3, 1),
            refillsRemaining: 10,
          ),
          Prescription(
            id: 'rx_2',
            drugName: 'Ibuprofen',
            dosage: '200mg',
            frequency: 'As needed',
            status: PrescriptionStatus.onHold,
            lastRefill: DateTime(2024, 2, 15),
            refillsRemaining: 1,
          ),
          Prescription(
            id: 'rx_3',
            drugName: 'Antibiotic',
            dosage: '500mg',
            frequency: 'Three times daily',
            status: PrescriptionStatus.expired,
            lastRefill: DateTime(2023, 11, 20),
            refillsRemaining: 0,
          ),
        ];

        expect(prescriptions.length, 3);
        expect(prescriptions[0].status, PrescriptionStatus.active);
        expect(prescriptions[1].status, PrescriptionStatus.onHold);
        expect(prescriptions[2].status, PrescriptionStatus.expired);
      });
    });
  });
}
