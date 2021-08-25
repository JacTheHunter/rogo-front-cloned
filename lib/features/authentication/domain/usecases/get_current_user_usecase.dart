import 'package:rogo/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:rogo/core/usecase/usecase.dart';
import 'package:rogo/features/authentication/domain/entities/user.dart';
import 'package:rogo/features/authentication/domain/repositories/authentication_repository.dart';

class GetCurrentUserUseCase extends UseCase<User, NoParams> {
  final AuthenticationRepository _repository;

  GetCurrentUserUseCase({required AuthenticationRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await _repository.getCurrentUser();
  }
}
