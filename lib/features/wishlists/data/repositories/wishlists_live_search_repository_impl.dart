import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/paginated_wishlists_live_search.dart';
import '../../domain/repositories/wishlists_live_search_repository.dart';
import '../datasources/wishlists_live_search_data_source.dart';

class WishlistsLiveSearchRepositoryImpl implements WishlistsLiveSearchRepository {
  final WishlistsLiveSearchDataSource _wishlistsLiveSearchDataSource;

  WishlistsLiveSearchRepositoryImpl({required WishlistsLiveSearchDataSource wishlistsLiveSearchDataSource})
      : _wishlistsLiveSearchDataSource = wishlistsLiveSearchDataSource;

  @override
  Future<Either<Failure, PaginatedWishlistsLiveSearch>> getWishlistsLiveSearch({int? page, int? limit}) async {
    try {
      final result = await _wishlistsLiveSearchDataSource.getWishlistsLiveSearch(
        page: page,
        limit: limit,
      );
      return Right(result);
    } on ServerException catch (e) {
      throw Left(ServerException(message: e.message));
    }
  }
}
