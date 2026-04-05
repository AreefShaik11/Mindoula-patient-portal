import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_state.freezed.dart';
part 'account_state.g.dart';

@freezed
abstract class AccountState with _$AccountState {
  const factory AccountState({
    @Default('Jane Doe') String fullName,
    @Default('jane.doe@mail.com') String email,
    @Default('English') String language,
    @Default(true) bool emailNotifications,
    @Default(false) bool smsNotifications,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _AccountState;

  factory AccountState.fromJson(Map<String, dynamic> json) => _$AccountStateFromJson(json);
}
