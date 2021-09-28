import 'package:rogo/core/error/exceptions.dart';
import 'package:rogo/features/inbox/data/datasources/inbox_datasource.dart';
import 'package:rogo/features/inbox/domain/entities/chat_message.dart';
import 'package:rogo/features/inbox/domain/entities/paginated_chat_rooms.dart';
import 'package:rogo/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:rogo/features/inbox/domain/entities/paginated_messages.dart';
import 'package:rogo/features/inbox/domain/entities/paginated_users.dart';
import 'package:rogo/features/inbox/domain/repositories/inbox_repository.dart';

class InboxRepositoryImpl implements InboxRepository {
  final InboxDatasource _datasource;

  InboxRepositoryImpl({required InboxDatasource datasource}) : _datasource = datasource;

  @override
  Future<Either<Failure, PaginatedUsers>> getPaginatedUsers({int? page, int? limit}) async {
    try {
      final result = await _datasource.getPaginatedUsers(
        page: page,
        limit: limit,
      );
      return Right(result);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, PaginatedChatRooms>> getPaginatedChatRooms({int? page, int? limit}) async {
    try {
      final result = await _datasource.getPaginatedChatRooms(
        page: page,
        limit: limit,
      );
      return Right(result);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, PaginatedMessages>> fetchMessagesOfChat({required int chatId, int? page, int? limit}) async {
    try {
      final result = await _datasource.fetchMessagesOfChat(
        chatId: chatId,
        page: page,
        limit: limit,
      );
      return Right(result);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, ChatMessage>> sendMessage({required String text, required int chatId}) async {
    try {
      final result = await _datasource.sendMessage(text: text, chatId: chatId);
      return Right(result);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, bool>> createChat({required int companionId, required int publicationId}) async {
    try {
      await _datasource.createChat(
        companionId: companionId,
        publicationId: publicationId,
      );
      return Right(true);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, PaginatedMessages>> fetchRestMessagesOfChat(
      {required int messageId, int? page, int? limit, bool? after}) async {
    try {
      final result = await _datasource.fetchRestMessagesOfChat(
        messageId: messageId,
        page: page,
        limit: limit,
        after: after,
      );
      return Right(result);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.message));
    }
  }
}
