import 'dart:convert';

import 'city_model.dart';
import '../../domain/entities/city.dart';
import '../../domain/entities/paginated_cities.dart';

class PaginatedCitiesModel extends PaginatedCities {
  final int page;
  final int totalObjects;
  final int currentPageSize;
  final int limit;
  final int totalPages;
  final List<City> results;
  PaginatedCitiesModel({
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
      'results': results.map((x) => (x as CityModel).toMap()).toList(),
    };
  }

  factory PaginatedCitiesModel.fromMap(Map<String, dynamic> map) {
    return PaginatedCitiesModel(
      page: map['page'],
      totalObjects: map['total_objects'],
      currentPageSize: map['current_page_size'],
      limit: map['limit'],
      totalPages: map['total_pages'],
      results: List<City>.from(map['results']?.map((x) => CityModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PaginatedCitiesModel.fromJson(String source) => PaginatedCitiesModel.fromMap(json.decode(source));
}
