import 'package:dartz/dartz.dart';
import '../entities/paginated_cities.dart';
import '../entities/paginated_countries.dart';

import '../../../../core/error/failures.dart';

abstract class CountriesAndCitiesRepository {
  Future<Either<Failure, PaginatedCities>> getAllCitiesOfSelectedCountry({
    required int countryId,
    int? page,
    int? limit,
  });
  Future<Either<Failure, PaginatedCountries>> getAllCountries({
    int? page,
    int? limit,
  });
}
