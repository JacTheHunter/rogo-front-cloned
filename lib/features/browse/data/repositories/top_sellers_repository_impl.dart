import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/top_sellers_entity.dart';
import '../../domain/repositories/top_sellers_repository.dart';
import '../datasources/top_selleres_data_source.dart';

class TopSellersRepositoryImpl implements TopSellersRepository {
  final TopSellersDataSource _topSellersDataSource;

  TopSellersRepositoryImpl(
      {required TopSellersDataSource topSellersDataSource})
      : _topSellersDataSource = topSellersDataSource;

  @override
  Future<Either<Failure, List<TopSellersEntity>>> getTopSellers() async {
    try {
      final result = await _topSellersDataSource.getTopSellersData();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
