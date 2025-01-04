/// API Constants
class CharactersApi {
  /// All Characters url
  static String get allCharactersUrl => '/character';

  /// Character details url
  static String characterDetailsUrl({required int id}) => '/character/$id';
}
