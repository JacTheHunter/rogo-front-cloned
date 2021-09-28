import 'package:dartz/dartz.dart';
import 'package:rogo/core/usecase/paginated_response_params.dart';
import '../entities/paginated_languages.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/languages_repository.dart';

class GetAllLanguagesUseCase extends UseCase<PaginatedLanguages, PaginatedResponseParams> {
  final LanguagesRepository _repository;

  GetAllLanguagesUseCase({required LanguagesRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, PaginatedLanguages>> call(PaginatedResponseParams params) async {
    return await _repository.getAllLanguages(
      page: params.page,
      limit: params.limit,
    );
  }
}
