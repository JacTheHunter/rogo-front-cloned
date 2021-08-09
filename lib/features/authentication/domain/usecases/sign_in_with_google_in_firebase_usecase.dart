import 'package:dartz/dartz.dart';
import 'package:rogo/core/error/failures.dart';
import 'package:rogo/core/usecase/usecase.dart';
import 'package:rogo/features/authentication/domain/entities/firebase_user.dart';
import 'package:rogo/features/authentication/domain/repositories/firebase_authentication_repository.dart';

class SignInWithGoogleInFirebaseUseCase extends UseCase<FirebaseUser, NoParams> {
  final FirebaseAuthenticationRepository _repository;

  SignInWithGoogleInFirebaseUseCase({required FirebaseAuthenticationRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, FirebaseUser>> call(NoParams params) async {
    return await _repository.signInWithGoogleInFirebase();
  }
}
