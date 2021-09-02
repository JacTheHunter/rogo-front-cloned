import 'dart:convert';

import '../../domain/entities/paginated_wishlists_feed.dart';
import '../../domain/entities/wishlists_feed.dart';
import 'wishlists_feed_model.dart';

class PaginatedWishlistsFeedModel extends PaginatedWishlistsFeed {
  final int page;
  final int totalObjects;
  final int currentPageSize;
  final int limit;
  final int totalPages;
  final List<WishlistsFeed> results;

  PaginatedWishlistsFeedModel({
    required this.page,
    required this.totalObjects,
    required this.currentPageSize,
    required this.limit,
    required this.totalPages,
    required this.results,
  }) : super(
          currentPageSize: currentPageSize,
          page: page,
          totalObjects: totalObjects,
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
      'results': results.map((x) => (x as WishlistsFeedModel).toMap()).toList(),
    };
  }

  factory PaginatedWishlistsFeedModel.fromMap(Map<String, dynamic> map) {
    return PaginatedWishlistsFeedModel(
      page: map['page'],
      totalObjects: map['total_objects'],
      currentPageSize: map['current_page_size'],
      limit: map['limit'],
      totalPages: map['total_pages'],
      results: List<WishlistsFeed>.from(map['results']?.map((x) => WishlistsFeedModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PaginatedWishlistsFeedModel.fromJson(String source) =>
      PaginatedWishlistsFeedModel.fromMap(json.decode(source));
}
