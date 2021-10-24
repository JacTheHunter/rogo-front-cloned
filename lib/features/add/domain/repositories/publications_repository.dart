import 'package:dartz/dartz.dart';
import 'package:rogo/core/error/failures.dart';

abstract class PublicationsRepository {
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
  });
}
