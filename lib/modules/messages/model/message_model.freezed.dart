// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MessageThread _$MessageThreadFromJson(Map<String, dynamic> json) {
  return _MessageThread.fromJson(json);
}

/// @nodoc
mixin _$MessageThread {
  String get id => throw _privateConstructorUsedError;
  String get participantName => throw _privateConstructorUsedError;
  String get lastMessage => throw _privateConstructorUsedError;
  DateTime get lastTimestamp => throw _privateConstructorUsedError;
  int get unreadCount => throw _privateConstructorUsedError;
  List<Message> get messages => throw _privateConstructorUsedError;

  /// Serializes this MessageThread to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageThread
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageThreadCopyWith<MessageThread> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageThreadCopyWith<$Res> {
  factory $MessageThreadCopyWith(
    MessageThread value,
    $Res Function(MessageThread) then,
  ) = _$MessageThreadCopyWithImpl<$Res, MessageThread>;
  @useResult
  $Res call({
    String id,
    String participantName,
    String lastMessage,
    DateTime lastTimestamp,
    int unreadCount,
    List<Message> messages,
  });
}

/// @nodoc
class _$MessageThreadCopyWithImpl<$Res, $Val extends MessageThread>
    implements $MessageThreadCopyWith<$Res> {
  _$MessageThreadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageThread
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? participantName = null,
    Object? lastMessage = null,
    Object? lastTimestamp = null,
    Object? unreadCount = null,
    Object? messages = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            participantName: null == participantName
                ? _value.participantName
                : participantName // ignore: cast_nullable_to_non_nullable
                      as String,
            lastMessage: null == lastMessage
                ? _value.lastMessage
                : lastMessage // ignore: cast_nullable_to_non_nullable
                      as String,
            lastTimestamp: null == lastTimestamp
                ? _value.lastTimestamp
                : lastTimestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            unreadCount: null == unreadCount
                ? _value.unreadCount
                : unreadCount // ignore: cast_nullable_to_non_nullable
                      as int,
            messages: null == messages
                ? _value.messages
                : messages // ignore: cast_nullable_to_non_nullable
                      as List<Message>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MessageThreadImplCopyWith<$Res>
    implements $MessageThreadCopyWith<$Res> {
  factory _$$MessageThreadImplCopyWith(
    _$MessageThreadImpl value,
    $Res Function(_$MessageThreadImpl) then,
  ) = __$$MessageThreadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String participantName,
    String lastMessage,
    DateTime lastTimestamp,
    int unreadCount,
    List<Message> messages,
  });
}

/// @nodoc
class __$$MessageThreadImplCopyWithImpl<$Res>
    extends _$MessageThreadCopyWithImpl<$Res, _$MessageThreadImpl>
    implements _$$MessageThreadImplCopyWith<$Res> {
  __$$MessageThreadImplCopyWithImpl(
    _$MessageThreadImpl _value,
    $Res Function(_$MessageThreadImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MessageThread
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? participantName = null,
    Object? lastMessage = null,
    Object? lastTimestamp = null,
    Object? unreadCount = null,
    Object? messages = null,
  }) {
    return _then(
      _$MessageThreadImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        participantName: null == participantName
            ? _value.participantName
            : participantName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastMessage: null == lastMessage
            ? _value.lastMessage
            : lastMessage // ignore: cast_nullable_to_non_nullable
                  as String,
        lastTimestamp: null == lastTimestamp
            ? _value.lastTimestamp
            : lastTimestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        unreadCount: null == unreadCount
            ? _value.unreadCount
            : unreadCount // ignore: cast_nullable_to_non_nullable
                  as int,
        messages: null == messages
            ? _value._messages
            : messages // ignore: cast_nullable_to_non_nullable
                  as List<Message>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageThreadImpl implements _MessageThread {
  const _$MessageThreadImpl({
    required this.id,
    required this.participantName,
    required this.lastMessage,
    required this.lastTimestamp,
    this.unreadCount = 0,
    final List<Message> messages = const [],
  }) : _messages = messages;

  factory _$MessageThreadImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageThreadImplFromJson(json);

  @override
  final String id;
  @override
  final String participantName;
  @override
  final String lastMessage;
  @override
  final DateTime lastTimestamp;
  @override
  @JsonKey()
  final int unreadCount;
  final List<Message> _messages;
  @override
  @JsonKey()
  List<Message> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'MessageThread(id: $id, participantName: $participantName, lastMessage: $lastMessage, lastTimestamp: $lastTimestamp, unreadCount: $unreadCount, messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageThreadImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.participantName, participantName) ||
                other.participantName == participantName) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.lastTimestamp, lastTimestamp) ||
                other.lastTimestamp == lastTimestamp) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    participantName,
    lastMessage,
    lastTimestamp,
    unreadCount,
    const DeepCollectionEquality().hash(_messages),
  );

  /// Create a copy of MessageThread
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageThreadImplCopyWith<_$MessageThreadImpl> get copyWith =>
      __$$MessageThreadImplCopyWithImpl<_$MessageThreadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageThreadImplToJson(this);
  }
}

