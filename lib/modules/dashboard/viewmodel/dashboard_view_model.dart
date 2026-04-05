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
      nextAppointmentDate: 'February 10, 2026',
      nextAppointmentTime: '10:30 AM',
      nextAppointmentDoctor: 'Dr. Smith',
    );
  }
}
