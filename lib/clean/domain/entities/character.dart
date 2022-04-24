import 'package:equatable/equatable.dart';
import 'package:urbe_solution/clean/domain/entities/planet.dart';
import 'package:urbe_solution/clean/domain/entities/transport.dart';

class Character extends Equatable {
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

  Character(
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
