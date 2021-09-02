import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/paginated_wishlists_live_search.dart';

abstract class WishlistsLiveSearchRepository {
  Future<Either<Failure, PaginatedWishlistsLiveSearch>> getWishlistsLiveSearch({
    int? page,
    int? limit,
  });
}
