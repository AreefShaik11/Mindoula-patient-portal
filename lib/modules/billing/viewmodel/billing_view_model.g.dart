// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BillingViewModel)
final billingViewModelProvider = BillingViewModelProvider._();

final class BillingViewModelProvider
    extends $NotifierProvider<BillingViewModel, Map<String, dynamic>> {
  BillingViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'billingViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$billingViewModelHash();

  @$internal
  @override
  BillingViewModel create() => BillingViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, dynamic> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, dynamic>>(value),
    );
  }
}

String _$billingViewModelHash() => r'165fc6180c7ac9798c58ac9cab06b67173d4f2e1';

abstract class _$BillingViewModel extends $Notifier<Map<String, dynamic>> {
  Map<String, dynamic> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Map<String, dynamic>, Map<String, dynamic>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<String, dynamic>, Map<String, dynamic>>,
              Map<String, dynamic>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
