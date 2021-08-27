import 'package:dio/dio.dart';
import 'package:rogo/core/configs/constants/api.dart';
import 'package:rogo/core/error/exceptions.dart';
import 'package:rogo/core/injection/injection_container.dart';
import 'package:rogo/core/services/api_service.dart';
import 'package:rogo/core/services/box_service.dart';
import 'package:rogo/features/authentication/data/models/user_model.dart';
import 'package:rogo/features/authentication/domain/entities/user.dart';

abstract class AuthenticationDatasource {
  Future<User> getCurrentUser();
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
    final jwt = sl<BoxService>().appSettings.get('jwt');
    print(jwt);
    try {
      final result = await _client.get(
        k_API_END_POINT_USER_MY_PROFILE,
        options: Options(
          headers: {
            if (jwt != null) 'Authorization': 'jwt ' + jwt,
          },
        ),
      );
      
      // await Future.delayed(Duration(seconds: 2));
      return UserModel.fromJson(result.data);
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
    final jwt = sl<BoxService>().appSettings.get('jwt');
    try {
      final result = await _client.post(k_API_END_POINT_USER,
          options: Options(
            headers: {
              if (jwt != null) 'Authorization': 'jwt ' + jwt,
            },
          ),
          data: {
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
      return UserModel.fromJson(result.data);
    } on ServerException catch (exception) {
      throw ServerException(message: exception.message);
    }
  }
}
