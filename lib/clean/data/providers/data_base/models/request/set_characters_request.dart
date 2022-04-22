import 'package:equatable/equatable.dart';
import 'package:urbe_solution/clean/data/providers/data_base/models/request/set_transports_request.dart';

class SetCharactersRequest extends Equatable {
  final List<CharactersDB> characters;

  const SetCharactersRequest({required this.characters});
  factory SetCharactersRequest.fromJson(Map<String, dynamic> data) {
    final chars = data['results'];
    final charsList = <CharactersDB>[];
    final vehicles = <String>[];
    for (var ch in chars) {
      charsList.add(CharactersDB(
        id: ch['url'],
        name: ch['name'],
        eyesColor: ch['eye_color'],
        hairColor: ch['hair_color'],
        height: ch['height'],
        skinColor: ch['skin_color'],
        gender: ch['gender'],
        fromPlanetId: ch['homeworld'],
        bornYear: ch['birth_year'],
        vehiclesId: List<String>.from(ch['vehicles'] as List),
        starShipsId: List<String>.from(ch['starships'] as List),
      ));
    }
    return SetCharactersRequest(characters: charsList);
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['characters'] = characters.map((e) => e.toJson()).toList();
    return data;
  }

  @override
  List<Object?> get props => [characters];
}

class CharactersDB extends Equatable {
  final String id;
  final String name;
  final String eyesColor;
  final String hairColor;
  final String height;
  final String skinColor;
  final String gender;
  final String fromPlanetId;
  final List<String> vehiclesId;
  final List<String> starShipsId;
  final String bornYear;

  const CharactersDB(
      {required this.id,
      required this.name,
      required this.eyesColor,
      required this.hairColor,
      required this.height,
      required this.skinColor,
      required this.gender,
      required this.fromPlanetId,
      required this.bornYear,
      required this.vehiclesId,
      required this.starShipsId});

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['character'] = {
      'character_id': id,
      'name': name,
      'age': bornYear,
      'gender': gender
    };
    data['bodyData'] = {
      'character_id': id,
      'height': height,
      'eyes_color': eyesColor,
      'hair_color': hairColor,
      'skin_color': skinColor
    };
    data['characterPlanet'] = {
      'character_id': id,
      'planet_id': fromPlanetId,
    };
    final List<Map<String, dynamic>> transports = [];

    starShipsId.forEach((element) {
      transports.add({'character_id': id, 'transport_id': element});
    });
    vehiclesId.forEach((element) {
      transports.add({'character_id': id, 'transport_id': element});
    });
    data['characterTransports'] = transports;

    return data;
  }

  @override
  List<Object?> get props => [
        name,
        eyesColor,
        hairColor,
        height,
        skinColor,
        gender,
        fromPlanetId,
        vehiclesId,
        starShipsId
      ];
}
