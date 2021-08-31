import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/firebase_user.dart';
import '../repositories/firebase_authentication_repository.dart';

class SignInWithFacebookInFirebaseUseCase extends UseCase<FirebaseUser, NoParams> {
  final FirebaseAuthenticationRepository _repository;

  SignInWithFacebookInFirebaseUseCase({required FirebaseAuthenticationRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, FirebaseUser>> call(NoParams params) async {
    return await _repository.signInWithFacebookInFirebase();
  }
}
