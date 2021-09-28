import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:rogo/features/inbox/data/models/chat_item_model.dart';
import 'package:rogo/features/inbox/domain/entities/chat_item.dart';
import 'package:rogo/features/inbox/domain/entities/chat_message.dart';
import 'package:rogo/features/inbox/domain/usecases/get_messages_of_chat_usecase.dart';
import 'package:rogo/features/inbox/domain/usecases/get_rest_of_messages_of_chat_usecase.dart';
import 'package:collection/collection.dart';

part 'chat_messages_state.dart';
part 'chat_messages_event.dart';

class ChatMessagesBloc extends HydratedBloc<ChatMessagesEvent, ChatMessagesState> {
  GetMessagesOfChatUseCase _getMessagesOfChatUseCase;
  GetRestOfMessagesOfChatUseCase _getRestOfMessagesOfChatUseCase;

  ChatMessagesBloc(
      {required GetMessagesOfChatUseCase getMessagesOfChatUseCase,
      required GetRestOfMessagesOfChatUseCase getRestOfMessagesOfChatUseCase})
      : _getMessagesOfChatUseCase = getMessagesOfChatUseCase,
        _getRestOfMessagesOfChatUseCase = getRestOfMessagesOfChatUseCase,
        super(ChatMessagesState()) {
    on<SelectChatRoomEvent>(_onSelectChatRoomEvent, transformer: droppable());
    on<NewMessageEvent>(_onNewMessageEvent, transformer: droppable());
    on<ScrolllUpEvent>(_onScrolllUpEvent, transformer: droppable());
    on<ScrolllDownEvent>(_onScrolllDownEvent, transformer: droppable());
    on<UpdateMessagesWithSentMessageEvent>(_onUpdateMessagesWithSentMessageEvent);
  }

  void _onSelectChatRoomEvent(SelectChatRoomEvent event, Emitter<ChatMessagesState> emit) async {
    emit(state.copyWith(selectedChatRoomId: event.chatRoomId, loadingBottom: true));

    //check if we already have in cache state messages of this chat
    //in case we have, we just get id of the last message and, request
    //for new messages after this message
    if (state.chatItems.where((chi) => chi.chatRoomId == event.chatRoomId).isNotEmpty) {
      var chatItem = ChatItemModel(chatRoomId: event.chatRoomId, messages: state.chatItem!.messages);
      final result = await _getRestOfMessagesOfChatUseCase(
          ChatRestOfMessagesParams(messageId: chatItem.messages.last.id, after: true, limit: 20));
      result.fold(
        (l) {
          print(l.message);
          emit(state.copyWith(loadingBottom: false));
        },
        (r) {
          if (r.results.isNotEmpty) {
            List<ChatMessage> newMessages = List.from(chatItem.messages);
            newMessages.addAll(r.results);

            var newChatItem = ChatItemModel(chatRoomId: chatItem.chatRoomId, messages: newMessages);
            List<ChatItem> chatItems = List.from(state.chatItems);
            //replacing chatItem with new value
            chatItems[chatItems.indexWhere((element) => element.chatRoomId == event.chatRoomId)] = newChatItem;
            emit(state.copyWith(chatItems: chatItems, loadingBottom: false));
          }
          emit(state.copyWith(loadingBottom: false));
        },
      );

      //we don't have chatItem for this chatRoomId this means that we are opening the chat for the first time
      //or cache somehow has been deleted, in this case we should get the data from the server, from the begining

    } else {
      final messages =
          await _getMessagesOfChatUseCase.call(ChatMessagesParams(chatId: event.chatRoomId, page: 1, limit: 20));
      messages.fold((l) {
        print(l.message);
        emit(state.copyWith(loadingBottom: false));
      }, (r) {
        final chatItem = ChatItem(messages: r.results, chatRoomId: state.selectedChatRoomId!);
        List<ChatItem> chatItems = List.from(state.chatItems);
        chatItems.add(chatItem);
        emit(state.copyWith(chatItems: chatItems));
      });
    }
  }

  void _onNewMessageEvent(NewMessageEvent event, Emitter<ChatMessagesState> emit) {
    //first we need to check if the chat where new message came is active and selected
    //if so, we update chat with new message else we ignore

    if (event.chatRoomId == state.selectedChatRoomId) {
      add(SelectChatRoomEvent(chatRoomId: event.chatRoomId));
    }
  }

  void _onScrolllDownEvent(ScrolllDownEvent event, Emitter<ChatMessagesState> emit) {
    print(event);
    if (state.selectedChatRoomId != null) {
      add(SelectChatRoomEvent(chatRoomId: state.selectedChatRoomId!));
    }
  }

  void _onScrolllUpEvent(ScrolllUpEvent event, Emitter<ChatMessagesState> emit) async {
    emit(state.copyWith(loadingTop: true));

    var chatItem =
        ChatItemModel(chatRoomId: state.selectedChatRoomId!, messages: state.chatItem!.messages, isDown: false);
    final result = await _getRestOfMessagesOfChatUseCase(
        ChatRestOfMessagesParams(messageId: chatItem.messages.first.id, after: false, page: 1, limit: 20));
    result.fold(
      (l) {
        print(l.message);
        emit(state.copyWith(loadingTop: false));
      },
      (r) {
        if (r.results.isNotEmpty) {
          List<ChatMessage> newMessages = List.from(chatItem.messages);
          newMessages.insertAll(0, r.results);

          var newChatItem = ChatItemModel(chatRoomId: chatItem.chatRoomId, messages: newMessages, isDown: false);
          List<ChatItem> chatItems = List.from(state.chatItems);
          //replacing chatItem with new value
          chatItems[chatItems.indexWhere((element) => element.chatRoomId == state.selectedChatRoomId!)] = newChatItem;
          emit(state.copyWith(chatItems: chatItems, loadingTop: false));
        }
        emit(state.copyWith(loadingTop: false));
      },
    );
  }

  void _onUpdateMessagesWithSentMessageEvent(
      UpdateMessagesWithSentMessageEvent event, Emitter<ChatMessagesState> emit) async {
    var chatItem = ChatItemModel(chatRoomId: state.selectedChatRoomId!, messages: state.chatItem!.messages);

    List<ChatMessage> newMessages = List.from(chatItem.messages);
    newMessages.add(event.message);
    var newChatItem = ChatItemModel(chatRoomId: chatItem.chatRoomId, messages: newMessages);
    List<ChatItem> chatItems = List.from(state.chatItems);
    //replacing chatItem with new value
    chatItems[chatItems.indexWhere((element) => element.chatRoomId == state.selectedChatRoomId!)] = newChatItem;
    emit(state.copyWith(chatItems: chatItems));
  }

  @override
  ChatMessagesState? fromJson(Map<String, dynamic> json) {
    if (json['items'] != null && json['items'] is Map && (json['items'] as Map).isNotEmpty) {
      final List<ChatItem> chatItems = (json['items'] as List).map((chim) => ChatItemModel.fromMap(chim)).toList();
      return ChatMessagesState(chatItems: chatItems);
    } else {
      return ChatMessagesState();
    }
  }

  @override
  Map<String, dynamic>? toJson(ChatMessagesState state) {
    if (state.chatItems.isNotEmpty) {
      return {
        'items': state.chatItems.map((e) {
          if (e.messages.length > 20) {
            if (e.isDown)
              e.messages.removeRange(0, e.messages.length - 20);
            else
              e.messages.removeRange(20, e.messages.length);
          }
          return ChatItemModel(messages: e.messages, chatRoomId: e.chatRoomId).toMap();
        }).toList(),
      };
    }
  }
}
