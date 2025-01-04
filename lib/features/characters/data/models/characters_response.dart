import 'package:rick_and_morty/features/characters/data/models/character_model.dart';

import 'pagination_model.dart';

class CharactersResponse {
  final PaginationInfo info;
  final List<Character> results;

  CharactersResponse({
    required this.info,
    required this.results,
  });

  factory CharactersResponse.fromJson(Map<String, dynamic> json) {
    return CharactersResponse(
      info: PaginationInfo.fromJson(json['info']),
      results: (json['results'] as List)
          .map((character) => Character.fromJson(character))
          .toList(),
    );
  }
}
