import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../entities/paginated_countries.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/countries_and_cities_repository.dart';

class GetAllCountriesUseCase extends UseCase<PaginatedCountries, CountriesParams> {
  final CountriesAndCitiesRepository _repository;

  GetAllCountriesUseCase({required CountriesAndCitiesRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, PaginatedCountries>> call(CountriesParams params) async {
    return await _repository.getAllCountries(
      page: params.page,
      limit: params.limit,
    );
  }
}

class CountriesParams extends Equatable {
  final int? page;
  final int? limit;
  CountriesParams({
    this.page,
    this.limit,
  });

  @override
  List<Object?> get props => [page, limit];
}
