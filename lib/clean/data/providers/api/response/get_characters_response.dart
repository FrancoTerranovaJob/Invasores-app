import 'package:equatable/equatable.dart';

class GetCharactersResponse extends Equatable {
  final List<CharacterResponse> characters;
  final String? nextPageUrl;
  const GetCharactersResponse(
      {required this.characters, required this.nextPageUrl});

  factory GetCharactersResponse.fromJson(Map<String, dynamic> data) {
    final chrResp = <CharacterResponse>[];
    for (var chr in data['results']) {
      chrResp.add(CharacterResponse(
          id: chr['url'],
          name: chr['name'],
          eyesColor: chr['eye_color'],
          hairColor: chr['hair_color'],
          height: chr['height'],
          skinColor: chr['skin_color'],
          gender: chr['gender'],
          fromPlanet: chr['homeworld'],
          bornYear: chr['birth_year'],
          ships: List<String>.from(chr['starships'] as List),
          vehicles: List<String>.from(chr['vehicles'] as List)));
    }

    return GetCharactersResponse(
        characters: chrResp, nextPageUrl: data['next']);
  }
  @override
  List<Object?> get props => [characters];
}

class CharacterResponse extends Equatable {
  final String id;
  final String name;
  final String eyesColor;
  final String hairColor;
  final String height;
  final String skinColor;
  final String gender;
  final String fromPlanet;
  final List<String> ships;
  final List<String> vehicles;
  final String bornYear;

  const CharacterResponse(
      {required this.id,
      required this.name,
      required this.eyesColor,
      required this.hairColor,
      required this.height,
      required this.skinColor,
      required this.gender,
      required this.fromPlanet,
      required this.bornYear,
      required this.ships,
      required this.vehicles});

  @override
  List<Object?> get props => [
        name,
        eyesColor,
        hairColor,
        height,
        skinColor,
        gender,
        fromPlanet,
        ships,
        vehicles
      ];
}
