import 'package:dartz/dartz.dart';
import 'package:rogo/core/error/failures.dart';
import 'package:rogo/features/countries_and_cities/domain/entities/city.dart';
import 'package:rogo/features/countries_and_cities/domain/entities/country.dart';

abstract class CountriesAndCitiesRepository {
  Future<Either<Failure, List<City>>> getAllCitiesOfSelectedCountry({required int countryId});
  Future<Either<Failure, List<Country>>> getAllCountries();
}
