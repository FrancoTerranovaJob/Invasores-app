import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kiwi/kiwi.dart';
import 'package:urbe_solution/clean/domain/entities/character.dart';
import 'package:urbe_solution/clean/domain/entities/planet.dart';
import 'package:urbe_solution/clean/domain/entities/transport.dart';

import '../../../domain/use_cases/get_mode_use_case.dart';

part 'show_people_event.dart';
part 'show_people_state.dart';

class ShowPeopleBloc extends Bloc<ShowPeopleEvent, ShowPeopleState> {
  final getMode = KiwiContainer().resolve<GetModeUseCase>();
  ShowPeopleBloc()
      : super(ShowPeopleInitial(
            characterSelected: Character(
                id: '',
                name: '',
                lastName: '',
                bornOn: '',
                eyesColor: '',
                hairColor: '',
                height: '',
                bornPlanet: Planet(name: '', id: ''),
                skinColor: '',
                gender: GenderType.na,
                transports: []),
            transports: [],
            planets: [])) {
    on<ShowProfileEvent>((event, emit) async {
      final isOnline = await getMode.call();
      if (isOnline) {
        var characterPlanet;
        final characterTransports = <Transport>[];

        for (var trans in event.transports) {
          if (trans.pilotsId.contains(event.character.id)) {
            characterTransports.add(trans);
          }
        }
        for (var plnt in event.planets) {
          if (plnt.id == event.character.bornPlanet.id) {
            characterPlanet = plnt;
          }
        }
        emit(CharacterProfileState(
            characterSelected: Character(
                id: event.character.id,
                name: event.character.name,
                lastName: event.character.lastName,
                bornOn: event.character.bornOn,
                eyesColor: event.character.eyesColor,
                hairColor: event.character.hairColor,
                height: event.character.height,
                bornPlanet: characterPlanet,
                skinColor: event.character.skinColor,
                gender: event.character.gender,
                transports: characterTransports),
            transports: state.transports,
            planets: state.planets));
      } else {
        emit(CharacterProfileState(
            characterSelected: Character(
                id: event.character.id,
                name: event.character.name,
                lastName: event.character.lastName,
                bornOn: event.character.bornOn,
                eyesColor: event.character.eyesColor,
                hairColor: event.character.hairColor,
                height: event.character.height,
                bornPlanet: event.character.bornPlanet,
                skinColor: event.character.skinColor,
                gender: event.character.gender,
                transports: event.character.transports),
            transports: state.transports,
            planets: state.planets));
      }
    });
  }
}
