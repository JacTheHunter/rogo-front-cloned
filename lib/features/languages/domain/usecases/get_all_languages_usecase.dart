import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/language.dart';
import '../repositories/languages_repository.dart';

class GetAllLanguagesUseCase extends UseCase<List<Language>, NoParams> {
  final LanguagesRepository _repository;

  GetAllLanguagesUseCase({required LanguagesRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, List<Language>>> call(NoParams params) async {
    return await _repository.getAllLanguages();
  }
}
