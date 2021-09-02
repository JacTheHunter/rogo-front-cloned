import '../../../../core/configs/constants/api.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/services/api_service.dart';
import '../../domain/entities/paginated_top_sellers.dart';
import '../models/paginated_top_sellers_model.dart';

abstract class TopSellersDataSource {
  Future<PaginatedTopSellers> getTopSellers({
    int? page,
    int? limit,
  });
}

class TopSellersDataSourceImpl implements TopSellersDataSource {
  final ApiService _client;

  TopSellersDataSourceImpl({required ApiService client}) : _client = client;

  @override
  Future<PaginatedTopSellers> getTopSellers({
    int? page,
    int? limit,
  }) async {
    try {
      final result = await _client.get(k_API_END_POINT_TOP_SELLERS);
      return PaginatedTopSellersModel.fromMap(result.data);
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }
}
