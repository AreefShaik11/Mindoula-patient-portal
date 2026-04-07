import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/account_state.dart';

part 'account_view_model.g.dart';

@riverpod
class AccountViewModel extends _$AccountViewModel {
  @override
  AccountState build() {
    return const AccountState();
  }

  void updateFullName(String name) {
    state = state.copyWith(fullName: name);
  }

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updateLanguage(String language) {
    state = state.copyWith(language: language);
  }

  void toggleEmailNotifications(bool value) {
    state = state.copyWith(emailNotifications: value);
  }

  void toggleSmsNotifications(bool value) {
    state = state.copyWith(smsNotifications: value);
  }
  
  Future<void> saveChanges() async {
    state = state.copyWith(isLoading: true);
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    if (!ref.mounted) return;
    state = state.copyWith(isLoading: false);
  }
}
