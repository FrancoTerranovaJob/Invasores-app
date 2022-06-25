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

  Invader(
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
    final String gender = invaderResponse.gender;
    final List<Transport> transports = [];

    transports.addAll(invaderResponse.vehicles
        .map((vehicle) => Transport.fromString(
            transportType: TransportType.vehicle, id: vehicle))
        .toList());

    transports.addAll(invaderResponse.ships
        .map((starship) => Transport.fromString(
            transportType: TransportType.starship, id: starship))
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
        gender: gender == 'male'
            ? GenderType.male
            : gender == 'female'
                ? GenderType.female
                : gender == 'n/a'
                    ? GenderType.na
                    : GenderType.unknown,
        transports: transports);
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
      'gender': gender == GenderType.male
          ? 'male'
          : gender == GenderType.female
              ? 'female'
              : gender == GenderType.na
                  ? 'n/a'
                  : 'unknown',
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

enum GenderType { male, female, na, unknown }