abstract class _MessageThread implements MessageThread {
  const factory _MessageThread({
    required final String id,
    required final String participantName,
    required final String lastMessage,
    required final DateTime lastTimestamp,
    final int unreadCount,
    final List<Message> messages,
  }) = _$MessageThreadImpl;

  factory _MessageThread.fromJson(Map<String, dynamic> json) =
      _$MessageThreadImpl.fromJson;

  @override
  String get id;
  @override
  String get participantName;
  @override
  String get lastMessage;
  @override
  DateTime get lastTimestamp;
  @override
  int get unreadCount;
  @override
  List<Message> get messages;

  /// Create a copy of MessageThread
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageThreadImplCopyWith<_$MessageThreadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  MessageSenderType get senderType => throw _privateConstructorUsedError;
  MessageType get type => throw _privateConstructorUsedError;
  String? get actionLabel => throw _privateConstructorUsedError;

  /// Serializes this Message to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call({
    String id,
    String content,
    DateTime timestamp,
    MessageSenderType senderType,
    MessageType type,
    String? actionLabel,
  });
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? timestamp = null,
    Object? senderType = null,
    Object? type = null,
    Object? actionLabel = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            senderType: null == senderType
                ? _value.senderType
                : senderType // ignore: cast_nullable_to_non_nullable
                      as MessageSenderType,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as MessageType,
            actionLabel: freezed == actionLabel
                ? _value.actionLabel
                : actionLabel // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MessageImplCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$MessageImplCopyWith(
    _$MessageImpl value,
    $Res Function(_$MessageImpl) then,
  ) = __$$MessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String content,
    DateTime timestamp,
    MessageSenderType senderType,
    MessageType type,
    String? actionLabel,
  });
}

/// @nodoc
class __$$MessageImplCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$MessageImpl>
    implements _$$MessageImplCopyWith<$Res> {
  __$$MessageImplCopyWithImpl(
    _$MessageImpl _value,
    $Res Function(_$MessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? timestamp = null,
    Object? senderType = null,
    Object? type = null,
    Object? actionLabel = freezed,
  }) {
    return _then(
      _$MessageImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        senderType: null == senderType
            ? _value.senderType
            : senderType // ignore: cast_nullable_to_non_nullable
                  as MessageSenderType,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as MessageType,
        actionLabel: freezed == actionLabel
            ? _value.actionLabel
            : actionLabel // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageImpl implements _Message {
  const _$MessageImpl({
    required this.id,
    required this.content,
    required this.timestamp,
    required this.senderType,
    this.type = MessageType.text,
    this.actionLabel,
  });

  factory _$MessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageImplFromJson(json);

  @override
  final String id;
  @override
  final String content;
  @override
  final DateTime timestamp;
  @override
  final MessageSenderType senderType;
  @override
  @JsonKey()
  final MessageType type;
  @override
  final String? actionLabel;

  @override
  String toString() {
    return 'Message(id: $id, content: $content, timestamp: $timestamp, senderType: $senderType, type: $type, actionLabel: $actionLabel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.senderType, senderType) ||
                other.senderType == senderType) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.actionLabel, actionLabel) ||
                other.actionLabel == actionLabel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    content,
    timestamp,
    senderType,
    type,
    actionLabel,
  );

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      __$$MessageImplCopyWithImpl<_$MessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageImplToJson(this);
  }
}

abstract class _Message implements Message {
  const factory _Message({
    required final String id,
    required final String content,
    required final DateTime timestamp,
    required final MessageSenderType senderType,
    final MessageType type,
    final String? actionLabel,
  }) = _$MessageImpl;

  factory _Message.fromJson(Map<String, dynamic> json) = _$MessageImpl.fromJson;

  @override
  String get id;
  @override
  String get content;
  @override
  DateTime get timestamp;
  @override
  MessageSenderType get senderType;
  @override
  MessageType get type;
  @override
  String? get actionLabel;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
