import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/firebase_authentication_repository.dart';

class VerifyPhoneNumberInFirebaseUseCase extends UseCase<bool, Params> {
  final FirebaseAuthenticationRepository _repository;

  VerifyPhoneNumberInFirebaseUseCase({required FirebaseAuthenticationRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.verifyPhoneNumber(
      phoneNumber: params.phoneNumber,
      verificationCompleted: params.verificationCompleted,
      codeSent: params.codeSent,
      verificationFailed: params.verificationFailed,
    );
  }
}

class Params extends Equatable {
  final String phoneNumber;
  final Function(PhoneAuthCredential) verificationCompleted;
  final Function(FirebaseAuthException) verificationFailed;
  final Function(String, int?) codeSent;
  final int? forceResendingToken;

  Params({
    required this.phoneNumber,
    required this.verificationCompleted,
    required this.verificationFailed,
    required this.codeSent,
    this.forceResendingToken,
  });

  @override
  List<Object?> get props => [
        phoneNumber,
        verificationCompleted,
        verificationFailed,
        codeSent,
        forceResendingToken,
      ];
}
