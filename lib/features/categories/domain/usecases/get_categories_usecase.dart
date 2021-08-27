import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/category.dart';
import '../repositories/categories_repository.dart';

class GetCategoriesUsecase extends UseCase<List<Category>, NoParams> {
  final CategoriesRepository _repository;

  GetCategoriesUsecase({required CategoriesRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) async {
    return await _repository.getCategories();
  }
}
