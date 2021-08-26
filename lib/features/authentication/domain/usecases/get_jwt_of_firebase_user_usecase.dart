import 'package:dartz/dartz.dart';
import 'package:rogo/core/error/failures.dart';
import 'package:rogo/core/usecase/usecase.dart';
import 'package:rogo/features/authentication/domain/repositories/firebase_authentication_repository.dart';

class GetJWTofFirebseUserUseCase extends UseCase<String, NoParams> {
  final FirebaseAuthenticationRepository _repository;

  GetJWTofFirebseUserUseCase({required FirebaseAuthenticationRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await _repository.getJwtOfFirebaseUser();
  }
}
