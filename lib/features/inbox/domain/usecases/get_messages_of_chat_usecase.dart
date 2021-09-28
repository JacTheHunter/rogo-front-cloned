import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rogo/features/inbox/domain/entities/paginated_messages.dart';
import 'package:rogo/features/inbox/domain/repositories/inbox_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

class GetMessagesOfChatUseCase extends UseCase<PaginatedMessages, ChatMessagesParams> {
  final InboxRepository _repository;

  GetMessagesOfChatUseCase({required InboxRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, PaginatedMessages>> call(ChatMessagesParams params) async {
    return await _repository.fetchMessagesOfChat(chatId: params.chatId, limit: params.limit, page: params.page);
  }
}

class ChatMessagesParams extends Equatable {
  final int chatId;
  final int? page;
  final int? limit;
  ChatMessagesParams({
    required this.chatId,
    this.page,
    this.limit,
  });

  @override
  List<Object?> get props => [chatId, page, limit];
}
