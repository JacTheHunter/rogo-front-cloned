import 'package:rogo/features/inbox/domain/entities/chat_message.dart';

String stringFromLastMessage(ChatMessage? message) {
  if (message?.type == ChatMessageType.text) {
    return message?.text ?? '';
  } else {
    return message?.type.toString() ?? '';
  }
}
