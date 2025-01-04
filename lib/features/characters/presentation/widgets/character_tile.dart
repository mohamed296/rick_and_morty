import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/core/config/routes/routes_names.dart';
import 'package:rick_and_morty/core/di/get_it.dart';
import 'package:rick_and_morty/features/favorites/data/database/favorites_db.dart';

class CharacterTile extends StatelessWidget {
  final character;
  final bool isFavorite;

  const CharacterTile({
    super.key,
    required this.character,
    required this.isFavorite,
  });

  void toggleFavorite() {
    if (isFavorite) {
      gi<FavoritesDB>().removeFavorite(character.id);
    } else {
      gi<FavoritesDB>().addFavorite(character);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                            onTap: () {
                              context.pushNamed(
                                RouteNames.detailsScreen,
                                extra: character.id,
                              );
                            },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.black.withOpacity(0.4),
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      character.image,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          character.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                fontSize: 18.0,
                              ),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          'Gender: ${character.gender}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          children: [
                            Icon(
                              character.status == "Alive"
                                  ? Icons.circle
                                  : character.status == "Dead"
                                      ? Icons.cancel
                                      : Icons.help_outline,
                              size: 14,
                              color: character.status == "Alive"
                                  ? Colors.green
                                  : character.status == "Dead"
                                      ? Colors.red
                                      : Colors.grey,
                            ),
                            const SizedBox(width: 6.0),
                            Text(
                              '${character.status}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 5,
              bottom: 2,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: toggleFavorite,
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
