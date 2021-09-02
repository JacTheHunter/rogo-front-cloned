import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/paginated_top_sellers.dart';
import '../repositories/top_sellers_repository.dart';

class GetTopSellersUsecase extends UseCase<PaginatedTopSellers, TopSellersParams> {
  final TopSellersRepository _repository;

  GetTopSellersUsecase({required TopSellersRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, PaginatedTopSellers>> call(TopSellersParams params) async {
    return await _repository.getTopSellers(
      page: params.page,
      limit: params.limit,
    );
  }
}

class TopSellersParams extends Equatable {
  final int? page;
  final int? limit;
  TopSellersParams({
    this.page,
    this.limit,
  });

  @override
  List<Object?> get props => [page, limit];
}
