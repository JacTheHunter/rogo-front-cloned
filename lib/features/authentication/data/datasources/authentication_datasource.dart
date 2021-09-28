import 'package:rogo/core/injection/injection_container.dart';
import 'package:rogo/core/services/box_service.dart';

import '../../../../core/configs/constants/api.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/services/api_service.dart';
import '../../domain/entities/user.dart';
import '../models/user_model.dart';

abstract class AuthenticationDatasource {
  Future<User> getCurrentUser();
  Future<List<User>> getallUsers();
  Future<User> registerUser({
    required String firstName,
    required String lastName,
    required String birtDate,
    required String phone,
    required int country,
    required int city,
    required String zip,
    required String speaks,
  });
}

class AuthenticationDatasourceImpl implements AuthenticationDatasource {
  final ApiService _client;

  AuthenticationDatasourceImpl({required ApiService client}) : _client = client;

  @override
  Future<User> getCurrentUser() async {
    try {
      final result = await _client.get(
        k_API_END_POINT_USERS_SELF,
      );

      // await Future.delayed(Duration(seconds: 2));
      return UserModel.fromMap(result.data);
    } on ServerException catch (exception) {
      throw ServerException(message: exception.message);
    }
  }

  @override
  Future<User> registerUser({
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
      final jwt = sl<BoxService>().appSettings.get('jwt');
      final result = await _client.post(k_API_END_POINT_USERS_ADD, data: {
        'token': jwt,
        'first_name': firstName,
        'last_name': lastName,
        'birth_date': birtDate,
        'phone': phone,
        'country': country,
        'city': city,
        'zip': zip,
        'speaks': speaks, //:TODO
      });
      // await Future.delayed(Duration(seconds: 2));
      return UserModel.fromMap(result.data);
    } on ServerException catch (exception) {
      throw ServerException(message: exception.message);
    }
  }

  @override
  Future<List<User>> getallUsers() async {
    try {
      final result = await _client.get(
        k_API_END_POINT_USERS,
      );

      // await Future.delayed(Duration(seconds: 2));
      return (result.data as List).map((r) => UserModel.fromMap(r)).toList();
    } on ServerException catch (exception) {
      throw ServerException(message: exception.message);
    }
  }
}
