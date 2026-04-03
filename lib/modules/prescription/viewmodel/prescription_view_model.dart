import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/prescription.dart';

part 'prescription_view_model.g.dart';

@riverpod
class PrescriptionViewModel extends _$PrescriptionViewModel {
  @override
  List<Prescription> build() {
    return [
      Prescription(
        id: '1',
        drugName: 'Lisinopril',
        dosage: '10mg',
        frequency: 'Daily',
        status: PrescriptionStatus.active,
        lastRefill: DateTime.now().subtract(const Duration(days: 15)),
        refillsRemaining: 2,
      ),
      Prescription(
        id: '2',
        drugName: 'Amlodipine',
        dosage: '5mg',
        frequency: 'Daily',
        status: PrescriptionStatus.active,
        lastRefill: DateTime.now().subtract(const Duration(days: 45)),
        refillsRemaining: 1,
      ),
      Prescription(
        id: '3',
        drugName: 'Metformin',
        dosage: '500mg',
        frequency: 'Twice daily',
        status: PrescriptionStatus.onHold,
        lastRefill: DateTime.now().subtract(const Duration(days: 90)),
        refillsRemaining: 0,
      ),
      Prescription(
        id: '4',
        drugName: 'Amoxicillin',
        dosage: '250mg',
        frequency: 'Every 8 hours',
        status: PrescriptionStatus.expired,
        lastRefill: DateTime.now().subtract(const Duration(days: 200)),
        refillsRemaining: 0,
      ),
    ];
  }

  void requestRefill(String id) {
    state = [
      for (final p in state)
        if (p.id == id) p.copyWith(status: PrescriptionStatus.onHold) else p,
    ];
  }
}
