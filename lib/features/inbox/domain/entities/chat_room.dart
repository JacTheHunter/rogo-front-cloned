import 'package:equatable/equatable.dart';

import 'package:rogo/features/inbox/domain/entities/chat_message.dart';
import 'package:rogo/features/inbox/domain/entities/chat_room_user.dart';

class ChatRoom extends Equatable {
  final int id;
  final int publicationId;
  final ChatRoomUser partner;
  final ChatMessage? lastMessage;
  final int unreadMessagesCount;

  ChatRoom({
    required this.id,
    required this.publicationId,
    required this.partner,
    required this.lastMessage,
    required this.unreadMessagesCount,
  });

  @override
  List<Object?> get props {
    return [
      id,
      publicationId,
      partner,
      lastMessage,
      unreadMessagesCount,
    ];
  }
}
