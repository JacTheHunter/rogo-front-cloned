import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/category.dart';
import '../../domain/repositories/categories_repository.dart';
import '../datasources/categories_data_source.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesDataSource _categoriesDataSource;

  CategoriesRepositoryImpl({required CategoriesDataSource dataSource}) : _categoriesDataSource = dataSource;

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final result = await _categoriesDataSource.getCategories();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
