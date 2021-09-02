import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/wishlists_live_search.dart';
import '../../../domain/usecases/wishlists_live_search_usecase.dart';

part 'wishlists_live_search_state.dart';

class WishlistsLiveSearchCubit extends Cubit<WishlistsLiveSearchState> {
  final GetWishlistsLiveSearchUsecase _getWishlistsLiveSearchUsecase;

  WishlistsLiveSearchCubit({required GetWishlistsLiveSearchUsecase getWishlistsLiveSearchUsecase})
      : _getWishlistsLiveSearchUsecase = getWishlistsLiveSearchUsecase,
        super(WishlistsLiveSearchState());

  void fetchWishlistsLiveSearch() async {
    emit(state.copyWith(isLoading: true));
    final result = await _getWishlistsLiveSearchUsecase(WishlistsLiveSearchParams());
    result.fold(
      (failure) => emit(state.copyWith(errorMessage: failure.message)),
      (wishlistsLiveSearch) => emit(state.copyWith(wishlistsLiveSearch: wishlistsLiveSearch.results)),
    );
  }
}
