import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.freezed.dart';
part 'dashboard_state.g.dart';

@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default('Jane') String userName,
    String? nextAppointmentType,
    String? nextAppointmentDate,
    String? nextAppointmentTime,
    String? nextAppointmentDoctor,
    @Default(false) bool isLoading,
  }) = _DashboardState;

  factory DashboardState.fromJson(Map<String, dynamic> json) => _$DashboardStateFromJson(json);
}
