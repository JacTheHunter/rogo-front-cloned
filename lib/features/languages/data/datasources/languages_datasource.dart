import '../../../../core/configs/constants/api.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/services/api_service.dart';
import '../../domain/entities/language.dart';
import '../models/language_model.dart';

abstract class LanguagesDatasource {
  Future<List<Language>> getAllLanguages();
}

class LanguagesDatasourceImpl implements LanguagesDatasource {
  final ApiService _client;

  LanguagesDatasourceImpl({required ApiService client}) : _client = client;

  @override
  Future<List<Language>> getAllLanguages() async {
    try {
      final result = await _client.get(
        k_API_END_POINT_LANGUAGES,
      );
      return (result.data as List).map((c) => LanguageModel.fromMap(c)).toList();
    } on ServerException catch (exception) {
      throw ServerException(message: exception.message);
    }
  }
}
