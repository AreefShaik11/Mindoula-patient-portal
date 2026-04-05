// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'billing_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BillingStatement _$BillingStatementFromJson(Map<String, dynamic> json) {
  return _BillingStatement.fromJson(json);
}

/// @nodoc
mixin _$BillingStatement {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this BillingStatement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BillingStatement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BillingStatementCopyWith<BillingStatement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillingStatementCopyWith<$Res> {
  factory $BillingStatementCopyWith(
    BillingStatement value,
    $Res Function(BillingStatement) then,
  ) = _$BillingStatementCopyWithImpl<$Res, BillingStatement>;
  @useResult
  $Res call({String id, DateTime date, double amount, String status});
}

/// @nodoc
class _$BillingStatementCopyWithImpl<$Res, $Val extends BillingStatement>
    implements $BillingStatementCopyWith<$Res> {
  _$BillingStatementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BillingStatement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? amount = null,
    Object? status = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BillingStatementImplCopyWith<$Res>
    implements $BillingStatementCopyWith<$Res> {
  factory _$$BillingStatementImplCopyWith(
    _$BillingStatementImpl value,
    $Res Function(_$BillingStatementImpl) then,
  ) = __$$BillingStatementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, DateTime date, double amount, String status});
}

/// @nodoc
class __$$BillingStatementImplCopyWithImpl<$Res>
    extends _$BillingStatementCopyWithImpl<$Res, _$BillingStatementImpl>
    implements _$$BillingStatementImplCopyWith<$Res> {
  __$$BillingStatementImplCopyWithImpl(
    _$BillingStatementImpl _value,
    $Res Function(_$BillingStatementImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BillingStatement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? amount = null,
    Object? status = null,
  }) {
    return _then(
      _$BillingStatementImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BillingStatementImpl implements _BillingStatement {
  const _$BillingStatementImpl({
    required this.id,
    required this.date,
    required this.amount,
    required this.status,
  });

  factory _$BillingStatementImpl.fromJson(Map<String, dynamic> json) =>
      _$$BillingStatementImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final double amount;
  @override
  final String status;

  @override
  String toString() {
    return 'BillingStatement(id: $id, date: $date, amount: $amount, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillingStatementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, amount, status);

  /// Create a copy of BillingStatement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BillingStatementImplCopyWith<_$BillingStatementImpl> get copyWith =>
      __$$BillingStatementImplCopyWithImpl<_$BillingStatementImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BillingStatementImplToJson(this);
  }
}

abstract class _BillingStatement implements BillingStatement {
  const factory _BillingStatement({
    required final String id,
    required final DateTime date,
    required final double amount,
    required final String status,
  }) = _$BillingStatementImpl;

  factory _BillingStatement.fromJson(Map<String, dynamic> json) =
      _$BillingStatementImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  double get amount;
  @override
  String get status;

  /// Create a copy of BillingStatement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BillingStatementImplCopyWith<_$BillingStatementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
