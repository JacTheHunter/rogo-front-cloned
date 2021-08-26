import 'package:dartz/dartz.dart';
import 'package:rogo/core/error/exceptions.dart';
import 'package:rogo/core/error/failures.dart';
import 'package:rogo/features/countries_and_cities/data/datasources/countries_and_cities_datasource.dart';
import 'package:rogo/features/countries_and_cities/domain/entities/city.dart';
import 'package:rogo/features/countries_and_cities/domain/entities/country.dart';
import 'package:rogo/features/countries_and_cities/domain/repositories/countries_and_cities_repository.dart';

class CountriesAndCitiesRepositoryImpl extends CountriesAndCitiesRepository {
  final CountriesAndCitiesDatasource _datasource;

  CountriesAndCitiesRepositoryImpl({required CountriesAndCitiesDatasource datasource}) : _datasource = datasource;
  @override
  Future<Either<Failure, List<City>>> getAllCitiesOfSelectedCountry({required int countryId}) async {
    try {
      final result = await _datasource.getAllCitiesOfSelectedCountry(countryId: countryId);
      return Right(result);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, List<Country>>> getAllCountries() async {
    try {
      final result = await _datasource.getAllCountries();
      return Right(result);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.message));
    }
  }
}
