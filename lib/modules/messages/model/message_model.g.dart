// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Message _$MessageFromJson(Map<String, dynamic> json) => _Message(
  id: json['id'] as String,
  content: json['content'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
  senderType: $enumDecode(_$MessageSenderTypeEnumMap, json['senderType']),
  type: $enumDecode(_$MessageTypeEnumMap, json['type']),
  actionLabel: json['actionLabel'] as String?,
  actionType: json['actionType'] as String?,
);

Map<String, dynamic> _$MessageToJson(_Message instance) => <String, dynamic>{
  'id': instance.id,
  'content': instance.content,
  'timestamp': instance.timestamp.toIso8601String(),
  'senderType': _$MessageSenderTypeEnumMap[instance.senderType]!,
  'type': _$MessageTypeEnumMap[instance.type]!,
  'actionLabel': instance.actionLabel,
  'actionType': instance.actionType,
};

const _$MessageSenderTypeEnumMap = {
  MessageSenderType.user: 'user',
  MessageSenderType.provider: 'provider',
  MessageSenderType.system: 'system',
};

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.appointmentRequest: 'appointmentRequest',
  MessageType.refillRequest: 'refillRequest',
  MessageType.documentReview: 'documentReview',
};

_MessageThread _$MessageThreadFromJson(Map<String, dynamic> json) =>
    _MessageThread(
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

Map<String, dynamic> _$MessageThreadToJson(_MessageThread instance) =>
    <String, dynamic>{
      'id': instance.id,
      'participantName': instance.participantName,
      'lastMessage': instance.lastMessage,
      'lastTimestamp': instance.lastTimestamp.toIso8601String(),
      'unreadCount': instance.unreadCount,
      'messages': instance.messages,
    };
