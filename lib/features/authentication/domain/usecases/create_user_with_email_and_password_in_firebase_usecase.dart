import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/firebase_user.dart';
import '../repositories/firebase_authentication_repository.dart';

class CreateUserWithEmailAndPasswordInFirebaseUseCase extends UseCase<FirebaseUser, Params> {
  final FirebaseAuthenticationRepository _repository;

  CreateUserWithEmailAndPasswordInFirebaseUseCase({required FirebaseAuthenticationRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, FirebaseUser>> call(Params params) async {
    return await _repository.createUserWithEmailAndPasswordInFirebase(email: params.email, password: params.password);
  }
}

class Params extends Equatable {
  final String email;
  final String password;

  Params({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
