import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/country.dart';
import '../repositories/countries_and_cities_repository.dart';

class GetAllCountriesUseCase extends UseCase<List<Country>, NoParams> {
  final CountriesAndCitiesRepository _repository;

  GetAllCountriesUseCase({required CountriesAndCitiesRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, List<Country>>> call(NoParams params) async {
    return await _repository.getAllCountries();
  }
}
