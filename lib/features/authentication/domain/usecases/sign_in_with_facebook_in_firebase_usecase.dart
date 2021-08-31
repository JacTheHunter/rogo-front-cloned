import 'package:dartz/dartz.dart';
import 'package:rogo/core/error/failures.dart';
import 'package:rogo/core/usecase/usecase.dart';
import 'package:rogo/features/authentication/domain/entities/firebase_user.dart';
import 'package:rogo/features/authentication/domain/repositories/firebase_authentication_repository.dart';

class SignInWithFacebookInFirebaseUseCase extends UseCase<FirebaseUser, NoParams> {
  final FirebaseAuthenticationRepository _repository;

  SignInWithFacebookInFirebaseUseCase({required FirebaseAuthenticationRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, FirebaseUser>> call(NoParams params) async {
    return await _repository.signInWithFacebookInFirebase();
  }
}
