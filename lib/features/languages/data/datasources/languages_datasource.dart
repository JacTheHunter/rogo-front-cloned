import '../../../../core/configs/constants/api.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/services/api_service.dart';
import '../../domain/entities/paginated_languages.dart';
import '../models/paginated_languages_model.dart';

abstract class LanguagesDatasource {
  Future<PaginatedLanguages> getAllLanguages({
    int? page,
    int? limit,
  });
}

class LanguagesDatasourceImpl implements LanguagesDatasource {
  final ApiService _client;

  LanguagesDatasourceImpl({required ApiService client}) : _client = client;

  @override
  Future<PaginatedLanguages> getAllLanguages({
    int? page,
    int? limit,
  }) async {
    try {
      final result = await _client.get(
        k_API_END_POINT_LANGUAGES,
      );
      return PaginatedLanguagesModel.fromMap(result.data);
    } on ServerException catch (exception) {
      throw ServerException(message: exception.message);
    }
  }
}
