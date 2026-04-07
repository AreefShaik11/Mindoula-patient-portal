import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindoula_patient_portal/modules/messages/viewmodel/message_view_model.dart';
import 'package:mindoula_patient_portal/modules/messages/model/message_model.dart';

void main() {
  group('MessageViewModel Tests', () {
    test('initial state contains expected data', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      
      final state = container.read(messageViewModelProvider);
      
      expect(state['threads'], isA<List<MessageThread>>());
      expect((state['threads'] as List).length, 2);
      expect(state['selectedThreadId'], '1');
    });

    test('selectThread updates state', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final notifier = container.read(messageViewModelProvider.notifier);
      
      notifier.selectThread('2');
      expect(container.read(messageViewModelProvider)['selectedThreadId'], '2');
    });
  });
}
