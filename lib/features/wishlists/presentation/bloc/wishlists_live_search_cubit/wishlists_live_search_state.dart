part of 'wishlists_live_search_cubit.dart';

@immutable
class WishlistsLiveSearchState {
  final List<WishlistsLiveSearch> wishlistsLiveSearch;
  final String errorMessage;
  final bool isLoading;

  WishlistsLiveSearchState({
    this.wishlistsLiveSearch = const [],
    this.errorMessage = '',
    this.isLoading = false,
  });

  WishlistsLiveSearchState copyWith({
    List<WishlistsLiveSearch>? wishlistsLiveSearch,
    String? errorMessage,
    bool? isLoading,
  }) {
    return WishlistsLiveSearchState(
      wishlistsLiveSearch: wishlistsLiveSearch ?? this.wishlistsLiveSearch,
      errorMessage: errorMessage ?? '',
      isLoading: isLoading ?? false,
    );
  }
}
