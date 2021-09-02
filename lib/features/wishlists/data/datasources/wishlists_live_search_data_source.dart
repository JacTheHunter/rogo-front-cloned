import 'package:dio/dio.dart';

import '../../../../core/configs/constants/api.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/box_service.dart';
import '../../domain/entities/paginated_wishlists_live_search.dart';
import '../models/paginated_wishlists_live_search_model.dart';

abstract class WishlistsLiveSearchDataSource {
  Future<PaginatedWishlistsLiveSearch> getWishlistsLiveSearch({
    int? page,
    int? limit,
  });
}

class WishlistsLiveSearchDataSourceImpl implements WishlistsLiveSearchDataSource {
  final ApiService _client;

  WishlistsLiveSearchDataSourceImpl({required ApiService client}) : _client = client;

  @override
  Future<PaginatedWishlistsLiveSearch> getWishlistsLiveSearch({int? page, int? limit}) async {
    final jwt = sl<BoxService>().appSettings.get('jwt');
    try {
      final result = await _client.get(k_API_END_POINT_LIVE_SEARCH,
          options: Options(headers: {
            if (jwt != null) 'Authorization': 'jwt ' + jwt,
          }));
      return PaginatedWishlistsLiveSearchModel.fromMap(result.data);
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }
}
