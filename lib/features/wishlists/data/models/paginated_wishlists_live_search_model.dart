import 'dart:convert';

import '../../domain/entities/paginated_wishlists_live_search.dart';
import '../../domain/entities/wishlists_live_search.dart';
import 'wishlists_live_search_model.dart';

class PaginatedWishlistsLiveSearchModel extends PaginatedWishlistsLiveSearch {
  final int page;
  final int totalObjects;
  final int currentPageSize;
  final int limit;
  final int totalPages;
  final List<WishlistsLiveSearch> results;

  PaginatedWishlistsLiveSearchModel({
    required this.page,
    required this.totalObjects,
    required this.currentPageSize,
    required this.limit,
    required this.totalPages,
    required this.results,
  }) : super(
          totalPages: totalPages,
          page: page,
          limit: limit,
          totalObjects: totalObjects,
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
      'results': results.map((x) => (x as WishlistsLiveSearchModel).toMap()).toList(),
    };
  }

  factory PaginatedWishlistsLiveSearchModel.fromMap(Map<String, dynamic> map) {
    return PaginatedWishlistsLiveSearchModel(
      page: map['page'],
      totalObjects: map['total_objects'],
      currentPageSize: map['current_page_size'],
      limit: map['limit'],
      totalPages: map['total_pages'],
      results: List<WishlistsLiveSearch>.from(map['results']?.map((x) => WishlistsLiveSearchModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PaginatedWishlistsLiveSearchModel.fromJson(String source) =>
      PaginatedWishlistsLiveSearchModel.fromMap(json.decode(source));
}
