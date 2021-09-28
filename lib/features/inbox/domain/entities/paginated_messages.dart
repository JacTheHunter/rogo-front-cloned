import 'package:equatable/equatable.dart';
import 'package:rogo/features/inbox/domain/entities/chat_message.dart';

class PaginatedMessages extends Equatable {
  final int page;
  final int totalObjects;
  final int currentPageSize;
  final int limit;
  final int totalPages;
  final List<ChatMessage> results;
  PaginatedMessages({
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
