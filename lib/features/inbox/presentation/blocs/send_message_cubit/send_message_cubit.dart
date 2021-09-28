import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rogo/features/inbox/domain/usecases/send_message_usecase.dart';
import 'package:rogo/features/inbox/presentation/blocs/chat_messages_bloc/chat_messages_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'send_message_state.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  ChatMessagesBloc _chatMessagesBloc;

  SendMessageUseCase _sendMessageUseCase;
  SendMessageCubit({
    required SendMessageUseCase sendMessageUseCase,
    required ChatMessagesBloc chatMessagesBloc,
  })  : _sendMessageUseCase = sendMessageUseCase,
        _chatMessagesBloc = chatMessagesBloc,
        super(SendMessageState());

  void updateSelectedChatRoomId(int id) {
    emit(state.copyWith(selectedChatRoomId: id));
  }

  void updateMessageText(String text) {
    emit(state.copyWith(messageText: text));
  }

  void send() async {
    if (state.messageText.isNotEmpty && state.status != SendMessageStatus.loading) {
      emit(state.copyWith(status: SendMessageStatus.loading));
      final sentMessageResult =
          await _sendMessageUseCase.call(SendMessageParams(text: state.messageText, chatId: state.selectedChatRoomId));

      sentMessageResult.fold((l) {
        print(l.message);
      }, (r) {
        emit(state.copyWith(messageText: '', status: SendMessageStatus.success));
        _chatMessagesBloc..add(UpdateMessagesWithSentMessageEvent(message: r));
      });
    }
  }
}
