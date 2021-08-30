import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/firebase_authentication_repository.dart';

class SendPasswordResetEmailInFirebaseUseCase extends UseCase<bool, Params> {
  final FirebaseAuthenticationRepository _repository;

  SendPasswordResetEmailInFirebaseUseCase({required FirebaseAuthenticationRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.sendPasswordResetEmailInFirebase(email: params.email);
  }
}

class Params extends Equatable {
  final String email;

  Params({required this.email});

  @override
  List<Object?> get props => [
        email,
      ];
}
