import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/authentication_repository.dart';

class GetCurrentUserUseCase extends UseCase<User, NoParams> {
  final AuthenticationRepository _repository;

  GetCurrentUserUseCase({required AuthenticationRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await _repository.getCurrentUser();
  }
}
