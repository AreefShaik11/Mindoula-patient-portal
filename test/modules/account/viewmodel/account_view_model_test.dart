import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindoula_patient_portal/modules/account/viewmodel/account_view_model.dart';
import 'package:mindoula_patient_portal/modules/account/model/account_state.dart';

void main() {
  group('AccountViewModel', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('should have initial state', () {
      final state = container.read(accountViewModelProvider);
      expect(state.fullName, 'Jane Doe');
      expect(state.isLoading, false);
    });

    test('should update fields correctly', () {
      final viewModel = container.read(accountViewModelProvider.notifier);
      
      viewModel.updateFullName('Alice');
      viewModel.updateEmail('alice@test.com');
      viewModel.updateLanguage('French');
      viewModel.toggleEmailNotifications(false);
      viewModel.toggleSmsNotifications(true);
      
      final state = container.read(accountViewModelProvider);
      expect(state.fullName, 'Alice');
      expect(state.email, 'alice@test.com');
      expect(state.language, 'French');
      expect(state.emailNotifications, false);
      expect(state.smsNotifications, true);
    });

    test('saveChanges should update loading state', () async {
      final viewModel = container.read(accountViewModelProvider.notifier);
      await viewModel.saveChanges();
      final state = container.read(accountViewModelProvider);
      expect(state.isLoading, false);
    });
  });
}
