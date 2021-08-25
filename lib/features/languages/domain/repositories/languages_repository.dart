import 'package:dartz/dartz.dart';
import 'package:rogo/core/error/failures.dart';
import 'package:rogo/features/languages/domain/entities/language.dart';

abstract class LanguagesRepository {
  Future<Either<Failure, List<Language>>> getAllLanguages();
}
