import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:urbe_solution/clean/data/providers/data_base/i_data_base_provider.dart';

class DataBaseProvider extends IDataBaseProvider {
  final Database db;
  final String character = 'Character';
  final String bodyData = 'BodyData';
  final String planets = 'Planets';
  final String transport = 'Transport';
  final String characterPlanet = 'CharacterPlanet';
  final String characterTransport = 'CharacterTransport';
  DataBaseProvider({required this.db});

  @override
  Future<bool> createDataBase() async {
    await db.transaction((txn) async {
      await txn.execute(
          'CREATE TABLE Character (character_id TEXT PRIMARY KEY, name TEXT, age INTEGER, gender INTEGER)');
      await txn.execute('CREATE TABLE BodyData (character_id TEXT PRIMARY KEY, '
          'height TEXT, eyes_color TEXT, hair_color TEXT, skin_color TEXT, '
          'FOREIGN KEY (character_id) REFERENCES Character (character_id) ON DELETE NO ACTION ON UPDATE NO ACTION'
          ')');
      await txn.execute(
          'CREATE TABLE Planets (planet_id TEXT PRIMARY KEY, name TEXT)');
      await txn.execute(''
          'CREATE TABLE Transport (transport_id TEXT PRIMARY KEY, name TEXT, type TEXT)');
      await txn.execute(
          'CREATE TABLE CharacterPlanet ( planet_id TEXT, character_id TEXT,'
          'PRIMARY KEY (planet_id, character_id)'
          ')');
      await txn.execute(
          'CREATE TABLE CharacterTransport ( transport_id TEXT, character_id TEXT , '
          'PRIMARY KEY (transport_id, character_id)'
          ')');
    });
    return true;
  }

  @override
  Future<bool> addCharacter(String name) async {
    await db.transaction((txn) async {
      txn.batch().insert(character, {'character_id': name});
    });
    return true;
  }

  @override
  Future<List<Map>> getCharacters() async {
    final result = await db.rawQuery('SELECT * FROM Character');
    log('${result[0]['character_id']}');
    return [];
  }
}
