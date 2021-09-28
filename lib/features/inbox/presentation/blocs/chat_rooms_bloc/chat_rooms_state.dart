part of 'chat_rooms_bloc.dart';

class ChatRoomsState extends Equatable {
  final List<ChatRoom> chatRooms;
  final List<User> users;
  final bool isLoading;
  final String errorMessage;

  const ChatRoomsState({
    this.chatRooms = const <ChatRoom>[],
    this.users = const <User>[],
    this.isLoading = false,
    this.errorMessage = '',
  });

  @override
  List<Object> get props => [
        chatRooms,
        users,
        isLoading,
        errorMessage,
      ];

  ChatRoomsState copyWith({
    List<ChatRoom>? chatRooms,
    List<User>? users,
    bool? isLoading,
    String? errorMessage,
  }) {
    return ChatRoomsState(
      chatRooms: chatRooms ?? this.chatRooms,
      users: users ?? this.users,
      isLoading: isLoading ?? false,
      errorMessage: errorMessage ?? '',
    );
  }
}
