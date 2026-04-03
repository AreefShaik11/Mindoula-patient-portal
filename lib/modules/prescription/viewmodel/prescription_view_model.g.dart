// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PrescriptionViewModel)
final prescriptionViewModelProvider = PrescriptionViewModelProvider._();

final class PrescriptionViewModelProvider
    extends $NotifierProvider<PrescriptionViewModel, List<Prescription>> {
  PrescriptionViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'prescriptionViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$prescriptionViewModelHash();

  @$internal
  @override
  PrescriptionViewModel create() => PrescriptionViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Prescription> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Prescription>>(value),
    );
  }
}

String _$prescriptionViewModelHash() =>
    r'bbdc069832cef61ec2ab7dd89a8eac5fcbc5830f';

abstract class _$PrescriptionViewModel extends $Notifier<List<Prescription>> {
  List<Prescription> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Prescription>, List<Prescription>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Prescription>, List<Prescription>>,
              List<Prescription>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
