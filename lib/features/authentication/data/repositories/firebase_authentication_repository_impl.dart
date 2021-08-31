import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rogo/core/error/exceptions.dart';
import 'package:rogo/core/error/failures.dart';
import 'package:rogo/features/authentication/data/datasources/firebase_authentication_datasource.dart';
import 'package:rogo/features/authentication/domain/entities/firebase_user.dart';
import 'package:rogo/features/authentication/domain/repositories/firebase_authentication_repository.dart';

class FirebaseAuthenticationRepositoryImpl implements FirebaseAuthenticationRepository {
  FirebaseAuthenticationDatasource _datasource;

  FirebaseAuthenticationRepositoryImpl({required FirebaseAuthenticationDatasource datasource})
      : _datasource = datasource;

  @override
  Future<Either<Failure, FirebaseUser>> createUserWithEmailAndPasswordInFirebase(
      {required String email, required String password}) async {
    try {
      final firebaseUser = await _datasource.createUserWithEmailAndPasswordInFirebase(email: email, password: password);
      return Right(firebaseUser);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, FirebaseUser>> signInWithEmailAndPasswordInFirebase(
      {required String email, required String password}) async {
    try {
      final firebaseUser = await _datasource.signInWithEmailAndPasswordInFirebase(email: email, password: password);
      return Right(firebaseUser);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> signOutInFirebase() async {
    try {
      await _datasource.signOutInFirebase();
      return Right(true);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> sendPasswordResetEmailInFirebase({required String email}) async {
    try {
      await _datasource.sendPasswordResetEmailInFirebase(email: email);
      return Right(true);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Stream<FirebaseUser> getUserStreamInFirebase() {
    return _datasource.getUserStreamInFirebase();
  }

  @override
  Future<Either<Failure, FirebaseUser>> signInAnonymousInFirebase() async {
    try {
      final firebaseUser = await _datasource.signInAnonymousInFirebase();
      return Right(firebaseUser);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, FirebaseUser>> signInWithGoogleInFirebase() async {
    try {
      final firebaseUser = await _datasource.signInWithGoogleInFirebase();
      return Right(firebaseUser);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, String>> getJwtOfFirebaseUser() async {
    try {
      final result = await _datasource.getJwtOfFirebaseUser();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> verifyPhoneNumber({
    required String phoneNumber,
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(String, int?) codeSent,
    required Function(FirebaseAuthException) verificationFailed,
    int? forceResendingToken,
  }) async {
    try {
      await _datasource.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: verificationCompleted,
          codeSent: codeSent,
          verificationFailed: verificationFailed);
      return Right(true);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> updatePhoneNumber({required PhoneAuthCredential phoneAuthCredential}) async {
    try {
      await _datasource.updatePhoneNumber(phoneAuthCredential: phoneAuthCredential);
      return Right(true);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, FirebaseUser>> signInWithFacebookInFirebase() async {
    try {
      final firebaseUser = await _datasource.signInWithFacebookInFirebase();
      return Right(firebaseUser);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
