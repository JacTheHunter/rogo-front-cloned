import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/language.dart';

abstract class LanguagesRepository {
  Future<Either<Failure, List<Language>>> getAllLanguages();
}
