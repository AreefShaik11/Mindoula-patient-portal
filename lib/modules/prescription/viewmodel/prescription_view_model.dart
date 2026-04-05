import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/prescription.dart';

part 'prescription_view_model.g.dart';

@riverpod
class PrescriptionViewModel extends _$PrescriptionViewModel {
  @override
  List<Prescription> build() {
    return [
      Prescription(
        id: 'p1',
        medicationName: 'Lisinopril 10 mg Tablet',
        dosage: 'Take 1 tablet by mouth daily',
        instructions: 'Take in the morning with a full glass of water.',
        providerName: 'Dr. Sarah Johnson',
        lastFilled: DateTime.now().subtract(const Duration(days: 15)),
        refillsRemaining: 2,
        status: PrescriptionStatus.active,
      ),
      Prescription(
        id: 'p2',
        medicationName: 'Metoprolol Tartrate 25 mg Tablet',
        dosage: 'Take 1 tablet by mouth twice daily',
        instructions: 'Take with food.',
        providerName: 'Dr. Sarah Johnson',
        lastFilled: DateTime.now().subtract(const Duration(days: 5)),
        refillsRemaining: 1,
        status: PrescriptionStatus.active,
      ),
    ];
  }

  void requestRefill(String id) {
    // Mock logic for refill request
  }
}
