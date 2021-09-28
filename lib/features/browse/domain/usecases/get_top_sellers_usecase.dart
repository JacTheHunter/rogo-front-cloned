import 'package:dartz/dartz.dart';
import 'package:rogo/core/usecase/paginated_response_params.dart';
import '../entities/paginated_top_sellers.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/top_sellers_repository.dart';

class GetTopSellersUsecase extends UseCase<PaginatedTopSellers, PaginatedResponseParams> {
  final TopSellersRepository _repository;

  GetTopSellersUsecase({required TopSellersRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, PaginatedTopSellers>> call(PaginatedResponseParams params) async {
    return await _repository.getTopSellers(
      page: params.page,
      limit: params.limit,
    );
  }
}
