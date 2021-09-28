import 'package:equatable/equatable.dart';
import 'package:rogo/features/authentication/domain/entities/user.dart';

class PaginatedUsers extends Equatable {
  final int page;
  final int totalObjects;
  final int currentPageSize;
  final int limit;
  final int totalPages;
  final List<User> results;
  PaginatedUsers({
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
