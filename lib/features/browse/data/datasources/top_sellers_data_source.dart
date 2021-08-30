import '../../../../core/configs/constants/api.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/services/api_service.dart';
import '../../domain/entities/top_seller.dart';
import '../models/top_sellers_model.dart';

abstract class TopSellersDataSource {
  /// Calls the http://143.244.187.211:8000/api/v1/mobile/topsellers/ endpoint.
  ///
  /// Throws a [ServerException] for all error codes.

  Future<List<TopSeller>> getTopSellers();
}

class TopSellersDataSourceImpl implements TopSellersDataSource {
  final ApiService _client;

  TopSellersDataSourceImpl({required ApiService client}) : _client = client;

  @override
  Future<List<TopSeller>> getTopSellers() async {
    try {
      final result = await _client.get(k_API_END_POINT_TOP_SELLERS);
      return (result.data as List).map((topSeller) => TopSellerModel.fromMap(topSeller)).toList();
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }
}
