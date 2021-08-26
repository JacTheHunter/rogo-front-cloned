import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:rogo/core/error/failures.dart';
import 'package:rogo/core/usecase/usecase.dart';
import 'package:rogo/features/countries_and_cities/domain/entities/city.dart';
import 'package:rogo/features/countries_and_cities/domain/repositories/countries_and_cities_repository.dart';

class GetAllCitiesOfSelectedCountryUseCase extends UseCase<List<City>, Params> {
  final CountriesAndCitiesRepository _repository;

  GetAllCitiesOfSelectedCountryUseCase({required CountriesAndCitiesRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, List<City>>> call(Params params) async {
    return await _repository.getAllCitiesOfSelectedCountry(countryId: params.countryId);
  }
}

class Params extends Equatable {
  final int countryId;
  Params({
    required this.countryId,
  });

  @override
  List<Object> get props => [countryId];
}
