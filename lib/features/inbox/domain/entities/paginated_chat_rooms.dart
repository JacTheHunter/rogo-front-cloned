import 'package:equatable/equatable.dart';

import 'chat_room.dart';

class PaginatedChatRooms extends Equatable {
  final int page;
  final int totalObjects;
  final int currentPageSize;
  final int limit;
  final int totalPages;
  final List<ChatRoom> results;
  PaginatedChatRooms({
    required this.page,
    required this.totalObjects,
    required this.currentPageSize,
    required this.limit,
    required this.totalPages,
    required this.results,
  });

  @override
  List<Object> get props {
    return [
      page,
      totalObjects,
      currentPageSize,
      limit,
      totalPages,
      results,
    ];
  }
}
