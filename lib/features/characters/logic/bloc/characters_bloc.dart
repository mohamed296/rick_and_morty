import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/features/characters/data/models/character_model.dart';
import 'package:rick_and_morty/features/characters/data/repositories/characters_repository_impl.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc(this.repository) : super(const CharactersState()) {
    on<GetCharacters>(
        (event, emit) async => _onGetCharactersEvent(event, emit));
    on<GetCharacterDetails>(
        (event, emit) async => _getCharacterDetails(event, emit));
  }

  final CharactersRepository repository;
  List<Character> _results = [];
  bool _hasReachedMax = false;

  Future<void> _onGetCharactersEvent(
      GetCharacters event, Emitter<CharactersState> emit) async {
    if (event.page == 1) {
      emit(state.copyWith(status: CharactersStatus.initial));
    } else {
      emit(state.copyWith(status: CharactersStatus.loading));
    }

    final (error, result) = await repository.getCharacters(
      status: event.status,
      gender: event.gender,
      page: event.page,
      name: event.name,
    );

    if (error != null) {
      emit(state.copyWith(
          status: event.page == 1
              ? CharactersStatus.error
              : CharactersStatus.errorPagination,
          error: error));
    } else {
      _hasReachedMax = result!.info.next == null;
      if (event.page == 1) {
        _results = result.results;
      } else {
        _results.addAll(result.results);
      }

      emit(state.copyWith(
          status: CharactersStatus.loaded,
          characters: List.from(_results),
          hasReachedMax: _hasReachedMax));
    }
  }

  Future<void> _getCharacterDetails(
      GetCharacterDetails event, Emitter<CharactersState> emit) async {
    emit(state.copyWith(status: CharactersStatus.initial));

    final (error, result) = await repository.getCharacterDetails(event.id);

    if (error != null) {
      emit(state.copyWith(status: CharactersStatus.error, error: error));
    } else {
      emit(state.copyWith(
        status: CharactersStatus.loaded,
        character: result,
      ));
    }
  }
}
