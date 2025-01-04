import 'dart:async';

import 'package:realm/realm.dart';
import 'package:rick_and_morty/core/di/get_it.dart';
import 'package:rick_and_morty/features/characters/data/models/character_model.dart';
import 'package:rick_and_morty/features/favorites/data/model/data_favorite.dart';

class FavoritesDB {
  final Realm realm = gi<Realm>();

  void addFavorite(Character character) {
    final newCharacter = FavoriteData(
      character.id,
      name: character.name,
      status: character.status,
      gender: character.gender,
      image: character.image,
    );

    realm.write(() => realm.add(newCharacter));
  }

  void removeFavorite(int characterId) {
    final character =
        realm.all<FavoriteData>().query('id == $characterId').firstOrNull;
    if (character != null) {
      realm.write(() => realm.delete(character));
    }
  }

  Stream<List<FavoriteData>> getFavoritesStream() {
    final controller = StreamController<List<FavoriteData>>();

    final subscription = realm.all<FavoriteData>().changes.listen((changes) {
      controller.add(changes.results.toList());
    });

    controller.onCancel = () => subscription.cancel();

    return controller.stream;
  }

 
}
