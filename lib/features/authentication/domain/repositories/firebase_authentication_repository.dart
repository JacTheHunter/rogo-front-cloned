import 'package:dartz/dartz.dart';
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

  Stream<FirebaseUser> getUserStreamInFirebase();
}
