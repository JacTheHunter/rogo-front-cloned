import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rogo/core/error/failures.dart';
import 'package:rogo/features/authentication/domain/entities/firebase_user.dart';

abstract class FirebaseAuthenticationRepository {
  Future<Either<Failure, FirebaseUser>> createUserWithEmailAndPasswordInFirebase(
      {required String email, required String password});

  Future<Either<Failure, FirebaseUser>> signInWithEmailAndPasswordInFirebase(
      {required String email, required String password});

  Future<Either<Failure, FirebaseUser>> signInAnonymousInFirebase();
  Future<Either<Failure, FirebaseUser>> signInWithGoogleInFirebase();

  Future<Either<Failure, bool>> signOutInFirebase();
  Future<Either<Failure, bool>> sendPasswordResetEmailInFirebase({required String email});

  Future<Either<Failure, String>> getJwtOfFirebaseUser();

  Future<Either<Failure, bool>> verifyPhoneNumber({
    required String phoneNumber,
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(String, int?) codeSent,
    required Function(FirebaseAuthException) verificationFailed,
    int? forceResendingToken,
  });
  Future<Either<Failure, bool>> updatePhoneNumber({required PhoneAuthCredential phoneAuthCredential});

  Stream<FirebaseUser> getUserStreamInFirebase();
}
