import 'package:dartz/dartz.dart';
import 'package:rogo/core/error/failures.dart';
import 'package:rogo/features/inbox/domain/entities/chat_message.dart';
import 'package:rogo/features/inbox/domain/entities/paginated_chat_rooms.dart';
import 'package:rogo/features/inbox/domain/entities/paginated_messages.dart';
import 'package:rogo/features/inbox/domain/entities/paginated_users.dart';

abstract class InboxRepository {
  Future<Either<Failure, PaginatedUsers>> getPaginatedUsers({
    int? page,
    int? limit,
  });
  Future<Either<Failure, PaginatedChatRooms>> getPaginatedChatRooms({
    int? page,
    int? limit,
  });

  Future<Either<Failure, PaginatedMessages>> fetchMessagesOfChat({
    required int chatId,
    int? page,
    int? limit,
  });
  Future<Either<Failure, PaginatedMessages>> fetchRestMessagesOfChat({
    required int messageId,
    int? page,
    int? limit,
    bool? after,
  });

  Future<Either<Failure, ChatMessage>> sendMessage({
    required String text,
    required int chatId,
  });

  Future<Either<Failure, bool>> createChat({
    required int companionId,
    required int publicationId,
  });
}
