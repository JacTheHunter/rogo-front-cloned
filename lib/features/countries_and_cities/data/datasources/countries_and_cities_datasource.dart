import '../models/paginated_cities_model.dart';
import '../models/paginated_countries_model.dart';
import '../../domain/entities/paginated_cities.dart';
import '../../domain/entities/paginated_countries.dart';

import '../../../../core/configs/constants/api.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/services/api_service.dart';

abstract class CountriesAndCitiesDatasource {
  Future<PaginatedCities> getAllCitiesOfSelectedCountry({
    required int countryId,
    int? page,
    int? limit,
  });
  Future<PaginatedCountries> getAllCountries({
    int? page,
    int? limit,
  });
}

class CountriesAndCitiesDatasourceImpl implements CountriesAndCitiesDatasource {
  final ApiService _client;

  CountriesAndCitiesDatasourceImpl({required ApiService client}) : _client = client;

  @override
  Future<PaginatedCities> getAllCitiesOfSelectedCountry({
    required int countryId,
    int? page,
    int? limit,
  }) async {
    try {
      final result = await _client.get(
        k_API_END_POINT_COUNTRIES + '$countryId' + k_API_END_POINT_CITIES,
        params: {
          if (page != null) 'page': page.toString(),
          if (limit != null) 'limit': limit.toString(),
        },
      );
      return PaginatedCitiesModel.fromMap(result.data);
    } on ServerException catch (exception) {
      throw ServerException(message: exception.message);
    }
  }

  @override
  Future<PaginatedCountries> getAllCountries({
    int? page,
    int? limit,
  }) async {
    try {
      final result = await _client.get(
        k_API_END_POINT_COUNTRIES,
        params: {
          if (page != null) 'page': page.toString(),
          if (limit != null) 'limit': limit.toString(),
        },
      );
      return PaginatedCountriesModel.fromMap(result.data);
    } on ServerException catch (exception) {
      throw ServerException(message: exception.message);
    }
  }
}
