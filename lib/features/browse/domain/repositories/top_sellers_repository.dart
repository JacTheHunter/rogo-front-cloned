import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/paginated_top_sellers.dart';

abstract class TopSellersRepository {
  Future<Either<Failure, PaginatedTopSellers>> getTopSellers({
    int? page,
    int? limit,
  });
}
