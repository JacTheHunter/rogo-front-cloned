import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/top_seller.dart';

abstract class TopSellersRepository {
  Future<Either<Failure, List<TopSeller>>> getTopSellers();
}
