import 'package:dartz/dartz.dart';
import '../../domain/entities/paginated_top_sellers.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/top_sellers_repository.dart';
import '../datasources/top_sellers_data_source.dart';

class TopSellersRepositoryImpl implements TopSellersRepository {
  final TopSellersDataSource _topSellersDataSource;

  TopSellersRepositoryImpl({required TopSellersDataSource topSellersDataSource})
      : _topSellersDataSource = topSellersDataSource;

  @override
  Future<Either<Failure, PaginatedTopSellers>> getTopSellers({
    int? page,
    int? limit,
  }) async {
    try {
      final result = await _topSellersDataSource.getTopSellers(
        page: page,
        limit: limit,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
