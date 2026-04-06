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
        participantName: 'Northside Clinic',
        lastMessage: 'Your lab results are ready.',
        lastTimestamp: now.subtract(const Duration(minutes: 5)),
        unreadCount: 3,
        messages: [
          Message(
            id: 'm1',
            content: 'Your April 3 appointment is confirmed',
            timestamp: now.subtract(const Duration(hours: 24)),
            senderType: MessageSenderType.system,
            type: MessageType.appointmentConfirmation,
            actionLabel: 'View',
            actionType: 'appointment_view',
          ),
          Message(
            id: 'm2',
            content: "You've received a consent form to sign.",
            timestamp: now.subtract(const Duration(hours: 20)),
            senderType: MessageSenderType.system,
            type: MessageType.documentReview,
            actionLabel: 'Review & Sign',
          ),
          Message(
            id: 'm3',
            content: "Your lab results are ready. Results from March 22 visit are now available in your portal. Your provider will review these with you at your next appointment.",
            timestamp: now.subtract(const Duration(minutes: 30)),
            senderType: MessageSenderType.system,
            type: MessageType.labResults,
            actionLabel: 'View',
          ),
        ],
      ),
      MessageThread(
        id: '2',
        participantName: 'Dr. J Kim',
        lastMessage: 'I have been feeling a bit better overal',
        lastTimestamp: now.subtract(const Duration(hours: 1)),
        unreadCount: 0,
        messages: [
          Message(
            id: 'm4',
            content: 'Hi Jane, I wanted to let you know your lab results from last week are in. Overall they look good—I will go through them with you at your next appointment on April 3. In the meantime feel free to review them.',
            timestamp: now.subtract(const Duration(hours: 2)),
            senderType: MessageSenderType.provider,
            type: MessageType.text,
          ),
          Message(
            id: 'm5',
            content: 'I have been feeling a bit better overall, though sleep is still a little difficult some nights.',
            timestamp: now.subtract(const Duration(minutes: 10)),
            senderType: MessageSenderType.user,
            type: MessageType.text,
          ),
        ],
      ),
      MessageThread(
        id: '3',
        participantName: 'Care Team',
        lastMessage: 'How are you feeling today?',
        lastTimestamp: now.subtract(const Duration(days: 1)),
        unreadCount: 0,
        messages: [
          Message(
            id: 'm6',
            content: 'Checking in on your progress with the new medication.',
            timestamp: now.subtract(const Duration(days: 1)),
            senderType: MessageSenderType.provider,
            type: MessageType.text,
          ),
        ],
      ),
      MessageThread(
        id: '4',
        participantName: 'Billing Questions',
        lastMessage: 'Send over the documents when you can.',
        lastTimestamp: now.subtract(const Duration(days: 2)),
        unreadCount: 0,
        messages: [
          Message(
            id: 'm7',
            content: 'Send over the documents when you can.',
            timestamp: now.subtract(const Duration(days: 2)),
            senderType: MessageSenderType.provider,
            type: MessageType.text,
          ),
        ],
      ),
    ];

    return {'threads': threads, 'selectedThreadId': threads.first.id};
  }

  void selectThread(String id) {
    state = {...state, 'selectedThreadId': id};
  }

  void sendMessage(String content) {
    // Simulated send logic
  }
}
