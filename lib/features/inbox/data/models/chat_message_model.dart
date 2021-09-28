import 'dart:convert';

import 'package:rogo/core/helpers/message_type_from_int.dart';
import 'package:rogo/features/inbox/data/models/chat_room_user_model.dart';
import 'package:rogo/features/inbox/domain/entities/chat_room_user.dart';
import 'package:rogo/features/inbox/domain/entities/chat_message.dart';

class ChatMessageModel extends ChatMessage {
  final int id;
  final int? chatId;
  final DateTime createdAt;
  final List<String>? images;
  final ChatMessageType type;
  final String text;
  final double? latitude;
  final double? longitude;
  final bool isRead;
  final ChatRoomUser? author;
  ChatMessageModel({
    required this.id,
    this.chatId,
    required this.createdAt,
    required this.images,
    required this.type,
    required this.text,
    required this.latitude,
    required this.longitude,
    required this.isRead,
    this.author,
  }) : super(
            id: id,
            chatId: chatId,
            createdAt: createdAt,
            images: images,
            type: type,
            text: text,
            latitude: latitude,
            longitude: longitude,
            isRead: isRead,
            author: author);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'chat': chatId,
      'created_at': createdAt.millisecondsSinceEpoch,
      'images': images,
      'message_type': intFromMessageType(type),
      'text': text,
      'lat': latitude,
      'long': longitude,
      'read': isRead,
      if (author != null) 'author': (author as ChatRoomUserModel).toMap()
    };
  }

  factory ChatMessageModel.fromMap(Map<String, dynamic> map) {
    return ChatMessageModel(
      id: map['id'],
      chatId: map['chat'],
      createdAt: DateTime.tryParse(map['created_at'].toString()) ?? DateTime.now(),
      images: (map['images'] != null && map['images'] is List && (map['images'] as List).isNotEmpty)
          ? List<String>.from(map['images'])
          : null,
      type: messageTypeFromInt(map['message_type']),
      text: map['text'],
      latitude: (map['lat'] != null && map['lat'] is String && (map['lat'] as String).isNotEmpty) ? map['lat'] : null,
      longitude:
          (map['long'] != null && map['long'] is String && (map['long'] as String).isNotEmpty) ? map['long'] : null,
      isRead: map['read'],
      author: (map['author'] != null && map['author']['id'] != null) ? ChatRoomUserModel.fromMap(map['author']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessageModel.fromJson(String source) => ChatMessageModel.fromMap(json.decode(source));
}
