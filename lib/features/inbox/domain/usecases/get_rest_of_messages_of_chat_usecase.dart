import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rogo/features/inbox/domain/entities/paginated_messages.dart';
import 'package:rogo/features/inbox/domain/repositories/inbox_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

class GetRestOfMessagesOfChatUseCase extends UseCase<PaginatedMessages, ChatRestOfMessagesParams> {
  final InboxRepository _repository;

  GetRestOfMessagesOfChatUseCase({required InboxRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, PaginatedMessages>> call(ChatRestOfMessagesParams params) async {
    return await _repository.fetchRestMessagesOfChat(
      messageId: params.messageId,
      limit: params.limit,
      page: params.page,
      after: params.after,
    );
  }
}

class ChatRestOfMessagesParams extends Equatable {
  final int messageId;
  final int? page;
  final int? limit;
  final bool? after;
  ChatRestOfMessagesParams({
    required this.messageId,
    this.page,
    this.limit,
    this.after,
  });

  @override
  List<Object?> get props => [messageId, page, limit, after];
}
