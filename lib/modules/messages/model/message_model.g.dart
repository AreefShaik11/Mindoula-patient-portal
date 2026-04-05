// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageThreadImpl _$$MessageThreadImplFromJson(Map<String, dynamic> json) =>
    _$MessageThreadImpl(
      id: json['id'] as String,
      participantName: json['participantName'] as String,
      lastMessage: json['lastMessage'] as String,
      lastTimestamp: DateTime.parse(json['lastTimestamp'] as String),
      unreadCount: (json['unreadCount'] as num?)?.toInt() ?? 0,
      messages:
          (json['messages'] as List<dynamic>?)
              ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MessageThreadImplToJson(_$MessageThreadImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'participantName': instance.participantName,
      'lastMessage': instance.lastMessage,
      'lastTimestamp': instance.lastTimestamp.toIso8601String(),
      'unreadCount': instance.unreadCount,
      'messages': instance.messages,
    };

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      id: json['id'] as String,
      content: json['content'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      senderType: $enumDecode(_$MessageSenderTypeEnumMap, json['senderType']),
      type:
          $enumDecodeNullable(_$MessageTypeEnumMap, json['type']) ??
          MessageType.text,
      actionLabel: json['actionLabel'] as String?,
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'timestamp': instance.timestamp.toIso8601String(),
      'senderType': _$MessageSenderTypeEnumMap[instance.senderType]!,
      'type': _$MessageTypeEnumMap[instance.type]!,
      'actionLabel': instance.actionLabel,
    };

const _$MessageSenderTypeEnumMap = {
  MessageSenderType.patient: 'patient',
  MessageSenderType.provider: 'provider',
  MessageSenderType.system: 'system',
};

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.appointmentRequest: 'appointmentRequest',
  MessageType.prescriptionUpdate: 'prescriptionUpdate',
};
