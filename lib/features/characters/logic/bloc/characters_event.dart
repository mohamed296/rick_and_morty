part of 'characters_bloc.dart';

sealed class CharactersEvent extends Equatable {
  const CharactersEvent();

  @override
  List<Object> get props => [];
}

class GetCharacters extends CharactersEvent {
  const GetCharacters({
    this.page = 1,
    this.status,
    this.gender,
    this.name,
  });

  final int page;
  final String? status;
  final String? gender;
  final String? name;
}


class GetCharacterDetails extends CharactersEvent {
  const GetCharacterDetails(this.id);

  final int id;
}