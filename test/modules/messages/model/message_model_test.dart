import 'package:flutter_test/flutter_test.dart';
import 'package:mindoula_patient_portal/modules/messages/model/message_model.dart';

void main() {
  group('MessageModel', () {
    group('MessageSenderType', () {
      test('should have correct enum values', () {
        expect(MessageSenderType.values, contains(MessageSenderType.user));
        expect(MessageSenderType.values, contains(MessageSenderType.provider));
        expect(MessageSenderType.values, contains(MessageSenderType.system));
      });
    });

    group('MessageType', () {
      test('should have correct enum values', () {
        expect(MessageType.values, contains(MessageType.text));
        expect(MessageType.values, contains(MessageType.appointmentRequest));
        expect(MessageType.values, contains(MessageType.refillRequest));
        expect(MessageType.values, contains(MessageType.documentReview));
        expect(MessageType.values, contains(MessageType.prescriptionUpdate));
      });
    });

    group('Message', () {
      test('should create Message with required fields', () {
        final message = Message(
          id: 'msg_123',
          content: 'Hello, how are you?',
          timestamp: DateTime(2024, 1, 15, 10, 30),
          senderType: MessageSenderType.user,
          type: MessageType.text,
        );

        expect(message.id, 'msg_123');
        expect(message.content, 'Hello, how are you?');
        expect(message.timestamp, DateTime(2024, 1, 15, 10, 30));
        expect(message.senderType, MessageSenderType.user);
        expect(message.type, MessageType.text);
        expect(message.actionLabel, null);
        expect(message.actionType, null);
      });

      test('should create Message with optional fields', () {
        final message = Message(
          id: 'msg_456',
          content: 'Please approve my appointment',
          timestamp: DateTime(2024, 2, 20, 14, 15),
          senderType: MessageSenderType.user,
          type: MessageType.appointmentRequest,
          actionLabel: 'Approve',
          actionType: 'approve_appointment',
        );

        expect(message.actionLabel, 'Approve');
        expect(message.actionType, 'approve_appointment');
      });

      test('should create Message from JSON', () {
        final json = {
          'id': 'msg_789',
          'content': 'Your prescription is ready',
          'timestamp': '2024-03-10T09:00:00.000Z',
          'senderType': 'provider',
          'type': 'prescriptionUpdate',
          'actionLabel': 'View Details',
          'actionType': 'view_prescription',
        };

        final message = Message.fromJson(json);

        expect(message.id, 'msg_789');
        expect(message.content, 'Your prescription is ready');
        expect(message.senderType, MessageSenderType.provider);
        expect(message.type, MessageType.prescriptionUpdate);
        expect(message.actionLabel, 'View Details');
        expect(message.actionType, 'view_prescription');
      });

      test('should support equality', () {
        final message1 = Message(
          id: 'msg_same',
          content: 'Same content',
          timestamp: DateTime(2024, 4, 5),
          senderType: MessageSenderType.system,
          type: MessageType.text,
        );
        final message2 = Message(
          id: 'msg_same',
          content: 'Same content',
          timestamp: DateTime(2024, 4, 5),
          senderType: MessageSenderType.system,
          type: MessageType.text,
        );
        final message3 = Message(
          id: 'msg_different',
          content: 'Same content',
          timestamp: DateTime(2024, 4, 5),
          senderType: MessageSenderType.system,
          type: MessageType.text,
        );

        expect(message1, equals(message2));
        expect(message1, isNot(equals(message3)));
      });

      test('should support copyWith', () {
        final message = Message(
          id: 'msg_original',
          content: 'Original content',
          timestamp: DateTime(2024, 4, 5),
          senderType: MessageSenderType.user,
          type: MessageType.text,
        );
        final updatedMessage = message.copyWith(content: 'Updated content');

        expect(updatedMessage.content, 'Updated content');
        expect(updatedMessage.id, message.id); // unchanged
        expect(updatedMessage.senderType, message.senderType); // unchanged
      });
    });

    group('MessageThread', () {
      test('should create MessageThread with required fields', () {
        final messageThread = MessageThread(
          id: 'thread_123',
          participantName: 'Dr. Smith',
          lastMessage: 'See you tomorrow',
          lastTimestamp: DateTime(2024, 1, 15, 16, 45),
          messages: [
            Message(
              id: 'msg_1',
              content: 'Hello',
              timestamp: DateTime(2024, 1, 15, 16, 30),
              senderType: MessageSenderType.user,
              type: MessageType.text,
            ),
            Message(
              id: 'msg_2',
              content: 'See you tomorrow',
              timestamp: DateTime(2024, 1, 15, 16, 45),
              senderType: MessageSenderType.provider,
              type: MessageType.text,
            ),
          ],
        );

        expect(messageThread.id, 'thread_123');
        expect(messageThread.participantName, 'Dr. Smith');
        expect(messageThread.lastMessage, 'See you tomorrow');
        expect(messageThread.lastTimestamp, DateTime(2024, 1, 15, 16, 45));
        expect(messageThread.messages.length, 2);
        expect(messageThread.unreadCount, 0); // default value
      });

      test('should create MessageThread with unread count', () {
        final messageThread = MessageThread(
          id: 'thread_456',
          participantName: 'Dr. Johnson',
          lastMessage: 'Your test results are ready',
          lastTimestamp: DateTime(2024, 2, 20, 11, 00),
          messages: [],
          unreadCount: 3,
        );

        expect(messageThread.unreadCount, 3);
      });

      test('should create MessageThread from JSON', () {
        final json = {
          'id': 'thread_789',
          'participantName': 'Dr. Wilson',
          'lastMessage': 'Appointment confirmed',
          'lastTimestamp': '2024-03-10T14:30:00.000Z',
          'messages': [
            {
              'id': 'msg_json',
              'content': 'I need an appointment',
              'timestamp': '2024-03-10T14:00:00.000Z',
              'senderType': 'user',
              'type': 'appointmentRequest',
            }
          ],
          'unreadCount': 1,
        };

        final messageThread = MessageThread.fromJson(json);

        expect(messageThread.id, 'thread_789');
        expect(messageThread.participantName, 'Dr. Wilson');
        expect(messageThread.lastMessage, 'Appointment confirmed');
        expect(messageThread.messages.length, 1);
        expect(messageThread.unreadCount, 1);
      });

      test('should support copyWith', () {
        final messageThread = MessageThread(
          id: 'thread_original',
          participantName: 'Dr. Brown',
          lastMessage: 'Original message',
          lastTimestamp: DateTime(2024, 4, 5),
          messages: [],
        );
        final updatedThread = messageThread.copyWith(unreadCount: 5);

        expect(updatedThread.unreadCount, 5);
        expect(updatedThread.id, messageThread.id); // unchanged
        expect(updatedThread.participantName, messageThread.participantName); // unchanged
      });
    });
  });
}
