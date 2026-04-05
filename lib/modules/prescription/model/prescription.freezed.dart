// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prescription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Prescription _$PrescriptionFromJson(Map<String, dynamic> json) {
  return _Prescription.fromJson(json);
}

/// @nodoc
mixin _$Prescription {
  String get id => throw _privateConstructorUsedError;
  String get drugName => throw _privateConstructorUsedError;
  String get dosage => throw _privateConstructorUsedError;
  String get frequency => throw _privateConstructorUsedError;
  PrescriptionStatus get status => throw _privateConstructorUsedError;
  DateTime get lastRefill => throw _privateConstructorUsedError;
  int get refillsRemaining => throw _privateConstructorUsedError;

  /// Serializes this Prescription to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Prescription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrescriptionCopyWith<Prescription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrescriptionCopyWith<$Res> {
  factory $PrescriptionCopyWith(
          Prescription value, $Res Function(Prescription) then) =
      _$PrescriptionCopyWithImpl<$Res, Prescription>;
  @useResult
  $Res call(
      {String id,
      String drugName,
      String dosage,
      String frequency,
      PrescriptionStatus status,
      DateTime lastRefill,
      int refillsRemaining});
}

/// @nodoc
class _$PrescriptionCopyWithImpl<$Res, $Val extends Prescription>
    implements $PrescriptionCopyWith<$Res> {
  _$PrescriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Prescription
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? drugName = null,
    Object? dosage = null,
    Object? frequency = null,
    Object? status = null,
    Object? lastRefill = null,
    Object? refillsRemaining = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      drugName: null == drugName
          ? _value.drugName
          : drugName // ignore: cast_nullable_to_non_nullable
              as String,
      dosage: null == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PrescriptionStatus,
      lastRefill: null == lastRefill
          ? _value.lastRefill
          : lastRefill // ignore: cast_nullable_to_non_nullable
              as DateTime,
      refillsRemaining: null == refillsRemaining
          ? _value.refillsRemaining
          : refillsRemaining // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrescriptionImplCopyWith<$Res>
    implements $PrescriptionCopyWith<$Res> {
  factory _$$PrescriptionImplCopyWith(
          _$PrescriptionImpl value, $Res Function(_$PrescriptionImpl) then) =
      __$$PrescriptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String drugName,
      String dosage,
      String frequency,
      PrescriptionStatus status,
      DateTime lastRefill,
      int refillsRemaining});
}

/// @nodoc
class __$$PrescriptionImplCopyWithImpl<$Res>
    extends _$PrescriptionCopyWithImpl<$Res, _$PrescriptionImpl>
    implements _$$PrescriptionImplCopyWith<$Res> {
  __$$PrescriptionImplCopyWithImpl(
      _$PrescriptionImpl _value, $Res Function(_$PrescriptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Prescription
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? drugName = null,
    Object? dosage = null,
    Object? frequency = null,
    Object? status = null,
    Object? lastRefill = null,
    Object? refillsRemaining = null,
  }) {
    return _then(_$PrescriptionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      drugName: null == drugName
          ? _value.drugName
          : drugName // ignore: cast_nullable_to_non_nullable
              as String,
      dosage: null == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PrescriptionStatus,
      lastRefill: null == lastRefill
          ? _value.lastRefill
          : lastRefill // ignore: cast_nullable_to_non_nullable
              as DateTime,
      refillsRemaining: null == refillsRemaining
          ? _value.refillsRemaining
          : refillsRemaining // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrescriptionImpl implements _Prescription {
  const _$PrescriptionImpl(
      {required this.id,
      required this.drugName,
      required this.dosage,
      required this.frequency,
      required this.status,
      required this.lastRefill,
      required this.refillsRemaining});

  factory _$PrescriptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrescriptionImplFromJson(json);

  @override
  final String id;
  @override
  final String drugName;
  @override
  final String dosage;
  @override
  final String frequency;
  @override
  final PrescriptionStatus status;
  @override
  final DateTime lastRefill;
  @override
  final int refillsRemaining;

  @override
  String toString() {
    return 'Prescription(id: $id, drugName: $drugName, dosage: $dosage, frequency: $frequency, status: $status, lastRefill: $lastRefill, refillsRemaining: $refillsRemaining)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrescriptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.drugName, drugName) ||
                other.drugName == drugName) &&
            (identical(other.dosage, dosage) || other.dosage == dosage) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lastRefill, lastRefill) ||
                other.lastRefill == lastRefill) &&
            (identical(other.refillsRemaining, refillsRemaining) ||
                other.refillsRemaining == refillsRemaining));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, drugName, dosage, frequency,
      status, lastRefill, refillsRemaining);

  /// Create a copy of Prescription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrescriptionImplCopyWith<_$PrescriptionImpl> get copyWith =>
      __$$PrescriptionImplCopyWithImpl<_$PrescriptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrescriptionImplToJson(
      this,
    );
  }
}

abstract class _Prescription implements Prescription {
  const factory _Prescription(
      {required final String id,
      required final String drugName,
      required final String dosage,
      required final String frequency,
      required final PrescriptionStatus status,
      required final DateTime lastRefill,
      required final int refillsRemaining}) = _$PrescriptionImpl;

  factory _Prescription.fromJson(Map<String, dynamic> json) =
      _$PrescriptionImpl.fromJson;

  @override
  String get id;
  @override
  String get drugName;
  @override
  String get dosage;
  @override
  String get frequency;
  @override
  PrescriptionStatus get status;
  @override
  DateTime get lastRefill;
  @override
  int get refillsRemaining;

  /// Create a copy of Prescription
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrescriptionImplCopyWith<_$PrescriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
