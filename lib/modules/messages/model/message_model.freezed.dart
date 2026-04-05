// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Message {

 String get id; String get content; DateTime get timestamp; MessageSenderType get senderType; MessageType get type; String? get actionLabel; String? get actionType;
/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageCopyWith<Message> get copyWith => _$MessageCopyWithImpl<Message>(this as Message, _$identity);

  /// Serializes this Message to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Message&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.senderType, senderType) || other.senderType == senderType)&&(identical(other.type, type) || other.type == type)&&(identical(other.actionLabel, actionLabel) || other.actionLabel == actionLabel)&&(identical(other.actionType, actionType) || other.actionType == actionType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,content,timestamp,senderType,type,actionLabel,actionType);

@override
String toString() {
  return 'Message(id: $id, content: $content, timestamp: $timestamp, senderType: $senderType, type: $type, actionLabel: $actionLabel, actionType: $actionType)';
}


}

/// @nodoc
abstract mixin class $MessageCopyWith<$Res>  {
  factory $MessageCopyWith(Message value, $Res Function(Message) _then) = _$MessageCopyWithImpl;
@useResult
$Res call({
 String id, String content, DateTime timestamp, MessageSenderType senderType, MessageType type, String? actionLabel, String? actionType
});




}
/// @nodoc
class _$MessageCopyWithImpl<$Res>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._self, this._then);

  final Message _self;
  final $Res Function(Message) _then;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? content = null,Object? timestamp = null,Object? senderType = null,Object? type = null,Object? actionLabel = freezed,Object? actionType = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,senderType: null == senderType ? _self.senderType : senderType // ignore: cast_nullable_to_non_nullable
