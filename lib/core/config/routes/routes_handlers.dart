import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/features/characters/presentation/screens/character_detail_screen.dart';
import 'package:rick_and_morty/features/characters/presentation/screens/characters_screen.dart';
import 'package:rick_and_morty/features/favorites/presentation/screens/favorites_screen.dart';

/// Builds the Characters Screen
Widget charactersScreenHandler(BuildContext context, GoRouterState state) {
  return const CharactersScreen();
}

Widget characterDetailsScreenHandler(
    BuildContext context, GoRouterState state) {
  return CharacterDetailScreen(
    id: state.extra as int,
  );
}

Widget characterFavoriteScreenHandler(
    BuildContext context, GoRouterState state) {
  return const FavoritesScreen();
}
