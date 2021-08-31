import 'package:equatable/equatable.dart';
import 'top_seller.dart';

class PaginatedTopSellers extends Equatable {
  final int page;
  final int totalObjects;
  final int currentPageSize;
  final int limit;
  final int totalPages;
  final List<TopSeller> results;

  PaginatedTopSellers({
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
