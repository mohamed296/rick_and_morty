part of 'characters_bloc.dart';

 class CharactersState extends Equatable {
  const CharactersState({
    this.status = CharactersStatus.initial,
    this.characters,
    this.character,
    this.error,
    this.hasReachedMax = false,
  });

  final CharactersStatus status;
  final List<Character>? characters;
  final Character? character;
  final String? error;
  final bool hasReachedMax;

  CharactersState copyWith({
    CharactersStatus? status,
    List<Character>? characters,
    Character? character,
    String? error,
    bool? hasReachedMax,
  }) {
    return CharactersState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
      character: character ?? this.character,
      error: error ?? this.error,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    

    );
  }

  @override
  List<Object> get props => [
        status,
        characters ?? [],
        character ?? [],
        error ?? '',
        hasReachedMax,
      ];
}

enum CharactersStatus {
  initial,
  loading,
  loaded,
  error,
  errorPagination,
}
