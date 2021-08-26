
import '../../../../core/configs/constants/api.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/services/api_service.dart';
import '../../domain/entities/top_sellers_entity.dart';
import '../models/top_sellers_model.dart';

abstract class TopSellersDataSource {
  /// Calls the http://143.244.187.211:8000/api/v1/mobile/topsellers/ endpoint.
  ///
  /// Throws a [ServerException] for all error codes.

  Future<List<TopSellersEntity>> getTopSellersData();
}

class TopSellersRemoteDataSourceImpl implements TopSellersDataSource {
  final ApiService _client;

  TopSellersRemoteDataSourceImpl({required ApiService client})
      : _client = client;

  @override
  Future<List<TopSellersEntity>> getTopSellersData() async {
    try {
      final result = await _client.get(k_API_END_POINT_TOP_SELLERS);
      return (result.data as List)
          .map((topSeller) => TopSellersModel.fromMap(topSeller))
          .toList();
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }
}
