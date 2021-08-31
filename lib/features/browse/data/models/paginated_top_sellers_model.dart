import 'dart:convert';

import 'top_sellers_model.dart';
import '../../domain/entities/paginated_top_sellers.dart';
import '../../domain/entities/top_seller.dart';

class PaginatedTopSellersModel extends PaginatedTopSellers {
  final int page;
  final int totalObjects;
  final int currentPageSize;
  final int limit;
  final int totalPages;
  final List<TopSeller> results;
  PaginatedTopSellersModel({
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
      'results': results.map((x) => (x as TopSellerModel).toMap()).toList(),
    };
  }

  factory PaginatedTopSellersModel.fromMap(Map<String, dynamic> map) {
    return PaginatedTopSellersModel(
      page: map['page'],
      totalObjects: map['total_objects'],
      currentPageSize: map['current_page_size'],
      limit: map['limit'],
      totalPages: map['total_pages'],
      results: List<TopSeller>.from(map['results']?.map((x) => TopSellerModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PaginatedTopSellersModel.fromJson(String source) => PaginatedTopSellersModel.fromMap(json.decode(source));
}
