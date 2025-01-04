// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_favorite.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class FavoriteData extends _FavoriteData
    with RealmEntity, RealmObjectBase, RealmObject {
  FavoriteData(
    int id, {
    String? name,
    String? status,
    String? gender,
    String? image,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'status', status);
    RealmObjectBase.set(this, 'gender', gender);
    RealmObjectBase.set(this, 'image', image);
  }

  FavoriteData._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String? get name => RealmObjectBase.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObjectBase.set(this, 'name', value);

  @override
  String? get status => RealmObjectBase.get<String>(this, 'status') as String?;
  @override
  set status(String? value) => RealmObjectBase.set(this, 'status', value);

  @override
  String? get gender => RealmObjectBase.get<String>(this, 'gender') as String?;
  @override
  set gender(String? value) => RealmObjectBase.set(this, 'gender', value);

  @override
  String? get image => RealmObjectBase.get<String>(this, 'image') as String?;
  @override
  set image(String? value) => RealmObjectBase.set(this, 'image', value);

  @override
  Stream<RealmObjectChanges<FavoriteData>> get changes =>
      RealmObjectBase.getChanges<FavoriteData>(this);

  @override
  Stream<RealmObjectChanges<FavoriteData>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<FavoriteData>(this, keyPaths);

  @override
  FavoriteData freeze() => RealmObjectBase.freezeObject<FavoriteData>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'name': name.toEJson(),
      'status': status.toEJson(),
      'gender': gender.toEJson(),
      'image': image.toEJson(),
    };
  }

  static EJsonValue _toEJson(FavoriteData value) => value.toEJson();
  static FavoriteData _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
      } =>
        FavoriteData(
          fromEJson(id),
          name: fromEJson(ejson['name']),
          status: fromEJson(ejson['status']),
          gender: fromEJson(ejson['gender']),
          image: fromEJson(ejson['image']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(FavoriteData._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, FavoriteData, 'FavoriteData', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string, optional: true),
      SchemaProperty('status', RealmPropertyType.string, optional: true),
      SchemaProperty('gender', RealmPropertyType.string, optional: true),
      SchemaProperty('image', RealmPropertyType.string, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
