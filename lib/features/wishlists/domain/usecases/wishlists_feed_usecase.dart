import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/paginated_wishlists_feed.dart';
import '../repositories/wishlists_feed_repository.dart';

class GetWishlistsFeedUsecase extends UseCase<PaginatedWishlistsFeed, WishlistsFeedParams> {
  final WishlistsFeedRepository _wishlistsFeedRepository;

  GetWishlistsFeedUsecase({required WishlistsFeedRepository repository}) : _wishlistsFeedRepository = repository;

  @override
  Future<Either<Failure, PaginatedWishlistsFeed>> call(WishlistsFeedParams params) async {
    return await _wishlistsFeedRepository.getWishlistsFeed(
      page: params.page,
      limit: params.limit,
    );
  }
}

class WishlistsFeedParams extends Equatable {
  final int? page;
  final int? limit;

  WishlistsFeedParams({
    this.page,
    this.limit,
  });

  @override
  List<Object?> get props => [page, limit];
}
