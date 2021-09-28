import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rogo/core/injection/injection_container.dart';
import 'package:rogo/core/services/navigation_service.dart';
import 'package:rogo/core/usecase/paginated_response_params.dart';
import 'package:rogo/features/authentication/domain/entities/user.dart';
import 'package:rogo/features/inbox/domain/entities/chat_room.dart';
import 'package:rogo/features/inbox/domain/usecases/create_chat_usecase.dart';
import 'package:rogo/features/inbox/domain/usecases/get_chat_rooms_usecase.dart';
import 'package:rogo/features/inbox/domain/usecases/get_users_for_chat_usecase.dart';
import 'package:rxdart/rxdart.dart';

part 'chat_rooms_event.dart';
part 'chat_rooms_state.dart';

class ChatRoomsBloc extends Bloc<ChatRoomsEvent, ChatRoomsState> {
  final GetChatRoomsUseCase _getChatRoomsUseCase;
  final GetUsersForChatUseCase _getUsersForChatUseCase;
  final CreateChatUseCase _createChatUseCase;
  ChatRoomsBloc({
    required GetChatRoomsUseCase getChatRoomsUseCase,
    required GetUsersForChatUseCase getUsersForChatUseCase,
    required CreateChatUseCase createChatUseCase,
  })  : _getChatRoomsUseCase = getChatRoomsUseCase,
        _getUsersForChatUseCase = getUsersForChatUseCase,
        _createChatUseCase = createChatUseCase,
        super(ChatRoomsState()) {
    on<FetchChatRoomsEvent>(_fetchChatRooms);
    on<FetchUsersForChatEvent>(_fetchUsersForChat);
    on<CreateChatEvent>(_createChat);
  }

  void _fetchChatRooms(FetchChatRoomsEvent event, Emitter<ChatRoomsState> emit) async {
    emit(state.copyWith(isLoading: true));
    final chatRoomsResult = await _getChatRoomsUseCase.call(PaginatedResponseParams(page: 1, limit: 20));
    chatRoomsResult.fold((l) async {
      emit(state.copyWith(errorMessage: l.message));
    }, (r) async {
      emit(state.copyWith(chatRooms: r.results));
    });
  }

  void _fetchUsersForChat(FetchUsersForChatEvent event, Emitter<ChatRoomsState> emit) async {
    emit(state.copyWith(isLoading: true));
    final chatRoomsResult = await _getUsersForChatUseCase.call(PaginatedResponseParams());
    chatRoomsResult.fold((l) async {
      emit(state.copyWith(errorMessage: l.message));
    }, (r) async {
      emit(state.copyWith(users: r.results));
    });
  }

  void _createChat(CreateChatEvent event, Emitter<ChatRoomsState> emit) async {
    emit(state.copyWith(isLoading: true));

    final createChat =
        await _createChatUseCase(CreateChatParams(companionId: event.companionId, publicationId: event.publicationId));
    createChat.fold((l) async {
      emit(state.copyWith(errorMessage: l.message));
    }, (r) async {
      this.add(FetchChatRoomsEvent());
      await sl<NavigatorService>().pop();
    });
  }
}
