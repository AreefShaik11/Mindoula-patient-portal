// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardState _$DashboardStateFromJson(Map<String, dynamic> json) =>
    _DashboardState(
      userName: json['userName'] as String? ?? 'Jane',
      nextAppointmentType: json['nextAppointmentType'] as String?,
      nextAppointmentDate: json['nextAppointmentDate'] as String?,
      nextAppointmentTime: json['nextAppointmentTime'] as String?,
      nextAppointmentDoctor: json['nextAppointmentDoctor'] as String?,
      isLoading: json['isLoading'] as bool? ?? false,
    );

Map<String, dynamic> _$DashboardStateToJson(_DashboardState instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'nextAppointmentType': instance.nextAppointmentType,
      'nextAppointmentDate': instance.nextAppointmentDate,
      'nextAppointmentTime': instance.nextAppointmentTime,
      'nextAppointmentDoctor': instance.nextAppointmentDoctor,
      'isLoading': instance.isLoading,
    };
