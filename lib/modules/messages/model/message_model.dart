import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
class MessageThread with _$MessageThread {
  const factory MessageThread({
    required String id,
    required String participantName,
    required String lastMessage,
    required DateTime lastTimestamp,
    @Default(0) int unreadCount,
    @Default([]) List<Message> messages,
  }) = _MessageThread;

  factory MessageThread.fromJson(Map<String, dynamic> json) => _$MessageThreadFromJson(json);
}

@freezed
class Message with _$Message {
  const factory Message({
    required String id,
    required String content,
    required DateTime timestamp,
    required MessageSenderType senderType,
    @Default(MessageType.text) MessageType type,
    String? actionLabel,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}

enum MessageSenderType { patient, provider, system }
enum MessageType { text, appointmentRequest, prescriptionUpdate }
