// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountState _$AccountStateFromJson(Map<String, dynamic> json) =>
    _AccountState(
      fullName: json['fullName'] as String? ?? 'Jane Doe',
      email: json['email'] as String? ?? 'jane.doe@mail.com',
      language: json['language'] as String? ?? 'English',
      emailNotifications: json['emailNotifications'] as bool? ?? true,
      smsNotifications: json['smsNotifications'] as bool? ?? false,
      isLoading: json['isLoading'] as bool? ?? false,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$AccountStateToJson(_AccountState instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'language': instance.language,
      'emailNotifications': instance.emailNotifications,
      'smsNotifications': instance.smsNotifications,
      'isLoading': instance.isLoading,
      'errorMessage': instance.errorMessage,
    };
