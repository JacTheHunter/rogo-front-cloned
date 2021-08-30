import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/authentication_repository.dart';

class RegisterUserUseCase extends UseCase<User, Params> {
  final AuthenticationRepository _repository;

  RegisterUserUseCase({required AuthenticationRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, User>> call(Params params) async {
    return await _repository.registerUser(
      firstName: params.firstName,
      lastName: params.lastName,
      birtDate: params.birtDate,
      phone: params.phone,
      country: params.country,
      city: params.city,
      zip: params.zip,
      speaks: params.speaks,
    );
  }
}

class Params extends Equatable {
  final String firstName;
  final String lastName;
  final String birtDate;
  final String phone;
  final int country;
  final int city;
  final String zip;
  final String speaks;
  Params({
    required this.firstName,
    required this.lastName,
    required this.birtDate,
    required this.phone,
    required this.country,
    required this.city,
    required this.zip,
    required this.speaks,
  });

  @override
  List<Object> get props {
    return [
      firstName,
      lastName,
      birtDate,
      phone,
      country,
      city,
      zip,
      speaks,
    ];
  }
}
