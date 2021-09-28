import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/authentication_repository.dart';

class GetAllUsersUseCase extends UseCase<List<User>, NoParams> {
  final AuthenticationRepository _repository;

  GetAllUsersUseCase({required AuthenticationRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, List<User>>> call(NoParams params) async {
    return await _repository.getallUsers();
  }
}
