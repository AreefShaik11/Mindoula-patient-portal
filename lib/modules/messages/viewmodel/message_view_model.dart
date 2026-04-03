import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/message_model.dart';

part 'message_view_model.g.dart';

@riverpod
class MessageViewModel extends _$MessageViewModel {
  @override
  Map<String, dynamic> build() {
    final threads = [
      MessageThread(
        id: '1',
        participantName: 'Dr. Sarah Smith',
        lastMessage: 'Your lab results are ready for review.',
        lastTimestamp: DateTime.now().subtract(const Duration(minutes: 5)),
        unreadCount: 3,
        messages: [
          Message(
            id: 'm1',
            content: "Hello Jane, I've reviewed your recent bloodwork.",
            timestamp: DateTime.now().subtract(const Duration(hours: 2)),
            senderType: MessageSenderType.provider,
            type: MessageType.text,
          ),
          Message(
            id: 'm2',
            content: "Your results are mostly within range, but I'd like to discuss the iron levels.",
            timestamp: DateTime.now().subtract(const Duration(hours: 1)),
            senderType: MessageSenderType.provider,
            type: MessageType.text,
          ),
          Message(
            id: 'm3',
            content: 'Please schedule a brief follow-up.',
            timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
            senderType: MessageSenderType.provider,
            type: MessageType.appointmentRequest,
            actionLabel: 'Request Appointment',
            actionType: 'appointment_link',
          ),
        ],
      ),
      MessageThread(
        id: '2',
        participantName: 'Care Team',
        lastMessage: 'How are you feeling today?',
        lastTimestamp: DateTime.now().subtract(const Duration(days: 1)),
        unreadCount: 0,
        messages: [
          Message(
            id: 'm4',
            content: 'Checking in on your progress with the new medication.',
            timestamp: DateTime.now().subtract(const Duration(days: 1)),
            senderType: MessageSenderType.provider,
            type: MessageType.text,
          ),
        ],
      ),
    ];

    return {
      'threads': threads,
      'selectedThreadId': threads.first.id,
    };
  }

  void selectThread(String id) {
    state = {...state, 'selectedThreadId': id};
  }
}
