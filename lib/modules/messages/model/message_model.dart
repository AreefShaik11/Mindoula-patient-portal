import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

enum MessageSenderType { user, provider, system }

enum MessageType {
  text,
  appointmentRequest,
  refillRequest,
  documentReview,
  prescriptionUpdate,
}

@freezed
class Message with _$Message {
  const factory Message({
    required String id,
    required String content,
    required DateTime timestamp,
    required MessageSenderType senderType,
    required MessageType type,
    String? actionLabel,
    String? actionType,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}

@freezed
class MessageThread with _$MessageThread {
  const factory MessageThread({
    required String id,
    required String participantName,
    required String lastMessage,
    required DateTime lastTimestamp,
    required List<Message> messages,
    @Default(0) int unreadCount,
  }) = _MessageThread;

  factory MessageThread.fromJson(Map<String, dynamic> json) =>
      _$MessageThreadFromJson(json);
}
