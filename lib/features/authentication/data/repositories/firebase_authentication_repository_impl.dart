import 'package:dartz/dartz.dart';
import 'package:rogo/core/error/exceptions.dart';
import 'package:rogo/core/error/failures.dart';
import 'package:rogo/features/authentication/data/datasources/firebase_authentication_datasource.dart';
import 'package:rogo/features/authentication/domain/entities/firebase_user.dart';
import 'package:rogo/features/authentication/domain/repositories/firebase_authentication_repository.dart';

class FirebaseAuthenticationRepositoryImpl implements FirebaseAuthenticationRepository {
  FirebaseAuthenticationDatasource datasource;

  FirebaseAuthenticationRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, FirebaseUser>> createUserWithEmailAndPasswordInFirebase(
      {required String email, required String password}) async {
    try {
      final firebaseUser = await datasource.createUserWithEmailAndPasswordInFirebase(email: email, password: password);
      return Right(firebaseUser);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, FirebaseUser>> signInWithEmailAndPasswordInFirebase(
      {required String email, required String password}) async {
    try {
      final firebaseUser = await datasource.signInWithEmailAndPasswordInFirebase(email: email, password: password);
      return Right(firebaseUser);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> signOutInFirebase() async {
    try {
      await datasource.signOutInFirebase();
      return Right(true);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> sendPasswordResetEmailInFirebase({required String email}) async {
    try {
      await datasource.sendPasswordResetEmailInFirebase(email: email);
      return Right(true);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Stream<FirebaseUser> getUserStreamInFirebase() {
    return datasource.getUserStreamInFirebase();
  }

  @override
  Future<Either<Failure, FirebaseUser>> signInAnonymousInFirebase() async {
    try {
      final firebaseUser = await datasource.signInAnonymousInFirebase();
      return Right(firebaseUser);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, FirebaseUser>> signInWithGoogleInFirebase() async {
    try {
      final firebaseUser = await datasource.signInWithGoogleInFirebase();
      return Right(firebaseUser);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
