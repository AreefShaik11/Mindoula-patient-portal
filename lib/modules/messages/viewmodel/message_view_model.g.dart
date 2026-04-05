// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MessageViewModel)
final messageViewModelProvider = MessageViewModelProvider._();

final class MessageViewModelProvider
    extends $NotifierProvider<MessageViewModel, Map<String, dynamic>> {
  MessageViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'messageViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$messageViewModelHash();

  @$internal
  @override
  MessageViewModel create() => MessageViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, dynamic> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, dynamic>>(value),
    );
  }
}

String _$messageViewModelHash() => r'75e09376b37940166714783436afb67b846282cf';

abstract class _$MessageViewModel extends $Notifier<Map<String, dynamic>> {
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
