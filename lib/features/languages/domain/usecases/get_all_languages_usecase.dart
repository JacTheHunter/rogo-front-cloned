import 'package:dartz/dartz.dart';
import 'package:rogo/core/error/failures.dart';
import 'package:rogo/core/usecase/usecase.dart';
import 'package:rogo/features/languages/domain/entities/language.dart';
import 'package:rogo/features/languages/domain/repositories/languages_repository.dart';

class GetAllLanguagesUseCase extends UseCase<List<Language>, NoParams> {
  final LanguagesRepository _repository;

  GetAllLanguagesUseCase({required LanguagesRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, List<Language>>> call(NoParams params) async {
    return await _repository.getAllLanguages();
  }
}
