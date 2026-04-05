import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_view_model.g.dart';

@riverpod
class AccountViewModel extends _$AccountViewModel {
  @override
  Map<String, dynamic> build() {
    return {
      'profile': {
        'name': 'Jane Doe',
        'dob': '01/01/1990',
        'email': 'jane.doe@example.com',
        'phone': '(555) 000-1234',
        'address': '123 Main St, Anytown, ST 12345',
      },
      'delegates': [
        {'id': 'd1', 'name': 'John Doe', 'relation': 'Father'},
      ],
    };
  }

  void updateProfile(String field, String value) {
    // Mock logic for updating profile
  }
}
