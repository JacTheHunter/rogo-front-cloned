import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/city.dart';
import '../entities/country.dart';

abstract class CountriesAndCitiesRepository {
  Future<Either<Failure, List<City>>> getAllCitiesOfSelectedCountry({required int countryId});
  Future<Either<Failure, List<Country>>> getAllCountries();
}
