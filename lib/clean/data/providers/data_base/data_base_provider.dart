import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:urbe_solution/clean/data/providers/data_base/i_data_base_provider.dart';
import 'package:urbe_solution/clean/data/providers/data_base/models/request/set_characters_request.dart';
import 'package:urbe_solution/clean/data/providers/data_base/models/response/get_consolidated_characters.dart';
import 'package:urbe_solution/clean/data/providers/data_base/models/database_testing.dart';

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
          'CREATE TABLE CharacterPlanet ( planet_id TEXT,  character_id TEXT  ,'
          'PRIMARY KEY (planet_id, character_id)'
          'UNIQUE(character_id)'
          ')');
      await txn.execute(
          'CREATE TABLE CharacterTransport ( transport_id TEXT, character_id TEXT , '
          'PRIMARY KEY (transport_id, character_id)'
          ')');
    });
    return true;
  }

  @override
  Future<bool> addCharacter(SetCharactersRequest setCharactersRequest) async {
    try {
      await db.transaction((txn) async {
        final batch = txn.batch();
        final invaders = setCharactersRequest.toJson();

        for (var char in invaders['characters']) {
          batch.insert(character, char['character']);
          batch.insert(characterPlanet, char['characterPlanet']);
          batch.insert(bodyData, char['bodyData']);
          for (var transports in char['characterTransports']) {
            batch.insert(characterTransport, transports);
          }
        }

        await batch.commit();
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<GetConsolidatedCharacters> getConsolidatedCharacters() async {
    Map<String, dynamic> characters = {};

    final profiles = await _getCharacterWithProfile();

    characters['characters'] = profiles;
    final mutableCharacterList = [];
    for (var char in characters['characters']) {
      mutableCharacterList.add(Map<String, dynamic>.from(char));
    }
    characters['characters'] = mutableCharacterList;

    for (var char in characters['characters']) {
      final transports = await _getCharacterTransport(char['character_id']);
      char['transports'] = transports;
    }

    log('$characters');
    return GetConsolidatedCharacters(characters: {});
  }

  Future<List<Map<String, dynamic>>> _getCharacterWithProfile() async {
    try {
      final characterProfile = await db.rawQuery(
          'SELECT $character.character_id, $character.name, $character.age, $character.gender, $bodyData.height, '
          '$bodyData.eyes_color, $bodyData.hair_color, $bodyData.skin_color, $bodyData.skin_color, $planets.name as planet_name'
          ' FROM Character, BodyData, CharacterPlanet, Planets WHERE'
          '($character.character_id = $bodyData.character_id) AND ($characterPlanet.character_id = $character.character_id)'
          ' AND ($characterPlanet.planet_id = $planets.planet_id) '
          'ORDER BY $character.name');

      return characterProfile;
    } catch (e) {
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> _getCharacterTransport(
      String characterId) async {
    try {
      final charactersTransport = await db.rawQuery(
          'SELECT $transport.name,$transport.type '
          ' FROM Character, Transport, CharacterTransport WHERE'
          '( $characterTransport.character_id = ? AND $characterTransport.transport_id = $transport.transport_id ) '
          ' GROUP BY $transport.name  ORDER BY $character.character_id',
          [characterId]);

      return charactersTransport;
    } catch (e) {
      return [];
    }
  }
}
