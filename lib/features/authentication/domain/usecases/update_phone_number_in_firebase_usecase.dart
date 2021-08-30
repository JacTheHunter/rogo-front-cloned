import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/firebase_authentication_repository.dart';

class UpdatePhoneNumberInFirebaseUseCase extends UseCase<bool, Params> {
  final FirebaseAuthenticationRepository _repository;

  UpdatePhoneNumberInFirebaseUseCase({required FirebaseAuthenticationRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.updatePhoneNumber(phoneAuthCredential: params.phoneAuthCredential);
  }
}

class Params extends Equatable {
  final PhoneAuthCredential phoneAuthCredential;

  Params({required this.phoneAuthCredential});

  @override
  List<Object?> get props => [
        phoneAuthCredential,
      ];
}
