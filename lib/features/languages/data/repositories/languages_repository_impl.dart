import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/paginated_languages.dart';
import '../../domain/repositories/languages_repository.dart';
import '../datasources/languages_datasource.dart';

class LanguagesRepositoryImpl extends LanguagesRepository {
  final LanguagesDatasource _datasource;

  LanguagesRepositoryImpl({required LanguagesDatasource datasource}) : _datasource = datasource;
  @override
  Future<Either<Failure, PaginatedLanguages>> getAllLanguages({
    int? page,
    int? limit,
  }) async {
    try {
      final result = await _datasource.getAllLanguages(
        page: page,
        limit: limit,
      );
      return Right(result);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.message));
    }
  }
}
