import 'dart:convert';

import 'package:rogo/features/inbox/data/models/chat_message_model.dart';
import 'package:rogo/features/inbox/domain/entities/chat_message.dart';
import 'package:rogo/features/inbox/domain/entities/paginated_messages.dart';

class PaginatedMessagesModel extends PaginatedMessages {
  final int page;
  final int totalObjects;
  final int currentPageSize;
  final int limit;
  final int totalPages;
  final List<ChatMessage> results;
  PaginatedMessagesModel({
    required this.page,
    required this.totalObjects,
    required this.currentPageSize,
    required this.limit,
    required this.totalPages,
    required this.results,
  }) : super(
          page: page,
          totalObjects: totalObjects,
          currentPageSize: currentPageSize,
          limit: limit,
          totalPages: totalPages,
          results: results,
        );

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'total_objects': totalObjects,
      'current_page_size': currentPageSize,
      'limit': limit,
      'total_pages': totalPages,
      'results': results.map((x) => (x as ChatMessageModel).toMap()).toList(),
    };
  }

  factory PaginatedMessagesModel.fromMap(Map<String, dynamic> map) {
    return PaginatedMessagesModel(
      page: map['page'],
      totalObjects: map['total_objects'],
      currentPageSize: map['current_page_size'],
      limit: map['limit'],
      totalPages: map['total_pages'],
      results: List<ChatMessageModel>.from(map['results']?.map((x) => ChatMessageModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PaginatedMessagesModel.fromJson(String source) => PaginatedMessagesModel.fromMap(json.decode(source));
}
