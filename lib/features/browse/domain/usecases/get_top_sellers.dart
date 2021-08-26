import 'package:rogo/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:rogo/core/usecase/usecase.dart';
import 'package:rogo/features/browse/domain/entities/top_sellers_entity.dart';
import 'package:rogo/features/browse/domain/repositories/top_sellers_repository.dart';

class GetTopSellersUsecase extends UseCase<List<TopSellersEntity>, NoParams> {
  final TopSellersRepository _repository;

  GetTopSellersUsecase({required TopSellersRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, List<TopSellersEntity>>> call(NoParams params) async {
    return await _repository.getTopSellers();
  }
}
