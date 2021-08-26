import 'package:dartz/dartz.dart';
import 'package:rogo/core/error/exceptions.dart';
import 'package:rogo/core/error/failures.dart';
import 'package:rogo/features/languages/data/datasources/languages_datasource.dart';
import 'package:rogo/features/languages/domain/entities/language.dart';
import 'package:rogo/features/languages/domain/repositories/languages_repository.dart';

class LanguagesRepositoryImpl extends LanguagesRepository {
  final LanguagesDatasource _datasource;

  LanguagesRepositoryImpl({required LanguagesDatasource datasource}) : _datasource = datasource;
  @override
  Future<Either<Failure, List<Language>>> getAllLanguages() async {
    try {
      final result = await _datasource.getAllLanguages();
      return Right(result);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.message));
    }
  }
}
