import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/language.dart';
import '../../domain/repositories/languages_repository.dart';
import '../datasources/languages_datasource.dart';

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
