import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/firebase_authentication_repository.dart';

class GetJWTofFirebseUserUseCase extends UseCase<String, NoParams> {
  final FirebaseAuthenticationRepository _repository;

  GetJWTofFirebseUserUseCase({required FirebaseAuthenticationRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await _repository.getJwtOfFirebaseUser();
  }
}
