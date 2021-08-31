import 'package:dartz/dartz.dart';
import '../../domain/entities/paginated_cities.dart';
import '../../domain/entities/paginated_countries.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/countries_and_cities_repository.dart';
import '../datasources/countries_and_cities_datasource.dart';

class CountriesAndCitiesRepositoryImpl extends CountriesAndCitiesRepository {
  final CountriesAndCitiesDatasource _datasource;

  CountriesAndCitiesRepositoryImpl({required CountriesAndCitiesDatasource datasource}) : _datasource = datasource;
  @override
  Future<Either<Failure, PaginatedCities>> getAllCitiesOfSelectedCountry({
    required int countryId,
    int? page,
    int? limit,
  }) async {
    try {
      final result = await _datasource.getAllCitiesOfSelectedCountry(
        countryId: countryId,
        page: page,
        limit: limit,
      );
      return Right(result);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, PaginatedCountries>> getAllCountries({
    int? page,
    int? limit,
  }) async {
    try {
      final result = await _datasource.getAllCountries(
        page: page,
        limit: limit,
      );
      return Right(result);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.message));
    }
  }
}
