import 'package:equatable/equatable.dart';

import 'package:rogo/features/inbox/domain/entities/chat_message.dart';

class ChatItem extends Equatable {
  final int chatRoomId;
  final List<ChatMessage> messages;
  final bool isDown;

  ChatItem({
    required this.chatRoomId,
    required this.messages,
    this.isDown = true,
  });

  @override
  List<Object> get props => [chatRoomId, messages, isDown];
}
