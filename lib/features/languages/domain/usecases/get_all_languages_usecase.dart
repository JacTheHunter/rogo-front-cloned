import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../entities/paginated_languages.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/languages_repository.dart';

class GetAllLanguagesUseCase extends UseCase<PaginatedLanguages, LanguagesParams> {
  final LanguagesRepository _repository;

  GetAllLanguagesUseCase({required LanguagesRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, PaginatedLanguages>> call(LanguagesParams params) async {
    return await _repository.getAllLanguages(
      page: params.page,
      limit: params.limit,
    );
  }
}

class LanguagesParams extends Equatable {
  final int? page;
  final int? limit;
  LanguagesParams({
    this.page,
    this.limit,
  });

  @override
  List<Object?> get props => [page, limit];
}
