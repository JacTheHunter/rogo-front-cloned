import 'package:dio/dio.dart';
import 'package:rogo/core/injection/injection_container.dart';

import '../box_service.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // print('REQUEST[${options.method}] => PATH: ${options.path}');
    final jwt = await sl<BoxService>().appSettings.get('jwt');
    if (jwt != null) options.headers['Authorization'] = 'jwt ' + jwt;
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    //  print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    //  print('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');

    //TODO! FIX TOKEN ERROR
    // if (err.response?.statusCode == 401) {
    //   try {
    //     final token = FirebaseAuth.instance.currentUser?.getIdToken();
    //     final jwt = await sl<BoxService>().appSettings.get('jwt');
    //     if (jwt != token) {
    //       sl<BoxService>().appSettings.put(jwt, token);
    //     }

    //     await dio.post("https://refresh.api", data: jsonEncode({"refresh_token": refreshtoken})).then((value) async {
    //       if (value?.statusCode == 201) {
    //         //get new tokens ...
    //         print("access token" + token);
    //         print("refresh token" + refreshtoken);
    //         //set bearer
    //         e.requestOptions.headers["Authorization"] = "Bearer " + token;
    //         //create request with new access token
    //         final opts = new Options(method: e.requestOptions.method, headers: e.requestOptions.headers);
    //         final cloneReq = await dio.request(e.requestOptions.path,
    //             options: opts, data: e.requestOptions.data, queryParameters: e.requestOptions.queryParameters);

    //         return handler.resolve(cloneReq);
    //       }
    //       return e;
    //     });
    //     return dio;
    //   } catch (e, st) {}
    // }

    return super.onError(err, handler);
  }
}
