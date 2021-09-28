part of 'chat_messages_bloc.dart';

class ChatMessagesState extends Equatable {
  final int? selectedChatRoomId;
  final List<ChatItem> chatItems;
  final bool loadingTop;
  final bool loadingBottom;
  const ChatMessagesState({
    this.selectedChatRoomId,
    this.chatItems = const <ChatItem>[],
    this.loadingTop = false,
    this.loadingBottom = false,
  });

  ChatMessagesState copyWith({
    int? selectedChatRoomId,
    List<ChatItem>? chatItems,
    bool? loadingTop,
    bool? loadingBottom,
  }) {
    return ChatMessagesState(
      selectedChatRoomId: selectedChatRoomId ?? this.selectedChatRoomId,
      chatItems: chatItems ?? this.chatItems,
      loadingTop: loadingTop ?? false,
      loadingBottom: loadingBottom ?? false,
    );
  }

  ChatItem? get chatItem =>
      selectedChatRoomId != null ? chatItems.firstWhereOrNull((chi) => chi.chatRoomId == selectedChatRoomId) : null;

  List<ChatMessage> get messages => selectedChatRoomId != null
      ? chatItems.firstWhereOrNull((chi) => chi.chatRoomId == selectedChatRoomId)?.messages ?? []
      : [];

  @override
  List<Object?> get props => [selectedChatRoomId, chatItems, loadingTop, loadingBottom];
}
