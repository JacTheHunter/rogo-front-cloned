import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/paginated_wishlists_feed.dart';

abstract class WishlistsFeedRepository {
  Future<Either<Failure, PaginatedWishlistsFeed>> getWishlistsFeed({
    int? page,
    int? limit,
  });
}
