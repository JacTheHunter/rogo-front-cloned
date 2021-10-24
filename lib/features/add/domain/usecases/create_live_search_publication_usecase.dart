import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rogo/features/add/domain/repositories/publications_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

class CreateLiveSearchPublicationUseCase extends UseCase<bool, CreateLiveSearchParams> {
  final PublicationsRepository _repository;

  CreateLiveSearchPublicationUseCase({required PublicationsRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(CreateLiveSearchParams params) async {
    return await _repository.createLiveSearchPublication(
      title: params.title,
      description: params.description,
      zip: params.zip,
      startAt: params.startAt,
      endAt: params.endAt,
      rentalPriceRange: params.rentalPriceRange,
      deadline: params.deadline,
      city: params.city,
      images: params.images,
    );
  }
}

class CreateLiveSearchParams extends Equatable {
  final String title;
  final String description;
  final String zip;
  final DateTime startAt;
  final DateTime endAt;
  final String rentalPriceRange;
  final DateTime deadline;
  final int city;
  final List<String> images;
  CreateLiveSearchParams({
    required this.title,
    required this.description,
    required this.zip,
    required this.startAt,
    required this.endAt,
    required this.rentalPriceRange,
    required this.deadline,
    required this.city,
    required this.images,
  });

  @override
  List<Object> get props {
    return [
      title,
      description,
      zip,
      startAt,
      endAt,
      rentalPriceRange,
      deadline,
      city,
      images,
    ];
  }

//   title -> text/required: "string",
// description -> text/required: "string",
// zip -> text/required : "string",
// start_at -> date/required : start date
// end_at -> date/required :end date
// rental_price_range -> text/required: "1233-1235",
// deadline -> int/required: 12,
// city -> text/required: city id,
// cover_photos -> image list/required
}
