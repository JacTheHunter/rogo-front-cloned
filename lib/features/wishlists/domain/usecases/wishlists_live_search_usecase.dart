import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/paginated_wishlists_live_search.dart';
import '../repositories/wishlists_live_search_repository.dart';

class GetWishlistsLiveSearchUsecase extends UseCase<PaginatedWishlistsLiveSearch, WishlistsLiveSearchParams> {
  final WishlistsLiveSearchRepository _wishlistsLiveSearchRepository;

  GetWishlistsLiveSearchUsecase({required WishlistsLiveSearchRepository repository})
      : _wishlistsLiveSearchRepository = repository;

  @override
  Future<Either<Failure, PaginatedWishlistsLiveSearch>> call(WishlistsLiveSearchParams params) async {
    return await _wishlistsLiveSearchRepository.getWishlistsLiveSearch(
      page: params.page,
      limit: params.limit,
    );
  }
}

class WishlistsLiveSearchParams extends Equatable {
  final int? page;
  final int? limit;

  WishlistsLiveSearchParams({
    this.page,
    this.limit,
  });

  @override
  List<Object?> get props => [page, limit];
}
