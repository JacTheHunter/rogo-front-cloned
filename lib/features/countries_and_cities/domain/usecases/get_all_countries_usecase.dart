import 'package:dartz/dartz.dart';
import 'package:rogo/core/error/failures.dart';
import 'package:rogo/core/usecase/usecase.dart';
import 'package:rogo/features/countries_and_cities/domain/entities/country.dart';
import 'package:rogo/features/countries_and_cities/domain/repositories/countries_and_cities_repository.dart';

class GetAllCountriesUseCase extends UseCase<List<Country>, NoParams> {
  final CountriesAndCitiesRepository _repository;

  GetAllCountriesUseCase({required CountriesAndCitiesRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, List<Country>>> call(NoParams params) async {
    return await _repository.getAllCountries();
  }
}
