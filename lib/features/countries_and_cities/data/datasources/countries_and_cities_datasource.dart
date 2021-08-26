import 'package:rogo/core/configs/constants/api.dart';
import 'package:rogo/core/error/exceptions.dart';
import 'package:rogo/core/services/api_service.dart';
import 'package:rogo/features/countries_and_cities/data/models/city_model.dart';
import 'package:rogo/features/countries_and_cities/data/models/country_model.dart';
import 'package:rogo/features/countries_and_cities/domain/entities/city.dart';
import 'package:rogo/features/countries_and_cities/domain/entities/country.dart';

abstract class CountriesAndCitiesDatasource {
  Future<List<City>> getAllCitiesOfSelectedCountry({required int countryId});
  Future<List<Country>> getAllCountries();
}

class CountriesAndCitiesDatasourceImpl implements CountriesAndCitiesDatasource {
  final ApiService _client;

  CountriesAndCitiesDatasourceImpl({required ApiService client}) : _client = client;

  @override
  Future<List<City>> getAllCitiesOfSelectedCountry({required int countryId}) async {
    try {
      final result = await _client.get(
        k_API_END_POINT_COUNTRY + '$countryId' + k_API_END_POINT_CITY,
      );
      return (result.data as List).map((c) => CityModel.fromMap(c)).toList();
    } on ServerException catch (exception) {
      throw ServerException(message: exception.message);
    }
  }

  @override
  Future<List<Country>> getAllCountries() async {
    try {
      final result = await _client.get(
        k_API_END_POINT_COUNTRY,
      );
      return (result.data as List).map((c) => CountryModel.fromMap(c)).toList();
    } on ServerException catch (exception) {
      throw ServerException(message: exception.message);
    }
  }
}
