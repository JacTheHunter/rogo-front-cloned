import 'package:dartz/dartz.dart';
import 'package:rogo/core/error/exceptions.dart';
import 'package:rogo/core/error/failures.dart';
import 'package:rogo/features/add/data/datasources/publications_datasource.dart';
import 'package:rogo/features/add/domain/repositories/publications_repository.dart';

class PublicationsRepositoryImpl extends PublicationsRepository {
  final PublicationsDataSource _dataSource;

  PublicationsRepositoryImpl({required PublicationsDataSource dataSource}) : _dataSource = dataSource;
  Future<Either<Failure, bool>> createLiveSearchPublication({
    required String title,
    required String description,
    required String zip,
    required DateTime startAt,
    required DateTime endAt,
    required String rentalPriceRange,
    required DateTime deadline,
    required int city,
    required List<String> images,
  }) async {
    try {
      await _dataSource.createLiveSearchPublication(
        title: title,
        description: description,
        zip: zip,
        startAt: startAt,
        endAt: endAt,
        rentalPriceRange: rentalPriceRange,
        deadline: deadline,
        city: city,
        images: images,
      );
      return Right(true);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.message));
    }
  }
}
