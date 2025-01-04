import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/di/get_it.dart';
import 'package:rick_and_morty/features/characters/presentation/widgets/character_tile.dart';
import 'package:rick_and_morty/features/favorites/data/database/favorites_db.dart';
import 'package:rick_and_morty/features/favorites/data/model/data_favorite.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesStream = gi<FavoritesDB>().getFavoritesStream();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: StreamBuilder<List<FavoriteData>>(
        stream: favoritesStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final favorites = snapshot.data ?? [];

          if (favorites.isEmpty) {
            return const Center(child: Text('No favorites yet.'));
          }

          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              return CharacterTile(
                  character: favorites[index], isFavorite: true);
            },
          );
        },
      ),
    );
  }
}
