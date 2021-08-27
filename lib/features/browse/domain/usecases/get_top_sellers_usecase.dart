import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/top_seller.dart';
import '../repositories/top_sellers_repository.dart';

class GetTopSellersUsecase extends UseCase<List<TopSeller>, NoParams> {
  final TopSellersRepository _repository;

  GetTopSellersUsecase({required TopSellersRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, List<TopSeller>>> call(NoParams params) async {
    return await _repository.getTopSellers();
  }
}
