part of 'send_message_cubit.dart';

enum SendMessageStatus { loading, success, initial }

class SendMessageState extends Equatable {
  final int selectedChatRoomId;
  final String messageText;
  final SendMessageStatus status;
  const SendMessageState({this.selectedChatRoomId = 0, this.messageText = '', this.status = SendMessageStatus.initial});

  @override
  List<Object> get props => [
        messageText,
        selectedChatRoomId,
        status,
      ];

  SendMessageState copyWith({
    String? messageText,
    SendMessageStatus? status,
    int? selectedChatRoomId,
  }) {
    return SendMessageState(
      messageText: messageText ?? this.messageText,
      status: status ?? SendMessageStatus.initial,
      selectedChatRoomId: selectedChatRoomId ?? this.selectedChatRoomId,
    );
  }
}
