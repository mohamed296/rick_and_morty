import 'package:realm/realm.dart';

part 'data_favorite.realm.dart';

@RealmModel()
class _FavoriteData {
  @PrimaryKey()
  late int id;
  late String? name;
  late String? status;
  late String? gender;
  late String? image;
}
