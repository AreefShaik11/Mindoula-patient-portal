import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindoula_patient_portal/modules/prescription/viewmodel/prescription_view_model.dart';
import 'package:mindoula_patient_portal/modules/prescription/model/prescription.dart';

void main() {
  group('PrescriptionViewModel Tests', () {
    test('initial state contains expected prescriptions', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      
      final state = container.read(prescriptionViewModelProvider);
      
      expect(state, isA<List<Prescription>>());
      expect(state.length, 4);
      expect(state.first.drugName, 'Lisinopril');
    });

    test('requestRefill updates status to onHold', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final notifier = container.read(prescriptionViewModelProvider.notifier);
      
      notifier.requestRefill('1');
      final updatedState = container.read(prescriptionViewModelProvider);
      expect(updatedState.firstWhere((p) => p.id == '1').status, PrescriptionStatus.onHold);
    });
  });
}
