import 'package:dartz/dartz.dart';
import '../entities/paginated_languages.dart';

import '../../../../core/error/failures.dart';

abstract class LanguagesRepository {
  Future<Either<Failure, PaginatedLanguages>> getAllLanguages({
    int? page,
    int? limit,
  });
}
