// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AccountViewModel)
final accountViewModelProvider = AccountViewModelProvider._();

final class AccountViewModelProvider
    extends $NotifierProvider<AccountViewModel, AccountState> {
  AccountViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'accountViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$accountViewModelHash();

  @$internal
  @override
  AccountViewModel create() => AccountViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AccountState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AccountState>(value),
    );
  }
}

String _$accountViewModelHash() => r'b001f2f420e4e9ff6b1d516a1a8c1f73d1cdf468';

abstract class _$AccountViewModel extends $Notifier<AccountState> {
  AccountState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AccountState, AccountState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AccountState, AccountState>,
              AccountState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
