part of 'chat_rooms_bloc.dart';

abstract class ChatRoomsEvent extends Equatable {
  const ChatRoomsEvent();

  @override
  List<Object> get props => [];
}

class FetchChatRoomsEvent extends ChatRoomsEvent {}

class FetchUsersForChatEvent extends ChatRoomsEvent {}

class CreateChatEvent extends ChatRoomsEvent {
  final int companionId;
  final int publicationId;
  CreateChatEvent({
    required this.companionId,
    required this.publicationId,
  });

  @override
  List<Object> get props => [companionId, publicationId];
}

class LoadMoreChatRoomsEvent extends ChatRoomsEvent {}

class UpdateChatRoomsLastMessage extends ChatRoomsEvent {}
