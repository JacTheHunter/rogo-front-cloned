import 'package:dio/dio.dart';

import '../configs/constants/api.dart';
import '../error/exceptions.dart';
import 'api_interceptors/token_interceptor.dart';

class ApiService {
  late Dio _dio;

  ApiService() {
    BaseOptions baseOptions = BaseOptions(
      connectTimeout: 60 * 1000, // 60 seconds
      receiveTimeout: 60 * 1000,
      baseUrl: k_API_END_POINT_BASE,
      maxRedirects: 2,
    );
    _dio = Dio(baseOptions);
    // adding logging interceptor.
    _dio.interceptors.add(LogInterceptor(
        requestBody: true, error: true, request: true, requestHeader: true, responseBody: true, responseHeader: true));
  }

  // for HTTP.GET Request.
  Future<Response> get(String url, {Map<String, String>? params, bool isSecure = true}) async {
    Response response;
    if (isSecure) _dio.interceptors.add(TokenInterceptor());
    try {
      response = await _dio.get(
        url,
        queryParameters: params,
      );
    } on DioError catch (exception) {
      if (exception.response?.data != null && exception.response?.data['message'] != null) {
        throw ServerException(message: exception.response?.data['message']);
      } else {
        throw ServerException(message: exception.error ?? 'Error');
      }
    }
    return response;
  }

  // for HTTP.POST Request.
  Future<Response> post(String url, {dynamic data, Map<String, String>? params, bool isSecure = true}) async {
    Response response;
    if (isSecure) _dio.interceptors.add(TokenInterceptor());
    try {
      response = await _dio.post(
        url,
        data: data,
        queryParameters: params,
      );
    } on DioError catch (exception) {
      if (exception.response?.data != null &&
          (exception.response?.data['message'] != null || exception.response?.data['detail'] != null)) {
        throw ServerException(message: exception.response?.data['message'] ?? exception.response?.data['detail']);
      } else {
        throw ServerException(message: exception.error);
      }
    }
    return response;
  }

  // for HTTP.PATCH Request.
  Future<Response> patch(String url, {Map<String, String>? params, bool isSecure = true}) async {
    Response response;
    if (isSecure) _dio.interceptors.add(TokenInterceptor());

    try {
      response = await _dio.patch(
        url,
        data: params,
      );
    } on DioError catch (exception) {
      if (exception.response?.data != null && exception.response?.data['message'] != null) {
        throw ServerException(message: exception.response?.data['message']);
      } else {
        throw ServerException(message: exception.error);
      }
    }
    return response;
  }
}
