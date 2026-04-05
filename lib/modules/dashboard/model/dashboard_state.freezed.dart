// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardState {

 String get userName; String? get nextAppointmentType; String? get nextAppointmentDate; String? get nextAppointmentTime; String? get nextAppointmentDoctor; bool get isLoading;
/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardStateCopyWith<DashboardState> get copyWith => _$DashboardStateCopyWithImpl<DashboardState>(this as DashboardState, _$identity);

  /// Serializes this DashboardState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardState&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.nextAppointmentType, nextAppointmentType) || other.nextAppointmentType == nextAppointmentType)&&(identical(other.nextAppointmentDate, nextAppointmentDate) || other.nextAppointmentDate == nextAppointmentDate)&&(identical(other.nextAppointmentTime, nextAppointmentTime) || other.nextAppointmentTime == nextAppointmentTime)&&(identical(other.nextAppointmentDoctor, nextAppointmentDoctor) || other.nextAppointmentDoctor == nextAppointmentDoctor)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userName,nextAppointmentType,nextAppointmentDate,nextAppointmentTime,nextAppointmentDoctor,isLoading);

@override
String toString() {
  return 'DashboardState(userName: $userName, nextAppointmentType: $nextAppointmentType, nextAppointmentDate: $nextAppointmentDate, nextAppointmentTime: $nextAppointmentTime, nextAppointmentDoctor: $nextAppointmentDoctor, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $DashboardStateCopyWith<$Res>  {
  factory $DashboardStateCopyWith(DashboardState value, $Res Function(DashboardState) _then) = _$DashboardStateCopyWithImpl;
@useResult
$Res call({
 String userName, String? nextAppointmentType, String? nextAppointmentDate, String? nextAppointmentTime, String? nextAppointmentDoctor, bool isLoading
});




}
/// @nodoc
class _$DashboardStateCopyWithImpl<$Res>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._self, this._then);

  final DashboardState _self;
  final $Res Function(DashboardState) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userName = null,Object? nextAppointmentType = freezed,Object? nextAppointmentDate = freezed,Object? nextAppointmentTime = freezed,Object? nextAppointmentDoctor = freezed,Object? isLoading = null,}) {
  return _then(_self.copyWith(
userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,nextAppointmentType: freezed == nextAppointmentType ? _self.nextAppointmentType : nextAppointmentType // ignore: cast_nullable_to_non_nullable
as String?,nextAppointmentDate: freezed == nextAppointmentDate ? _self.nextAppointmentDate : nextAppointmentDate // ignore: cast_nullable_to_non_nullable
as String?,nextAppointmentTime: freezed == nextAppointmentTime ? _self.nextAppointmentTime : nextAppointmentTime // ignore: cast_nullable_to_non_nullable
as String?,nextAppointmentDoctor: freezed == nextAppointmentDoctor ? _self.nextAppointmentDoctor : nextAppointmentDoctor // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardState].
extension DashboardStatePatterns on DashboardState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardState value)  $default,){
final _that = this;
switch (_that) {
case _DashboardState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardState value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userName,  String? nextAppointmentType,  String? nextAppointmentDate,  String? nextAppointmentTime,  String? nextAppointmentDoctor,  bool isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
return $default(_that.userName,_that.nextAppointmentType,_that.nextAppointmentDate,_that.nextAppointmentTime,_that.nextAppointmentDoctor,_that.isLoading);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userName,  String? nextAppointmentType,  String? nextAppointmentDate,  String? nextAppointmentTime,  String? nextAppointmentDoctor,  bool isLoading)  $default,) {final _that = this;
switch (_that) {
case _DashboardState():
return $default(_that.userName,_that.nextAppointmentType,_that.nextAppointmentDate,_that.nextAppointmentTime,_that.nextAppointmentDoctor,_that.isLoading);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userName,  String? nextAppointmentType,  String? nextAppointmentDate,  String? nextAppointmentTime,  String? nextAppointmentDoctor,  bool isLoading)?  $default,) {final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
return $default(_that.userName,_that.nextAppointmentType,_that.nextAppointmentDate,_that.nextAppointmentTime,_that.nextAppointmentDoctor,_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardState implements DashboardState {
  const _DashboardState({this.userName = 'Jane', this.nextAppointmentType, this.nextAppointmentDate, this.nextAppointmentTime, this.nextAppointmentDoctor, this.isLoading = false});
  factory _DashboardState.fromJson(Map<String, dynamic> json) => _$DashboardStateFromJson(json);

@override@JsonKey() final  String userName;
@override final  String? nextAppointmentType;
@override final  String? nextAppointmentDate;
@override final  String? nextAppointmentTime;
@override final  String? nextAppointmentDoctor;
@override@JsonKey() final  bool isLoading;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardStateCopyWith<_DashboardState> get copyWith => __$DashboardStateCopyWithImpl<_DashboardState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardState&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.nextAppointmentType, nextAppointmentType) || other.nextAppointmentType == nextAppointmentType)&&(identical(other.nextAppointmentDate, nextAppointmentDate) || other.nextAppointmentDate == nextAppointmentDate)&&(identical(other.nextAppointmentTime, nextAppointmentTime) || other.nextAppointmentTime == nextAppointmentTime)&&(identical(other.nextAppointmentDoctor, nextAppointmentDoctor) || other.nextAppointmentDoctor == nextAppointmentDoctor)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userName,nextAppointmentType,nextAppointmentDate,nextAppointmentTime,nextAppointmentDoctor,isLoading);

@override
String toString() {
  return 'DashboardState(userName: $userName, nextAppointmentType: $nextAppointmentType, nextAppointmentDate: $nextAppointmentDate, nextAppointmentTime: $nextAppointmentTime, nextAppointmentDoctor: $nextAppointmentDoctor, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$DashboardStateCopyWith<$Res> implements $DashboardStateCopyWith<$Res> {
  factory _$DashboardStateCopyWith(_DashboardState value, $Res Function(_DashboardState) _then) = __$DashboardStateCopyWithImpl;
@override @useResult
$Res call({
 String userName, String? nextAppointmentType, String? nextAppointmentDate, String? nextAppointmentTime, String? nextAppointmentDoctor, bool isLoading
});




}
/// @nodoc
class __$DashboardStateCopyWithImpl<$Res>
    implements _$DashboardStateCopyWith<$Res> {
  __$DashboardStateCopyWithImpl(this._self, this._then);

  final _DashboardState _self;
  final $Res Function(_DashboardState) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userName = null,Object? nextAppointmentType = freezed,Object? nextAppointmentDate = freezed,Object? nextAppointmentTime = freezed,Object? nextAppointmentDoctor = freezed,Object? isLoading = null,}) {
  return _then(_DashboardState(
userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,nextAppointmentType: freezed == nextAppointmentType ? _self.nextAppointmentType : nextAppointmentType // ignore: cast_nullable_to_non_nullable
as String?,nextAppointmentDate: freezed == nextAppointmentDate ? _self.nextAppointmentDate : nextAppointmentDate // ignore: cast_nullable_to_non_nullable
as String?,nextAppointmentTime: freezed == nextAppointmentTime ? _self.nextAppointmentTime : nextAppointmentTime // ignore: cast_nullable_to_non_nullable
as String?,nextAppointmentDoctor: freezed == nextAppointmentDoctor ? _self.nextAppointmentDoctor : nextAppointmentDoctor // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
