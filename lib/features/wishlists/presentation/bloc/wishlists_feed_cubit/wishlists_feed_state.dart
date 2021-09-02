part of 'wishlists_feed_cubit.dart';

@immutable
class WishlistsFeedState {
  final List<WishlistsFeed> wishlistsFeed;
  final String errorMessage;
  final bool isLoading;

  WishlistsFeedState({
    this.wishlistsFeed = const [],
    this.errorMessage = '',
    this.isLoading = false,
  });

  WishlistsFeedState copyWith({
    List<WishlistsFeed>? wishlistsFeed,
    String? errorMessage,
    bool? isLoading,
  }) {
    return WishlistsFeedState(
      wishlistsFeed: wishlistsFeed ?? this.wishlistsFeed,
      errorMessage: errorMessage ?? '',
      isLoading: isLoading ?? false,
    );
  }
}
