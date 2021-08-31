import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../entities/paginated_cities.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/countries_and_cities_repository.dart';

class GetAllCitiesOfSelectedCountryUseCase extends UseCase<PaginatedCities, CitiesParams> {
  final CountriesAndCitiesRepository _repository;

  GetAllCitiesOfSelectedCountryUseCase({required CountriesAndCitiesRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, PaginatedCities>> call(CitiesParams params) async {
    return await _repository.getAllCitiesOfSelectedCountry(countryId: params.countryId);
  }
}

class CitiesParams extends Equatable {
  final int countryId;
  final int? page;
  final int? limit;
  CitiesParams({
    required this.countryId,
    this.page,
    this.limit,
  });

  @override
  List<Object?> get props => [countryId, page, limit];
}
