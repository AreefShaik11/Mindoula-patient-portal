import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindoula_patient_portal/modules/prescription/viewmodel/prescription_view_model.dart';
import 'package:mindoula_patient_portal/modules/prescription/model/prescription.dart';

void main() {
  group('PrescriptionViewModel', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('should have initial list of mock prescriptions', () {
      final state = container.read(prescriptionViewModelProvider);
      expect(state.length, 2);
      expect(state[0].drugName, 'Sertraline');
      expect(state[1].drugName, 'Lorazepam');
    });

    test('requestRefill should update prescription status to onHold', () {
      final viewModel = container.read(prescriptionViewModelProvider.notifier);
      
      // Before: Sertraline is 'active'
      expect(container.read(prescriptionViewModelProvider)[0].status, PrescriptionStatus.active);
      
      viewModel.requestRefill('1');
      
      // After: Sertraline should be 'onHold'
      expect(container.read(prescriptionViewModelProvider)[0].status, PrescriptionStatus.onHold);
    });
  });
}
