import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rogo/core/usecase/usecase.dart';
import 'package:rogo/features/browse/domain/usecases/get_top_sellers.dart';

import '../../domain/entities/top_sellers_entity.dart';
import '../../domain/repositories/top_sellers_repository.dart';

part 'top_sellers_state.dart';

class TopSellersCubit extends Cubit<TopSellersState> {
  final GetTopSellersUsecase _getTopSellersUsecase;

  TopSellersCubit({required GetTopSellersUsecase getTopSellersUsecase})
      : _getTopSellersUsecase = getTopSellersUsecase,
        super(TopSellersState());

  void fetchTopSellers()async {
    final result = await _getTopSellersUsecase(NoParams());
    result.fold((failure) => emit(state.copyWith(errorMessage: failure.message)), (topSellers) => emit(state.copyWith(topSellers: topSellers)));
  }
}
