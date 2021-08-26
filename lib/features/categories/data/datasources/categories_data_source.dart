import 'package:dio/dio.dart';
import 'package:rogo/core/injection/injection_container.dart';
import 'package:rogo/core/services/box_service.dart';

import '../../../../core/configs/constants/api.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/services/api_service.dart';
import '../../domain/entities/category.dart';
import '../models/category_model.dart';

abstract class CategoriesDataSource {
  Future<List<Category>> getCategories();
}

class CategoriesDataSourceImpl implements CategoriesDataSource {
  final ApiService _client;

  CategoriesDataSourceImpl({required ApiService client}) : _client = client;

  @override
  Future<List<Category>> getCategories() async {
    final jwt = sl<BoxService>().appSettings.get('jwt');
    try {
      final result = await _client.get(k_API_END_POINT_CATEGORIES,
          options: Options(
            headers: {
              if (jwt != null) 'Authorization': 'jwt ' + jwt,
            },
          ));
      return (result.data as List).map((category) => CategoryModel.fromMap(category)).toList();
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }
}
