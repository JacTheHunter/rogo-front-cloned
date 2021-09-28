import 'package:equatable/equatable.dart';

import 'package:rogo/features/inbox/domain/entities/chat_room_user.dart';

enum ChatMessageType { text, image, location }

class ChatMessage extends Equatable {
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
  ChatMessage({
    required this.id,
    required this.chatId,
    required this.createdAt,
    required this.images,
    required this.type,
    required this.text,
    required this.latitude,
    required this.longitude,
    required this.isRead,
    this.author,
  });

  @override
  List<Object?> get props {
    return [
      id,
      chatId,
      createdAt,
      images,
      type,
      text,
      latitude,
      longitude,
      isRead,
      author,
    ];
  }
}
