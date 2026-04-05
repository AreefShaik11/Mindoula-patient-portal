// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountState {

 String get fullName; String get email; String get language; bool get emailNotifications; bool get smsNotifications; bool get isLoading; String? get errorMessage;
/// Create a copy of AccountState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountStateCopyWith<AccountState> get copyWith => _$AccountStateCopyWithImpl<AccountState>(this as AccountState, _$identity);

  /// Serializes this AccountState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountState&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.language, language) || other.language == language)&&(identical(other.emailNotifications, emailNotifications) || other.emailNotifications == emailNotifications)&&(identical(other.smsNotifications, smsNotifications) || other.smsNotifications == smsNotifications)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,email,language,emailNotifications,smsNotifications,isLoading,errorMessage);

@override
String toString() {
  return 'AccountState(fullName: $fullName, email: $email, language: $language, emailNotifications: $emailNotifications, smsNotifications: $smsNotifications, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $AccountStateCopyWith<$Res>  {
  factory $AccountStateCopyWith(AccountState value, $Res Function(AccountState) _then) = _$AccountStateCopyWithImpl;
@useResult
$Res call({
 String fullName, String email, String language, bool emailNotifications, bool smsNotifications, bool isLoading, String? errorMessage
});




}
/// @nodoc
class _$AccountStateCopyWithImpl<$Res>
    implements $AccountStateCopyWith<$Res> {
  _$AccountStateCopyWithImpl(this._self, this._then);

  final AccountState _self;
  final $Res Function(AccountState) _then;

/// Create a copy of AccountState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,Object? email = null,Object? language = null,Object? emailNotifications = null,Object? smsNotifications = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,emailNotifications: null == emailNotifications ? _self.emailNotifications : emailNotifications // ignore: cast_nullable_to_non_nullable
as bool,smsNotifications: null == smsNotifications ? _self.smsNotifications : smsNotifications // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountState].
extension AccountStatePatterns on AccountState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountState value)  $default,){
final _that = this;
switch (_that) {
case _AccountState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountState value)?  $default,){
final _that = this;
switch (_that) {
case _AccountState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fullName,  String email,  String language,  bool emailNotifications,  bool smsNotifications,  bool isLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountState() when $default != null:
return $default(_that.fullName,_that.email,_that.language,_that.emailNotifications,_that.smsNotifications,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fullName,  String email,  String language,  bool emailNotifications,  bool smsNotifications,  bool isLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _AccountState():
return $default(_that.fullName,_that.email,_that.language,_that.emailNotifications,_that.smsNotifications,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fullName,  String email,  String language,  bool emailNotifications,  bool smsNotifications,  bool isLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _AccountState() when $default != null:
return $default(_that.fullName,_that.email,_that.language,_that.emailNotifications,_that.smsNotifications,_that.isLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountState implements AccountState {
  const _AccountState({this.fullName = 'Jane Doe', this.email = 'jane.doe@mail.com', this.language = 'English', this.emailNotifications = true, this.smsNotifications = false, this.isLoading = false, this.errorMessage});
  factory _AccountState.fromJson(Map<String, dynamic> json) => _$AccountStateFromJson(json);

@override@JsonKey() final  String fullName;
@override@JsonKey() final  String email;
@override@JsonKey() final  String language;
@override@JsonKey() final  bool emailNotifications;
@override@JsonKey() final  bool smsNotifications;
@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of AccountState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountStateCopyWith<_AccountState> get copyWith => __$AccountStateCopyWithImpl<_AccountState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountState&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.language, language) || other.language == language)&&(identical(other.emailNotifications, emailNotifications) || other.emailNotifications == emailNotifications)&&(identical(other.smsNotifications, smsNotifications) || other.smsNotifications == smsNotifications)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,email,language,emailNotifications,smsNotifications,isLoading,errorMessage);

@override
String toString() {
  return 'AccountState(fullName: $fullName, email: $email, language: $language, emailNotifications: $emailNotifications, smsNotifications: $smsNotifications, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$AccountStateCopyWith<$Res> implements $AccountStateCopyWith<$Res> {
  factory _$AccountStateCopyWith(_AccountState value, $Res Function(_AccountState) _then) = __$AccountStateCopyWithImpl;
@override @useResult
$Res call({
 String fullName, String email, String language, bool emailNotifications, bool smsNotifications, bool isLoading, String? errorMessage
});




}
/// @nodoc
class __$AccountStateCopyWithImpl<$Res>
    implements _$AccountStateCopyWith<$Res> {
  __$AccountStateCopyWithImpl(this._self, this._then);

  final _AccountState _self;
  final $Res Function(_AccountState) _then;

/// Create a copy of AccountState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,Object? email = null,Object? language = null,Object? emailNotifications = null,Object? smsNotifications = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_AccountState(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,emailNotifications: null == emailNotifications ? _self.emailNotifications : emailNotifications // ignore: cast_nullable_to_non_nullable
as bool,smsNotifications: null == smsNotifications ? _self.smsNotifications : smsNotifications // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
