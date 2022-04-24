import 'package:equatable/equatable.dart';

class GetConsolidatedCharacters extends Equatable {
  final List<CharacterDBResponse> characters;
  const GetConsolidatedCharacters({required this.characters});

  factory GetConsolidatedCharacters.fromJson(Map<String, dynamic> data) {
    final chrResp = <CharacterDBResponse>[];
    for (var chr in data['characters']) {
      chrResp.add(CharacterDBResponse(
          id: chr['character_id'],
          name: chr['name'],
          eyesColor: chr['eyes_color'],
          hairColor: chr['hair_color'],
          height: chr['height'],
          skinColor: chr['skin_color'],
          gender: chr['gender'],
          fromPlanet: chr['planet_name'],
          bornYear: chr['age'],
          transports: TransportsDBResponse.fromJson(
              {'transports': chr['transports']})));
    }
    return GetConsolidatedCharacters(characters: chrResp);
  }

  @override
  List<Object?> get props => [characters];
}

class CharacterDBResponse extends Equatable {
  final String id;
  final String name;
  final String eyesColor;
  final String hairColor;
  final String height;
  final String skinColor;
  final String gender;
  final String fromPlanet;
  final TransportsDBResponse transports;
  final String bornYear;

  const CharacterDBResponse({
    required this.id,
    required this.name,
    required this.eyesColor,
    required this.hairColor,
    required this.height,
    required this.skinColor,
    required this.gender,
    required this.fromPlanet,
    required this.bornYear,
    required this.transports,
  });

  @override
  List<Object?> get props => [
        name,
        eyesColor,
        hairColor,
        height,
        skinColor,
        gender,
        fromPlanet,
        transports
      ];
}

class TransportsDBResponse extends Equatable {
  final List<TransportDBResponse> transport;

  const TransportsDBResponse({required this.transport});

  factory TransportsDBResponse.fromJson(Map<String, dynamic> data) {
    final trnsp = <TransportDBResponse>[];
    for (var trn in data['transports']) {
      trnsp.add(TransportDBResponse(name: trn['name'], type: trn['type']));
    }
    return TransportsDBResponse(transport: trnsp);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['transport'] = transport.map((e) => e.toJson()).toList();

    return data;
  }

  @override
  List<Object?> get props => [transport];
}

class TransportDBResponse extends Equatable {
  final String name;
  final String type;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['name'] = name;
    data['type'] = type;
    return data;
  }

  TransportDBResponse({required this.name, required this.type});

  @override
  List<Object?> get props => [name, type];
}
