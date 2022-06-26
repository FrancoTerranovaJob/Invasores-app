import 'package:equatable/equatable.dart';
import 'package:urbe_solution/clean/data/invaders_data/api/response/invader_response.dart';
import 'package:urbe_solution/clean/domain/entities/planet.dart';
import 'package:urbe_solution/clean/domain/entities/transport.dart';

class Invader extends Equatable {
  final String id;
  final String name;
  final String lastName;
  final String bornOn;
  final String eyesColor;
  final String hairColor;
  final String height;
  final Planet bornPlanet;
  final String skinColor;
  final GenderType gender;
  final List<Transport> transports;

  const Invader(
      {required this.id,
      required this.name,
      required this.lastName,
      required this.bornOn,
      required this.eyesColor,
      required this.hairColor,
      required this.height,
      required this.bornPlanet,
      required this.skinColor,
      required this.gender,
      required this.transports});

  factory Invader.fromInvaderResponse(
      {required InvaderResponse invaderResponse}) {
    final List<Transport> transports = [];

    transports.addAll(invaderResponse.vehicles
        .map((vehicle) => Transport.vehicleFromId(id: vehicle))
        .toList());

    transports.addAll(invaderResponse.ships
        .map((starship) => Transport.starshipFromId(id: starship))
        .toList());

    return Invader(
        id: invaderResponse.id,
        name: invaderResponse.name,
        lastName: '',
        bornOn: invaderResponse.bornYear,
        eyesColor: invaderResponse.eyesColor,
        hairColor: invaderResponse.hairColor,
        height: invaderResponse.height,
        bornPlanet: Planet.fromString(id: invaderResponse.fromPlanet),
        skinColor: invaderResponse.skinColor,
        gender: GenderType.string(invaderResponse.gender),
        transports: transports);
  }

  factory Invader.fromDataBase(Map<dynamic, dynamic> json) {
    final transportsList = List<Map<dynamic, dynamic>>.from(json['transports']);
    return Invader(
        id: json['id'],
        name: json['name'],
        lastName: '',
        bornOn: json['bornOn'],
        eyesColor: json['eyesColor'],
        hairColor: json['hairColor'],
        height: json['height'],
        bornPlanet: Planet.fromDataBase(json['bornPlanet']),
        skinColor: json['skinColor'],
        gender: GenderType.string(json['gender']),
        transports: transportsList
            .map((transport) => Transport.fromDataBase(transport))
            .toList());
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'lastName': lastName,
      'bornOn': bornOn,
      'eyesColor': eyesColor,
      'hairColor': hairColor,
      'height': height,
      'bornPlanet': bornPlanet.toJson(),
      'skinColor': skinColor,
      'gender': gender.toString(),
      'transports': transports.map((transport) => transport.toJson()).toList()
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        lastName,
        bornOn,
        eyesColor,
        hairColor,
        height,
        bornPlanet,
        skinColor,
        gender,
        transports
      ];
}

enum GenderType {
  male('male'),
  female('female'),
  na('n/a'),
  unknown('unknown');

  const GenderType(String gender);
  factory GenderType.string(String gender) {
    switch (gender) {
      case 'male':
        return GenderType.male;
      case 'female':
        return GenderType.female;
      case 'n/a':
        return GenderType.na;
      case 'unknown':
        return GenderType.unknown;
      default:
        return GenderType.unknown;
    }
  }

  @override
  String toString() => name;
}