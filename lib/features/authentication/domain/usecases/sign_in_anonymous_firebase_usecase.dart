import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/firebase_user.dart';
import '../repositories/firebase_authentication_repository.dart';

class SignInAnonymousInFirebaseUseCase extends UseCase<FirebaseUser, NoParams> {
  final FirebaseAuthenticationRepository _repository;

  SignInAnonymousInFirebaseUseCase({required FirebaseAuthenticationRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, FirebaseUser>> call(NoParams params) async {
    return await _repository.signInAnonymousInFirebase();
  }
}
