import 'package:rogo/features/inbox/domain/entities/chat_message.dart';

ChatMessageType messageTypeFromInt(int value) {
  switch (value) {
    case 1:
      return ChatMessageType.text;
    case 2:
      return ChatMessageType.image;
    case 3:
      return ChatMessageType.location;
    default:
      return ChatMessageType.text;
  }
}

int intFromMessageType(ChatMessageType value) {
  switch (value) {
    case ChatMessageType.text:
      return 1;
    case ChatMessageType.image:
      return 2;
    case ChatMessageType.location:
      return 3;
    default:
      return 1;
  }
}
