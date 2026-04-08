import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/dashboard_state.dart';

part 'dashboard_view_model.g.dart';

@riverpod
class DashboardViewModel extends _$DashboardViewModel {
  @override
  DashboardState build() {
    return const DashboardState(
      userName: 'Jane',
      nextAppointmentType: 'Adult Psychiatry Case Management',
      nextAppointmentDate: '14',
      nextAppointmentMonth: 'April',
      nextAppointmentTime: '10:00 AM',
      nextAppointmentDoctor: 'Dr. Sarah Johnson',
    );
  }

  void refresh() {
    // Immediate refresh for design-only testing
    state = state.copyWith(isLoading: false);
  }
}
