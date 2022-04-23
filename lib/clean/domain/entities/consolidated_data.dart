import 'package:equatable/equatable.dart';
import 'package:urbe_solution/clean/domain/entities/character.dart';
import 'package:urbe_solution/clean/domain/entities/planet.dart';
import 'package:urbe_solution/clean/domain/entities/transport.dart';

class ConsolidatedData extends Equatable {
  final List<Character> characters;
  final List<Planet> planets;
  final List<Transport> transports;

  ConsolidatedData(
      {required this.characters,
      required this.planets,
      required this.transports});

  @override
  List<Object?> get props => [characters, planets, transports];
}
