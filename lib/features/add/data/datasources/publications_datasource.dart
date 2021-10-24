import 'package:dio/dio.dart';
import 'package:rogo/core/configs/constants/api.dart';
import 'package:rogo/core/error/exceptions.dart';
import 'package:rogo/core/services/api_service.dart';

abstract class PublicationsDataSource {
  Future<void> createLiveSearchPublication({
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

class PublicationsDataSourceImpl extends PublicationsDataSource {
  final ApiService _client;

  PublicationsDataSourceImpl({required ApiService client}) : _client = client;
  @override
  Future<void> createLiveSearchPublication({
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
      FormData data = FormData.fromMap({
        'title': title,
        'description': description,
        'zip': zip,
        'rental_price_range': rentalPriceRange,
        'start_at': startAt,
        'end_at': endAt,
        'deadline': deadline,
        'city': city,
        //'files': images.map((i) async => await MultipartFile.fromFile(i)).toList()
      });

      // List<MultipartFile> files = [];

      // images.forEach((element) async {
      //   files.add(await MultipartFile.fromFile(element));
      // });

      data.files.addAll(images.map((i) => MapEntry('files', MultipartFile.fromFileSync(i))));

      _client.post(k_API_END_POINT_LIVE_SEARCH, data: data);
    } on ServerException catch (exception) {
      throw ServerException(message: exception.message);
    }
  }
}
