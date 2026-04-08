import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindoula_patient_portal/modules/dashboard/viewmodel/dashboard_view_model.dart';

void main() {
  group('DashboardViewModel', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('should have initial state with mock dashboard data', () {
      final state = container.read(dashboardViewModelProvider);
      expect(state.userName, 'Jane');
      expect(state.nextAppointmentType, 'Adult Psychiatry Case Management');
      expect(state.isLoading, false);
    });

    test('refresh should update state', () {
      final viewModel = container.read(dashboardViewModelProvider.notifier);
      viewModel.refresh();
      final state = container.read(dashboardViewModelProvider);
      expect(state.isLoading, false);
    });
  });
}
