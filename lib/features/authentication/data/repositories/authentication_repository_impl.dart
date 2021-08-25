import 'package:rogo/core/error/exceptions.dart';
import 'package:rogo/features/authentication/data/datasources/authentication_datasource.dart';
import 'package:rogo/features/authentication/domain/entities/user.dart';
import 'package:rogo/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:rogo/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationDatasource _datasource;

  AuthenticationRepositoryImpl({required AuthenticationDatasource datasource}) : _datasource = datasource;

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      final result = await _datasource.getCurrentUser();
      return Right(result);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, User>> registerUser({
    required String firstName,
    required String lastName,
    required String birtDate,
    required String phone,
    required int country,
    required int city,
    required String zip,
    required String speaks,
  }) async {
    try {
      final result = await _datasource.registerUser(
        firstName: firstName,
        lastName: lastName,
        birtDate: birtDate,
        phone: phone,
        country: country,
        city: city,
        zip: zip,
        speaks: speaks,
      );
      return Right(result);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.message));
    }
  }
}
