import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:realm/realm.dart';
import 'package:rick_and_morty/core/network/dio_helper.dart';
import 'package:rick_and_morty/features/characters/data/repositories/characters_repository_impl.dart';
import 'package:rick_and_morty/features/characters/logic/bloc/characters_bloc.dart';
import 'package:rick_and_morty/features/favorites/data/model/data_favorite.dart';
import 'package:rick_and_morty/features/favorites/data/database/favorites_db.dart';

/// GetIt is a simple service locator for Dart and Flutter projects. [GetIt]
final gi = GetIt.instance;

/// init GetIt
Future<void> initGi() async {
  final appDocumentsDirectory = await getApplicationDocumentsDirectory();
  final config = Configuration.local([
    FavoriteData.schema,
  ], path: '${appDocumentsDirectory.path}/default2.realm');
  final realm = Realm(config);

  gi

    //bloc
    ..registerFactory<CharactersBloc>(() => CharactersBloc(gi()))

    // repositories
    ..registerLazySingleton<CharactersRepository>(
        () => CharactersRepository(dio: gi()))

    // data ( local + remote) repositories Objects
    ..registerLazySingleton<Realm>(() => realm)
    ..registerLazySingleton<Dio>(DioHelper().init)

    //realm Mangers
    ..registerLazySingleton<FavoritesDB>(FavoritesDB.new);
}
