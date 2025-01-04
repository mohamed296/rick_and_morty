import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:enhanced_paginated_view/enhanced_paginated_view.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/core/config/routes/routes_names.dart';
import 'package:rick_and_morty/core/di/get_it.dart';
import 'package:rick_and_morty/features/characters/logic/bloc/characters_bloc.dart';
import 'package:rick_and_morty/features/characters/presentation/widgets/character_tile.dart';
import 'package:rick_and_morty/features/characters/presentation/widgets/filter_modal.dart';
import 'package:rick_and_morty/features/characters/presentation/widgets/search_bar.dart';
import 'package:rick_and_morty/features/favorites/data/database/favorites_db.dart';

/// Characters Screen
class CharactersScreen extends HookWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentStatus = useState<String?>(null);
    final currentGender = useState<String?>(null);
    final searchController = useTextEditingController();
    final searchFocusNode = useFocusNode();
    return BlocProvider(
      create: (context) =>
          gi<CharactersBloc>()..add(const GetCharacters(page: 1)),
      child: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Rick and Morty'),
              leading: IconButton(
                icon: const Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  context.pushNamed(RouteNames.favoritesScreen);
                },
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () => _showFilterModal(
                    context,
                    currentStatus,
                    currentGender,
                  ),
                ),
              ],
            ),
            body: StreamBuilder(
                stream: gi<FavoritesDB>().getFavoritesStream(),
                builder: (context, snapshot) {
                  return EnhancedPaginatedView(
                    onLoadMore: (int page) {
                      if (!state.hasReachedMax) {
                        context
                            .read<CharactersBloc>()
                            .add(GetCharacters(page: page));
                      }
                    },
                    hasReachedMax: state.hasReachedMax,
                    itemsPerPage: 20,
                    delegate: EnhancedDelegate(
                      header: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomSearchBar(
                            controller: searchController,
                            focusNode: searchFocusNode,
                            onChange: (value) {
                              context.read<CharactersBloc>().add(
                                    GetCharacters(
                                      page: 1,
                                      name: value,
                                      status: currentStatus.value,
                                      gender: currentGender.value,
                                    ),
                                  );
                            }),
                      ),
                      listOfData: state.characters ?? [],
                      status: _mapStateToEnhancedStatus(state),
                      errorLoadMoreConfig: ErrorLoadMoreConfig(
                        onRetry: (currentPage) {
                          context
                              .read<CharactersBloc>()
                              .add(GetCharacters(page: currentPage + 1));
                        },
                        btnText: "Retry",
                      ),
                      errorPageConfig: ErrorPageConfig(onRetry: () {
                        context.read<CharactersBloc>().add(GetCharacters(
                              page: 1,
                              status: currentStatus.value,
                              gender: currentGender.value,
                              name: searchController.text,
                            ));
                      }),
                      loadingConfig: const LoadingConfig(
                        pageWidget: Center(child: CircularProgressIndicator()),
                        loadMoreWidget: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                    builder: (items, physics, reverse, shrinkWrap) {
                      return ListView.builder(
                        itemCount: items.length,
                        physics: physics,
                        shrinkWrap: shrinkWrap,
                        reverse: reverse,
                        itemBuilder: (context, index) {
                          final character = items[index];
                          final isFavorite = snapshot.data!
                              .map((e) => e.id)
                              .toList()
                              .contains(character.id);
                          return CharacterTile(
                            character: character,
                            isFavorite: isFavorite,
                          );
                        },
                      );
                    },
                  );
                }),
          );
        },
      ),
    );
  }

  EnhancedStatus _mapStateToEnhancedStatus(CharactersState state) {
    if (state.status == CharactersStatus.initial) return EnhancedStatus.loading;
    if (state.status == CharactersStatus.error) return EnhancedStatus.error;
    if (state.status == CharactersStatus.errorPagination) {
      return EnhancedStatus.error;
    }
    return EnhancedStatus.loaded;
  }

  void _showFilterModal(
      BuildContext context,
      ValueNotifier<String?> currentStatus,
      ValueNotifier<String?> currentGender) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (_) {
        return FilterModal(
          initialGender: currentGender.value,
          initialStatus: currentStatus.value,
          onApply: (filters) {
            currentStatus.value = filters['status'];
            currentGender.value = filters['gender'];
            context.read<CharactersBloc>().add(GetCharacters(
                page: 1, status: filters['status'], gender: filters['gender']));
          },
          onClear: () {
            currentStatus.value = null;
            currentGender.value = null;
            context.read<CharactersBloc>().add(const GetCharacters(page: 1));
            context.pop();
          },
        );
      },
    );
  }
}
