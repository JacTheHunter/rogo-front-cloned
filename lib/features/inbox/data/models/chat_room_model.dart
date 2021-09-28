import 'dart:convert';

import 'package:rogo/features/inbox/data/models/chat_room_user_model.dart';
import 'package:rogo/features/inbox/data/models/chat_message_model.dart';
import 'package:rogo/features/inbox/domain/entities/chat_room.dart';
import 'package:rogo/features/inbox/domain/entities/chat_room_user.dart';
import 'package:rogo/features/inbox/domain/entities/chat_message.dart';

class ChatRoomModel extends ChatRoom {
  final int id;
  final int publicationId;
  final ChatRoomUser partner;
  final ChatMessage? lastMessage;
  final int unreadMessagesCount;
  ChatRoomModel({
    required this.id,
    required this.publicationId,
    required this.partner,
    required this.lastMessage,
    required this.unreadMessagesCount,
  }) : super(
            id: id,
            publicationId: publicationId,
            partner: partner,
            lastMessage: lastMessage,
            unreadMessagesCount: unreadMessagesCount);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'publication_id': publicationId,
      'partner': (partner as ChatRoomUserModel).toMap(),
      'last_message': (lastMessage as ChatMessageModel?)?.toMap(),
      'count_unread_messages': unreadMessagesCount,
    };
  }

  factory ChatRoomModel.fromMap(Map<String, dynamic> map) {
    return ChatRoomModel(
      id: map['id'],
      publicationId: map['publication_id'],
      partner: ChatRoomUserModel.fromMap(map['partner']),
      lastMessage:
          ((map['last_message'] != null) && (map['last_message'] is Map) && (map['last_message']['id'] != null))
              ? ChatMessageModel.fromMap(map['last_message'])
              : null,
      unreadMessagesCount: map['count_unread_messages'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatRoomModel.fromJson(String source) => ChatRoomModel.fromMap(json.decode(source));
}
