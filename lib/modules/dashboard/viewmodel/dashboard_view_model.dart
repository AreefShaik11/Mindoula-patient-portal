import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_view_model.g.dart';

@riverpod
class DashboardViewModel extends _$DashboardViewModel {
  @override
  Map<String, dynamic> build() {
    return {
      'userName': 'Jane',
      'upcomingAppointment': {
        'date': 'April 14',
        'time': '10:00 AM',
        'provider': 'Dr. Sarah Johnson',
        'specialty': 'Primary Care',
      },
      'notifications': 3,
    };
  }

  void refresh() {
    // Logic for refreshing data
  }
}
