part of 'top_sellers_cubit.dart';

@immutable
class TopSellersState {
  final List<TopSeller> topSellers;
  final String errorMessage;
  final bool isLoading;

  TopSellersState({
     this.topSellers = const [],
     this.errorMessage = '',
     this.isLoading = false,
  });

  TopSellersState copyWith({
    List<TopSeller>? topSellers,
    String? errorMessage,
    bool? isLoading,
  }) {
    return TopSellersState(
      topSellers: topSellers ?? this.topSellers,
      errorMessage: errorMessage ?? '',
      isLoading: isLoading ?? false,
    );
  }
}
