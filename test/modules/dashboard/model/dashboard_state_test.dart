import 'package:flutter_test/flutter_test.dart';
import 'package:mindoula_patient_portal/modules/dashboard/model/dashboard_state.dart';

void main() {
  group('DashboardState', () {
    test('should have default values', () {
      const state = DashboardState();
      expect(state.userName, 'Jane');
      expect(state.isLoading, false);
      expect(state.nextAppointmentType, isNull);
    });

    test('should support copyWith', () {
      const state = DashboardState();
      final updated = state.copyWith(userName: 'John', isLoading: true);
      expect(updated.userName, 'John');
      expect(updated.isLoading, true);
    });

    test('should create from JSON', () {
      final json = {
        'userName': 'Alice',
        'nextAppointmentType': 'Checkup',
        'isLoading': true,
      };
      final state = DashboardState.fromJson(json);
      expect(state.userName, 'Alice');
      expect(state.nextAppointmentType, 'Checkup');
      expect(state.isLoading, true);
    });
  });
}
