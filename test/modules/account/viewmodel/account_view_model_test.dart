import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindoula_patient_portal/modules/account/viewmodel/account_view_model.dart';

void main() {
  group('AccountViewModel Tests', () {
    test('initial state is correct', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final state = container.read(accountViewModelProvider);
      
      expect(state.fullName, 'Jane Doe'); // Default in AccountState
      expect(state.isLoading, isFalse);
    });

    test('updateFullName updates state', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final viewModel = container.read(accountViewModelProvider.notifier);
      
      viewModel.updateFullName('John Doe');
      expect(container.read(accountViewModelProvider).fullName, 'John Doe');
    });

    test('updateEmail updates state', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final viewModel = container.read(accountViewModelProvider.notifier);
      
      viewModel.updateEmail('john@example.com');
      expect(container.read(accountViewModelProvider).email, 'john@example.com');
    });

    test('updateLanguage updates state', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final viewModel = container.read(accountViewModelProvider.notifier);
      
      viewModel.updateLanguage('Spanish');
      expect(container.read(accountViewModelProvider).language, 'Spanish');
    });

    test('toggleEmailNotifications updates state', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final viewModel = container.read(accountViewModelProvider.notifier);
      
      final initialState = container.read(accountViewModelProvider).emailNotifications;
      viewModel.toggleEmailNotifications(!initialState);
      expect(container.read(accountViewModelProvider).emailNotifications, !initialState);
    });

    test('toggleSmsNotifications updates state', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final viewModel = container.read(accountViewModelProvider.notifier);
      
      final initialState = container.read(accountViewModelProvider).smsNotifications;
      viewModel.toggleSmsNotifications(!initialState);
      expect(container.read(accountViewModelProvider).smsNotifications, !initialState);
    });

    test('saveChanges updates loading state', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final viewModel = container.read(accountViewModelProvider.notifier);
      
      final future = viewModel.saveChanges();
      expect(container.read(accountViewModelProvider).isLoading, isTrue);
      
      await future;
      expect(container.read(accountViewModelProvider).isLoading, isFalse);
    });
  });
}
