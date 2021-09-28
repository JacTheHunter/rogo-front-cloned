import 'package:dartz/dartz.dart';
import 'package:rogo/core/usecase/paginated_response_params.dart';

import '../entities/paginated_countries.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/countries_and_cities_repository.dart';

class GetAllCountriesUseCase extends UseCase<PaginatedCountries, PaginatedResponseParams> {
  final CountriesAndCitiesRepository _repository;

  GetAllCountriesUseCase({required CountriesAndCitiesRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, PaginatedCountries>> call(PaginatedResponseParams params) async {
    return await _repository.getAllCountries(
      page: params.page,
      limit: params.limit,
    );
  }
}
