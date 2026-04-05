// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardStateImpl _$$DashboardStateImplFromJson(Map<String, dynamic> json) =>
    _$DashboardStateImpl(
      userName: json['userName'] as String? ?? 'Jane',
      nextAppointmentType: json['nextAppointmentType'] as String?,
      nextAppointmentDate: json['nextAppointmentDate'] as String?,
      nextAppointmentMonth: json['nextAppointmentMonth'] as String?,
      nextAppointmentTime: json['nextAppointmentTime'] as String?,
      nextAppointmentDoctor: json['nextAppointmentDoctor'] as String?,
      isLoading: json['isLoading'] as bool? ?? false,
    );

Map<String, dynamic> _$$DashboardStateImplToJson(
        _$DashboardStateImpl instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'nextAppointmentType': instance.nextAppointmentType,
      'nextAppointmentDate': instance.nextAppointmentDate,
      'nextAppointmentMonth': instance.nextAppointmentMonth,
      'nextAppointmentTime': instance.nextAppointmentTime,
      'nextAppointmentDoctor': instance.nextAppointmentDoctor,
      'isLoading': instance.isLoading,
    };
