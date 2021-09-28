import 'dart:convert';

import 'package:rogo/features/inbox/data/models/chat_room_model.dart';
import 'package:rogo/features/inbox/domain/entities/chat_room.dart';
import 'package:rogo/features/inbox/domain/entities/paginated_chat_rooms.dart';

class PaginatedChatRoomsModel extends PaginatedChatRooms {
  final int page;
  final int totalObjects;
  final int currentPageSize;
  final int limit;
  final int totalPages;
  final List<ChatRoom> results;
  PaginatedChatRoomsModel({
    required this.page,
    required this.totalObjects,
    required this.currentPageSize,
    required this.limit,
    required this.totalPages,
    required this.results,
  }) : super(
          page: page,
          totalObjects: currentPageSize,
          limit: limit,
          totalPages: totalPages,
          results: results,
          currentPageSize: currentPageSize,
        );

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'total_objects': totalObjects,
      'current_page_size': currentPageSize,
      'limit': limit,
      'total_pages': totalPages,
      'results': results.map((x) => (x as ChatRoomModel).toMap()).toList(),
    };
  }

  factory PaginatedChatRoomsModel.fromMap(Map<String, dynamic> map) {
    return PaginatedChatRoomsModel(
      page: map['page'],
      totalObjects: map['total_objects'],
      currentPageSize: map['current_page_size'],
      limit: map['limit'],
      totalPages: map['total_pages'],
      results: List<ChatRoom>.from(map['results']?.map((x) => ChatRoomModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PaginatedChatRoomsModel.fromJson(String source) => PaginatedChatRoomsModel.fromMap(json.decode(source));
}
