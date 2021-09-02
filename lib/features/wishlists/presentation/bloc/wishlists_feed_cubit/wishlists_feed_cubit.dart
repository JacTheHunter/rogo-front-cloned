import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/wishlists_feed.dart';
import '../../../domain/usecases/wishlists_feed_usecase.dart';

part 'wishlists_feed_state.dart';

class WishlistsFeedCubit extends Cubit<WishlistsFeedState> {
  final GetWishlistsFeedUsecase _getWishlistsFeedUsecase;

  WishlistsFeedCubit({required GetWishlistsFeedUsecase getWishlistsFeedUsecase})
      : _getWishlistsFeedUsecase = getWishlistsFeedUsecase,
        super(WishlistsFeedState());

  void fetchWishlistsFeed() async {
    emit(state.copyWith(isLoading: true));
    final result = await _getWishlistsFeedUsecase(WishlistsFeedParams());
    result.fold(
      (failure) => emit(state.copyWith(errorMessage: failure.message)),
      (wishlistsFeed) => emit(state.copyWith(wishlistsFeed: wishlistsFeed.results)),
    );
  }
}
