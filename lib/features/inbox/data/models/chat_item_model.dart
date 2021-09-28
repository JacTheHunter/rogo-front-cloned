import 'dart:convert';

import 'package:rogo/features/inbox/data/models/chat_message_model.dart';
import 'package:rogo/features/inbox/domain/entities/chat_item.dart';
import 'package:rogo/features/inbox/domain/entities/chat_message.dart';

class ChatItemModel extends ChatItem {
  final int chatRoomId;
  final List<ChatMessage> messages;
  final bool isDown;

  ChatItemModel({
    required this.chatRoomId,
    required this.messages,
    this.isDown = true,
  }) : super(
          chatRoomId: chatRoomId,
          messages: messages,
          isDown: isDown,
        );

  Map<String, dynamic> toMap() {
    return {
      'chatRoomId': chatRoomId,
      'isDown': isDown,
      'messages': messages.map((x) => (x as ChatMessageModel).toMap()).toList(),
    };
  }

  factory ChatItemModel.fromMap(Map<String, dynamic> map) {
    return ChatItemModel(
      chatRoomId: map['room'],
      isDown: map['isDown'],
      messages: List<ChatMessage>.from(map['messages']?.map((x) => ChatMessageModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatItemModel.fromJson(String source) => ChatItemModel.fromMap(json.decode(source));

  // ChatItemModel copyWith({
  //   ChatRoom? room,
  //   List<ChatMessage>? messages,
  //   double? scrollPosition,
  // }) {
  //   return ChatItemModel(
  //     room: room ?? this.room,
  //     messages: messages ?? this.messages,
  //     scrollPosition: scrollPosition ?? this.scrollPosition,
  //   );
  // }
}
