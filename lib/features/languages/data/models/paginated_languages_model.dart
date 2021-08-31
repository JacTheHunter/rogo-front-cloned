import 'dart:convert';

import '../../domain/entities/language.dart';
import '../../domain/entities/paginated_languages.dart';

import 'language_model.dart';

class PaginatedLanguagesModel extends PaginatedLanguages {
  final int page;
  final int totalObjects;
  final int currentPageSize;
  final int limit;
  final int totalPages;
  final List<Language> results;
  PaginatedLanguagesModel({
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
      'results': results.map((x) => (x as LanguageModel).toMap()).toList(),
    };
  }

  factory PaginatedLanguagesModel.fromMap(Map<String, dynamic> map) {
    return PaginatedLanguagesModel(
      page: map['page'],
      totalObjects: map['total_objects'],
      currentPageSize: map['current_page_size'],
      limit: map['limit'],
      totalPages: map['total_pages'],
      results: List<Language>.from(map['results']?.map((x) => LanguageModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PaginatedLanguagesModel.fromJson(String source) => PaginatedLanguagesModel.fromMap(json.decode(source));
}
