import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/firebase_authentication_repository.dart';

class SignOutInFirebaseUseCase extends UseCase<bool, NoParams> {
  final FirebaseAuthenticationRepository _repository;

  SignOutInFirebaseUseCase({required FirebaseAuthenticationRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await _repository.signOutInFirebase();
  }
}
