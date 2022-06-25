import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kiwi/kiwi.dart';
import 'package:urbe_solution/clean/domain/entities/invader.dart';
import 'package:urbe_solution/clean/domain/entities/planet.dart';
import 'package:urbe_solution/clean/domain/entities/transport.dart';
import 'package:urbe_solution/clean/domain/use_cases/report_use_case.dart';

import '../../../domain/use_cases/get_mode_use_case.dart';

part 'show_people_event.dart';
part 'show_people_state.dart';

class ShowPeopleBloc extends Bloc<ShowPeopleEvent, ShowPeopleState> {
  final getMode = KiwiContainer().resolve<GetModeUseCase>();
  final reportPerson = KiwiContainer().resolve<ReportUseCase>();
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
            planets: [],
            offLineData: false,
            page: 0,
            enableReportButton: false)) {
    on<ShowProfileEvent>((event, emit) async {
      emit(LoadingProfileState(
          characterSelected: state.characterSelected,
          planets: state.planets,
          transports: state.transports,
          offLineData: state.offLineData,
          page: state.page,
          enableReportButton: state.enableReportButton));
      final isOnline = await getMode.call();
      if (event.offLineData) {
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
            planets: state.planets,
            offLineData: event.offLineData,
            page: state.page,
            enableReportButton: isOnline));
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
            planets: state.planets,
            offLineData: event.offLineData,
            page: state.page,
            enableReportButton: isOnline));
      }
      add(StartAnimationPageEvent());
    });
    on<PageChangedEvent>((event, emit) {
      emit(PageChangedState(
          characterSelected: state.characterSelected,
          planets: state.planets,
          transports: state.transports,
          offLineData: state.offLineData,
          page: event.page,
          enableReportButton: state.enableReportButton));
    });

    on<StartAnimationPageEvent>((event, emit) async {
      await Future.delayed(Duration(seconds: 10), () async {
        if (state is! StopAnimationState) {
          emit(AnimatePageViewState(
              characterSelected: state.characterSelected,
              planets: state.planets,
              transports: state.transports,
              offLineData: state.offLineData,
              page: state.page,
              enableReportButton: state.enableReportButton));
        } else {
          await Future.delayed(Duration(minutes: 5));
          emit(AnimatePageViewState(
              characterSelected: state.characterSelected,
              planets: state.planets,
              transports: state.transports,
              offLineData: state.offLineData,
              page: state.page,
              enableReportButton: state.enableReportButton));
        }
      });
    });
    on<StopAnimationEvent>((event, emit) async {
      if (state is! AnimatePageViewState) {
        emit(StopAnimationState(
            characterSelected: state.characterSelected,
            planets: state.planets,
            transports: state.transports,
            offLineData: state.offLineData,
            page: state.page,
            enableReportButton: state.enableReportButton));
      }
    });

    on<ReportCharacterEvent>((event, emit) async {
      emit(SendingReportState(
          characterSelected: state.characterSelected,
          planets: state.planets,
          transports: state.transports,
          offLineData: state.offLineData,
          page: state.page,
          enableReportButton: state.enableReportButton));
      final result = await reportPerson.call(state.characterSelected);
      if (result) {
        emit(ReportSendState(
            characterSelected: state.characterSelected,
            planets: state.planets,
            transports: state.transports,
            offLineData: state.offLineData,
            page: state.page,
            enableReportButton: state.enableReportButton));
      } else {
        emit(ReportSendErrorState(
            characterSelected: state.characterSelected,
            planets: state.planets,
            transports: state.transports,
            offLineData: state.offLineData,
            page: state.page,
            enableReportButton: state.enableReportButton));
      }
    });
  }
}