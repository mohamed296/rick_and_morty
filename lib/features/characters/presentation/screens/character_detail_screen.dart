import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/di/get_it.dart';
import 'package:rick_and_morty/features/characters/logic/bloc/characters_bloc.dart';
import 'package:rick_and_morty/features/characters/presentation/widgets/character_image.dart';
import 'package:rick_and_morty/features/characters/presentation/widgets/character_info_section.dart';
import 'package:rick_and_morty/features/characters/presentation/widgets/episodes_list.dart';

class CharacterDetailScreen extends StatelessWidget {
  final int id;

  const CharacterDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character Details'),
      ),
      body: BlocProvider(
        create: (context) => gi<CharactersBloc>()..add(GetCharacterDetails(id)),
        child: BlocBuilder<CharactersBloc, CharactersState>(
          builder: (context, state) {
            if (state.status == CharactersStatus.initial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.status == CharactersStatus.error) {
              return Center(
                child: Text(
                  state.error ?? 'An error occurred',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
            }
            if (state.status == CharactersStatus.loaded) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CharacterImage(imageUrl: state.character!.image),
                    const SizedBox(height: 16.0),
                    Center(
                      child: Text(
                        state.character!.name,
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    CharacterInfoSection(character: state.character!),
                    const SizedBox(height: 16.0),
                    EpisodesList(episodes: state.character!.episodes),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
