import 'package:equatable/equatable.dart';

import 'wishlists_live_search.dart';

class PaginatedWishlistsLiveSearch extends Equatable {
  final int page;
  final int totalObjects;
  final int currentPageSize;
  final int limit;
  final int totalPages;
  final List<WishlistsLiveSearch> results;

  PaginatedWishlistsLiveSearch({
    required this.page,
    required this.totalObjects,
    required this.currentPageSize,
    required this.limit,
    required this.totalPages,
    required this.results,
  });

  @override
  List<Object?> get props {
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
