import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/message_model.dart';

part 'message_view_model.g.dart';

@riverpod
class MessageViewModel extends _$MessageViewModel {
  @override
  Map<String, dynamic> build() {
    final now = DateTime.now();
    final threads = [
      MessageThread(
        id: '1',
        participantName: 'Dr. Sarah Johnson',
        lastMessage: 'I sent the request to the specialty team.',
        lastTimestamp: now.subtract(const Duration(minutes: 5)),
        unreadCount: 0,
        messages: [
          Message(
            id: 'm1',
            content: 'Hello Jane, I reviewed your lab results.',
            timestamp: now.subtract(const Duration(hours: 2)),
            senderType: MessageSenderType.provider,
          ),
          Message(
            id: 'm2',
            content: 'Thank you doctor. What are the next steps?',
            timestamp: now.subtract(const Duration(hours: 1, minutes: 30)),
            senderType: MessageSenderType.patient,
          ),
          Message(
            id: 'm3',
            content: 'I am requesting a consultation with a specialist.',
            timestamp: now.subtract(const Duration(minutes: 10)),
            senderType: MessageSenderType.provider,
            type: MessageType.appointmentRequest,
            actionLabel: 'Schedule',
          ),
          Message(
            id: 'm4',
            content: 'I sent the request to the specialty team.',
            timestamp: now.subtract(const Duration(minutes: 5)),
            senderType: MessageSenderType.provider,
          ),
        ],
      ),
      MessageThread(
        id: '2',
        participantName: 'Billing Department',
        lastMessage: 'Your insurance has been verified.',
        lastTimestamp: now.subtract(const Duration(days: 1)),
        unreadCount: 0,
        messages: [],
      ),
    ];

    return {
      'threads': threads,
      'selectedThreadId': '1',
    };
  }

  void selectThread(String id) {
    state = {...state, 'selectedThreadId': id};
  }

  void sendMessage(String content) {
    // Mock send logic
  }
}
