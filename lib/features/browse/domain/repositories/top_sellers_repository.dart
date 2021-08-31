import 'package:dartz/dartz.dart';
import '../entities/paginated_top_sellers.dart';

import '../../../../core/error/failures.dart';

abstract class TopSellersRepository {
  Future<Either<Failure, PaginatedTopSellers>> getTopSellers({
    int? page,
    int? limit,
  });
}
