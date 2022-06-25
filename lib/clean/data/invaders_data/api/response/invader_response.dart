import 'package:equatable/equatable.dart';

class InvaderResponse extends Equatable {
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

  const InvaderResponse(
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

  factory InvaderResponse.fromJson(Map<String, dynamic> json) {
    return InvaderResponse(
        id: json['url'],
        name: json['name'],
        eyesColor: json['eye_color'],
        hairColor: json['hair_color'],
        height: json['height'],
        skinColor: json['skin_color'],
        gender: json['gender'],
        fromPlanet: json['homeworld'],
        bornYear: json['birth_year'],
        ships: List<String>.from(json['starships']),
        vehicles: List<String>.from(json['vehicles']));
  }
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