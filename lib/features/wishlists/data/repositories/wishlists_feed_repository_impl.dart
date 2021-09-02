import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/paginated_wishlists_feed.dart';
import '../../domain/repositories/wishlists_feed_repository.dart';
import '../datasources/wishlists_feed_data_source.dart';

class WishlistsFeedRepositoryImpl implements WishlistsFeedRepository {
  final WishlistsFeedDataSource _wishlistsFeedDataSource;

  WishlistsFeedRepositoryImpl({required WishlistsFeedDataSource wishlistsFeedDataSource})
      : _wishlistsFeedDataSource = wishlistsFeedDataSource;

  @override
  Future<Either<Failure, PaginatedWishlistsFeed>> getWishlistsFeed({int? page, int? limit}) async {
    try {
      final result = await _wishlistsFeedDataSource.getWishlistsFeed(
        page: page,
        limit: limit,
      );
      return Right(result);
    } on ServerException catch (e) {
      throw Left(ServerFailure(message: e.message));
    }
  }
}
