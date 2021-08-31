import 'dart:convert';

import '../../domain/entities/country.dart';
import '../../domain/entities/paginated_countries.dart';

import 'country_model.dart';

class PaginatedCountriesModel extends PaginatedCountries {
  final int page;
  final int totalObjects;
  final int currentPageSize;
  final int limit;
  final int totalPages;
  final List<Country> results;
  PaginatedCountriesModel({
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
      'results': results.map((x) => (x as CountryModel).toMap()).toList(),
    };
  }

  factory PaginatedCountriesModel.fromMap(Map<String, dynamic> map) {
    return PaginatedCountriesModel(
      page: map['page'],
      totalObjects: map['total_objects'],
      currentPageSize: map['current_page_size'],
      limit: map['limit'],
      totalPages: map['total_pages'],
      results: List<Country>.from(map['results']?.map((x) => CountryModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PaginatedCountriesModel.fromJson(String source) => PaginatedCountriesModel.fromMap(json.decode(source));
}
