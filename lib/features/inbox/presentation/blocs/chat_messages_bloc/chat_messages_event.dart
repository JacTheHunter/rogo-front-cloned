part of 'chat_messages_bloc.dart';

abstract class ChatMessagesEvent extends Equatable {
  const ChatMessagesEvent();

  @override
  List<Object> get props => [];
}

class SelectChatRoomEvent extends ChatMessagesEvent {
  final int chatRoomId;

  SelectChatRoomEvent({required this.chatRoomId});

  @override
  List<Object> get props => [chatRoomId];
}

class NewMessageEvent extends ChatMessagesEvent {
  final int chatRoomId;

  NewMessageEvent({required this.chatRoomId});

  @override
  List<Object> get props => [chatRoomId];
}

class UpdateMessagesWithSentMessageEvent extends ChatMessagesEvent {
  final ChatMessage message;

  UpdateMessagesWithSentMessageEvent({required this.message});

  @override
  List<Object> get props => [message];
}

class ScrolllUpEvent extends ChatMessagesEvent {}

class ScrolllDownEvent extends ChatMessagesEvent {}
