import 'package:rogo/core/configs/constants/api.dart';
import 'package:rogo/core/error/exceptions.dart';
import 'package:rogo/core/services/api_service.dart';
import 'package:rogo/features/inbox/data/models/chat_message_model.dart';
import 'package:rogo/features/inbox/data/models/paginated_chat_rooms_model.dart';
import 'package:rogo/features/inbox/data/models/paginated_messages_model.dart';
import 'package:rogo/features/inbox/data/models/paginated_users_model.dart';
import 'package:rogo/features/inbox/domain/entities/chat_message.dart';
import 'package:rogo/features/inbox/domain/entities/paginated_chat_rooms.dart';
import 'package:rogo/features/inbox/domain/entities/paginated_messages.dart';
import 'package:rogo/features/inbox/domain/entities/paginated_users.dart';

abstract class InboxDatasource {
  Future<PaginatedUsers> getPaginatedUsers({
    int? page,
    int? limit,
  });
  Future<PaginatedChatRooms> getPaginatedChatRooms({
    int? page,
    int? limit,
  });
  Future<PaginatedMessages> fetchMessagesOfChat({
    required int chatId,
    int? page,
    int? limit,
  });
  Future<PaginatedMessages> fetchRestMessagesOfChat({
    required int messageId,
    int? page,
    int? limit,
    bool? after,
  });
  Future<ChatMessage> sendMessage({required String text, required int chatId});
  Future<void> createChat({required int companionId, required int publicationId});
}

class InboxDatasourceImpl implements InboxDatasource {
  final ApiService _client;

  InboxDatasourceImpl({required ApiService client}) : _client = client;

  @override
  Future<PaginatedUsers> getPaginatedUsers({
    int? page,
    int? limit,
  }) async {
    try {
      final result = await _client.get(
        k_API_END_POINT_USERS,
        params: {
          if (page != null) 'page': page.toString(),
          if (limit != null) 'limit': limit.toString(),
        },
      );

      return PaginatedUsersModel.fromMap(result.data);
    } on ServerException catch (exception) {
      throw ServerException(message: exception.message);
    }
  }

  @override
  Future<PaginatedChatRooms> getPaginatedChatRooms({
    int? page,
    int? limit,
  }) async {
    try {
      final result = await _client.get(
        k_API_END_POINT_CHATS,
        params: {
          if (page != null) 'page': page.toString(),
          if (limit != null) 'limit': limit.toString(),
        },
      );

      return PaginatedChatRoomsModel.fromMap(result.data);
    } on ServerException catch (exception) {
      throw ServerException(message: exception.message);
    }
  }

  @override
  Future<PaginatedMessages> fetchMessagesOfChat({required int chatId, int? page, int? limit}) async {
    try {
      final result = await _client.get(
        k_API_END_POINT_CHATS + '$chatId/',
        params: {
          if (page != null) 'page': page.toString(),
          if (limit != null) 'limit': limit.toString(),
        },
      );

      return PaginatedMessagesModel.fromMap(result.data);
    } on ServerException catch (exception) {
      throw ServerException(message: exception.message);
    }
  }

  @override
  Future<ChatMessage> sendMessage({required String text, required int chatId}) async {
    try {
      final result = await _client.post(
        k_API_END_POINT_CHATS_SEND_MESSAGES,
        data: {'chat': chatId, 'text': text},
      );

      return ChatMessageModel.fromMap(result.data);
    } on ServerException catch (exception) {
      throw ServerException(message: exception.message);
    }
  }

  @override
  Future<void> createChat({required int companionId, required int publicationId}) async {
    try {
      await _client.post(
        k_API_END_POINT_CHATS_NEW,
        data: {'companion_id': companionId, 'publication_id': publicationId},
      );

      return;
    } on ServerException catch (exception) {
      throw ServerException(message: exception.message);
    }
  }

  @override
  Future<PaginatedMessages> fetchRestMessagesOfChat(
      {required int messageId, int? page, int? limit, bool? after}) async {
    try {
      final result = await _client.get(
        k_API_END_POINT_CHATS_MESSAGES + '$messageId/',
        params: {
          if (page != null) 'page': page.toString(),
          if (limit != null) 'limit': limit.toString(),
          if (after != null) 'after': after.toString(),
          'ordering': 'id'
        },
      );

      return PaginatedMessagesModel.fromMap(result.data);
    } on ServerException catch (exception) {
      throw ServerException(message: exception.message);
    }
  }
}
