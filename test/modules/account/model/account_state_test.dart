import 'package:flutter_test/flutter_test.dart';
import 'package:mindoula_patient_portal/modules/account/model/account_state.dart';

void main() {
  group('AccountState', () {
    test('should create default AccountState', () {
      const accountState = AccountState();
      
      expect(accountState.fullName, 'Jane Doe');
      expect(accountState.email, 'jane.doe@mail.com');
      expect(accountState.language, 'English');
      expect(accountState.emailNotifications, true);
      expect(accountState.smsNotifications, false);
      expect(accountState.isLoading, false);
      expect(accountState.errorMessage, null);
    });

    test('should create AccountState with custom values', () {
      const accountState = AccountState(
        fullName: 'John Smith',
        email: 'john.smith@mail.com',
        language: 'Spanish',
        emailNotifications: false,
        smsNotifications: true,
        isLoading: true,
        errorMessage: 'Error occurred',
      );
      
      expect(accountState.fullName, 'John Smith');
      expect(accountState.email, 'john.smith@mail.com');
      expect(accountState.language, 'Spanish');
      expect(accountState.emailNotifications, false);
      expect(accountState.smsNotifications, true);
      expect(accountState.isLoading, true);
      expect(accountState.errorMessage, 'Error occurred');
    });

    test('should create AccountState from JSON', () {
      final json = {
        'fullName': 'Alice Johnson',
        'email': 'alice@mail.com',
        'language': 'French',
        'emailNotifications': false,
        'smsNotifications': true,
        'isLoading': true,
        'errorMessage': 'Network error',
      };

      final accountState = AccountState.fromJson(json);

      expect(accountState.fullName, 'Alice Johnson');
      expect(accountState.email, 'alice@mail.com');
      expect(accountState.language, 'French');
      expect(accountState.emailNotifications, false);
      expect(accountState.smsNotifications, true);
      expect(accountState.isLoading, true);
      expect(accountState.errorMessage, 'Network error');
    });

    test('should create AccountState from JSON with partial data', () {
      final json = {
        'fullName': 'Bob Wilson',
        'email': 'bob@mail.com',
      };

      final accountState = AccountState.fromJson(json);

      expect(accountState.fullName, 'Bob Wilson');
      expect(accountState.email, 'bob@mail.com');
      expect(accountState.language, 'English'); // default value
      expect(accountState.emailNotifications, true); // default value
      expect(accountState.smsNotifications, false); // default value
      expect(accountState.isLoading, false); // default value
      expect(accountState.errorMessage, null); // default value
    });

    test('should support equality', () {
      const accountState1 = AccountState(fullName: 'Test User');
      const accountState2 = AccountState(fullName: 'Test User');
      const accountState3 = AccountState(fullName: 'Different User');

      expect(accountState1, equals(accountState2));
      expect(accountState1, isNot(equals(accountState3)));
    });

    test('should support copyWith', () {
      const accountState = AccountState(fullName: 'Original Name');
      final updatedState = accountState.copyWith(fullName: 'Updated Name');

      expect(updatedState.fullName, 'Updated Name');
      expect(updatedState.email, accountState.email); // unchanged
      expect(updatedState.language, accountState.language); // unchanged
    });
  });
}
