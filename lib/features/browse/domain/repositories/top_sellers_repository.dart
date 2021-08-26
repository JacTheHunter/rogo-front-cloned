import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/top_sellers_entity.dart';

abstract class TopSellersRepository {
  Future<Either<Failure, List<TopSellersEntity>>> getTopSellers();
}