as MessageSenderType,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MessageType,actionLabel: freezed == actionLabel ? _self.actionLabel : actionLabel // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Message].
extension MessagePatterns on Message {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Message value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Message() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Message value)  $default,){
final _that = this;
switch (_that) {
case _Message():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Message value)?  $default,){
final _that = this;
switch (_that) {
case _Message() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String content,  DateTime timestamp,  MessageSenderType senderType,  MessageType type,  String? actionLabel,  String? actionType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Message() when $default != null:
return $default(_that.id,_that.content,_that.timestamp,_that.senderType,_that.type,_that.actionLabel,_that.actionType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String content,  DateTime timestamp,  MessageSenderType senderType,  MessageType type,  String? actionLabel,  String? actionType)  $default,) {final _that = this;
switch (_that) {
case _Message():
return $default(_that.id,_that.content,_that.timestamp,_that.senderType,_that.type,_that.actionLabel,_that.actionType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String content,  DateTime timestamp,  MessageSenderType senderType,  MessageType type,  String? actionLabel,  String? actionType)?  $default,) {final _that = this;
switch (_that) {
case _Message() when $default != null:
return $default(_that.id,_that.content,_that.timestamp,_that.senderType,_that.type,_that.actionLabel,_that.actionType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Message implements Message {
  const _Message({required this.id, required this.content, required this.timestamp, required this.senderType, required this.type, this.actionLabel, this.actionType});
  factory _Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

@override final  String id;
@override final  String content;
@override final  DateTime timestamp;
@override final  MessageSenderType senderType;
@override final  MessageType type;
@override final  String? actionLabel;
@override final  String? actionType;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageCopyWith<_Message> get copyWith => __$MessageCopyWithImpl<_Message>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Message&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.senderType, senderType) || other.senderType == senderType)&&(identical(other.type, type) || other.type == type)&&(identical(other.actionLabel, actionLabel) || other.actionLabel == actionLabel)&&(identical(other.actionType, actionType) || other.actionType == actionType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,content,timestamp,senderType,type,actionLabel,actionType);

@override
String toString() {
  return 'Message(id: $id, content: $content, timestamp: $timestamp, senderType: $senderType, type: $type, actionLabel: $actionLabel, actionType: $actionType)';
}


}

/// @nodoc
abstract mixin class _$MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$MessageCopyWith(_Message value, $Res Function(_Message) _then) = __$MessageCopyWithImpl;
@override @useResult
$Res call({
 String id, String content, DateTime timestamp, MessageSenderType senderType, MessageType type, String? actionLabel, String? actionType
});




}
/// @nodoc
class __$MessageCopyWithImpl<$Res>
    implements _$MessageCopyWith<$Res> {
  __$MessageCopyWithImpl(this._self, this._then);

  final _Message _self;
  final $Res Function(_Message) _then;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? content = null,Object? timestamp = null,Object? senderType = null,Object? type = null,Object? actionLabel = freezed,Object? actionType = freezed,}) {
  return _then(_Message(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,senderType: null == senderType ? _self.senderType : senderType // ignore: cast_nullable_to_non_nullable
as MessageSenderType,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MessageType,actionLabel: freezed == actionLabel ? _self.actionLabel : actionLabel // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$MessageThread {

 String get id; String get participantName; String get lastMessage; DateTime get lastTimestamp; int get unreadCount; List<Message> get messages;
/// Create a copy of MessageThread
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageThreadCopyWith<MessageThread> get copyWith => _$MessageThreadCopyWithImpl<MessageThread>(this as MessageThread, _$identity);

  /// Serializes this MessageThread to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageThread&&(identical(other.id, id) || other.id == id)&&(identical(other.participantName, participantName) || other.participantName == participantName)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.lastTimestamp, lastTimestamp) || other.lastTimestamp == lastTimestamp)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&const DeepCollectionEquality().equals(other.messages, messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,participantName,lastMessage,lastTimestamp,unreadCount,const DeepCollectionEquality().hash(messages));

@override
String toString() {
  return 'MessageThread(id: $id, participantName: $participantName, lastMessage: $lastMessage, lastTimestamp: $lastTimestamp, unreadCount: $unreadCount, messages: $messages)';
}


}

/// @nodoc
abstract mixin class $MessageThreadCopyWith<$Res>  {
  factory $MessageThreadCopyWith(MessageThread value, $Res Function(MessageThread) _then) = _$MessageThreadCopyWithImpl;
@useResult
$Res call({
 String id, String participantName, String lastMessage, DateTime lastTimestamp, int unreadCount, List<Message> messages
});




}
/// @nodoc
class _$MessageThreadCopyWithImpl<$Res>
    implements $MessageThreadCopyWith<$Res> {
  _$MessageThreadCopyWithImpl(this._self, this._then);

  final MessageThread _self;
  final $Res Function(MessageThread) _then;

/// Create a copy of MessageThread
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? participantName = null,Object? lastMessage = null,Object? lastTimestamp = null,Object? unreadCount = null,Object? messages = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,participantName: null == participantName ? _self.participantName : participantName // ignore: cast_nullable_to_non_nullable
as String,lastMessage: null == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String,lastTimestamp: null == lastTimestamp ? _self.lastTimestamp : lastTimestamp // ignore: cast_nullable_to_non_nullable
as DateTime,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageThread].
extension MessageThreadPatterns on MessageThread {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageThread value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageThread() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageThread value)  $default,){
final _that = this;
switch (_that) {
case _MessageThread():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageThread value)?  $default,){
final _that = this;
switch (_that) {
case _MessageThread() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String participantName,  String lastMessage,  DateTime lastTimestamp,  int unreadCount,  List<Message> messages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageThread() when $default != null:
return $default(_that.id,_that.participantName,_that.lastMessage,_that.lastTimestamp,_that.unreadCount,_that.messages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String participantName,  String lastMessage,  DateTime lastTimestamp,  int unreadCount,  List<Message> messages)  $default,) {final _that = this;
switch (_that) {
case _MessageThread():
return $default(_that.id,_that.participantName,_that.lastMessage,_that.lastTimestamp,_that.unreadCount,_that.messages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String participantName,  String lastMessage,  DateTime lastTimestamp,  int unreadCount,  List<Message> messages)?  $default,) {final _that = this;
switch (_that) {
case _MessageThread() when $default != null:
return $default(_that.id,_that.participantName,_that.lastMessage,_that.lastTimestamp,_that.unreadCount,_that.messages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageThread implements MessageThread {
  const _MessageThread({required this.id, required this.participantName, required this.lastMessage, required this.lastTimestamp, this.unreadCount = 0, final  List<Message> messages = const []}): _messages = messages;
  factory _MessageThread.fromJson(Map<String, dynamic> json) => _$MessageThreadFromJson(json);

@override final  String id;
@override final  String participantName;
@override final  String lastMessage;
@override final  DateTime lastTimestamp;
@override@JsonKey() final  int unreadCount;
 final  List<Message> _messages;
@override@JsonKey() List<Message> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}


/// Create a copy of MessageThread
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageThreadCopyWith<_MessageThread> get copyWith => __$MessageThreadCopyWithImpl<_MessageThread>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageThreadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageThread&&(identical(other.id, id) || other.id == id)&&(identical(other.participantName, participantName) || other.participantName == participantName)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.lastTimestamp, lastTimestamp) || other.lastTimestamp == lastTimestamp)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&const DeepCollectionEquality().equals(other._messages, _messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,participantName,lastMessage,lastTimestamp,unreadCount,const DeepCollectionEquality().hash(_messages));

@override
String toString() {
  return 'MessageThread(id: $id, participantName: $participantName, lastMessage: $lastMessage, lastTimestamp: $lastTimestamp, unreadCount: $unreadCount, messages: $messages)';
}


}

/// @nodoc
abstract mixin class _$MessageThreadCopyWith<$Res> implements $MessageThreadCopyWith<$Res> {
  factory _$MessageThreadCopyWith(_MessageThread value, $Res Function(_MessageThread) _then) = __$MessageThreadCopyWithImpl;
@override @useResult
$Res call({
 String id, String participantName, String lastMessage, DateTime lastTimestamp, int unreadCount, List<Message> messages
});




}
/// @nodoc
class __$MessageThreadCopyWithImpl<$Res>
    implements _$MessageThreadCopyWith<$Res> {
  __$MessageThreadCopyWithImpl(this._self, this._then);

  final _MessageThread _self;
  final $Res Function(_MessageThread) _then;

/// Create a copy of MessageThread
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? participantName = null,Object? lastMessage = null,Object? lastTimestamp = null,Object? unreadCount = null,Object? messages = null,}) {
  return _then(_MessageThread(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,participantName: null == participantName ? _self.participantName : participantName // ignore: cast_nullable_to_non_nullable
as String,lastMessage: null == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String,lastTimestamp: null == lastTimestamp ? _self.lastTimestamp : lastTimestamp // ignore: cast_nullable_to_non_nullable
as DateTime,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,
  ));
}


}

// dart format on
