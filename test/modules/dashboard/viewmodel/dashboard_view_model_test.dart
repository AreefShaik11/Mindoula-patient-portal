import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindoula_patient_portal/modules/dashboard/viewmodel/dashboard_view_model.dart';
import 'package:mindoula_patient_portal/modules/dashboard/model/dashboard_state.dart';

void main() {
  group('DashboardViewModel Tests', () {
    test('initial state is correct', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      
      final state = container.read(dashboardViewModelProvider);
      
      expect(state, isA<DashboardState>());
      expect(state.userName, 'Jane');
      expect(state.nextAppointmentDoctor, 'Dr. Smith');
      expect(state.nextAppointmentDate, 'February 10, 2026');
    });
  });
}
