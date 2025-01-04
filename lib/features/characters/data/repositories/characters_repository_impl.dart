import 'package:dio/dio.dart';
import 'package:rick_and_morty/features/characters/data/data_sources/characters_api.dart';
import 'package:rick_and_morty/features/characters/data/models/character_model.dart';
import 'package:rick_and_morty/features/characters/data/models/characters_response.dart';

class CharactersRepository {
  CharactersRepository({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  Future<(String?, Character?)> getCharacterDetails(int id) async {
    try {
      final response = await _dio.get(
        CharactersApi.characterDetailsUrl(id: id),
      );
      final result = Character.fromJson(response.data);

      return (null, result);
    } on DioException catch (e) {
      return (e.message, null);
    } catch (e) {
      return (e.toString(), null);
    }
  }

  Future<(String?, CharactersResponse?)> getCharacters({
    int page = 1,
    String? status,
    String? gender,
    String? name,
  }) async {
    try {
      final response = await _dio.get(
        CharactersApi.allCharactersUrl,
        queryParameters: {
          'status': status,
          'gender': gender,
          'page': page,
          'name': name,
        },
      );
      final result = CharactersResponse.fromJson(response.data);
      return (null, result);
    } on DioException catch (e) {
      return Future.value((e.message, null));
    } catch (e) {
      return Future.value((e.toString(), null));
    }
  }
}
