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
        drugName: 'Sertraline',
        dosage: '50mg',
        frequency: 'Weekly',
        status: PrescriptionStatus.active,
        lastRefill: DateTime.now().subtract(const Duration(days: 15)),
        refillsRemaining: 5,
      ),
      Prescription(
        id: '2',
        drugName: 'Lorazepam',
        dosage: '50mg',
        frequency: 'Weekly',
        status: PrescriptionStatus.active,
        lastRefill: DateTime.now().subtract(const Duration(days: 10)),
        refillsRemaining: 5,
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
