import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:urbe_solution/clean/domain/entities/invader.dart';
import 'package:urbe_solution/clean/domain/entities/invaders_list.dart';

import '../../../domain/invaders_domain/use_cases/invaders_use_cases.dart';
import '../../../domain/user_domain/use_cases/user_use_cases.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetInvadersDataUseCase getData;
  final SyncDataUseCase syncData;
  final ChangeModeUseCase changeMode;
  final GetModeUseCase getMode;
  HomeBloc({
    required this.getData,
    required this.syncData,
    required this.changeMode,
    required this.getMode,
  }) : super(HomeInitial(
          data: InvadersList(
              characters: [], planets: [], transports: [], isOnline: false),
          showDrawer: false,
          isOnline: false,
        )) {
    on<LoadDataEvent>((event, emit) async {
      emit(LoadingState(
        data: state.data,
        showDrawer: state.showDrawer,
        isOnline: state.isOnline,
      ));

      final result = await getData.call();
      final isOnline = await getMode.call();
      if (isValidData.call(result)) {
        emit(DataState(
          data: result,
          showDrawer: state.showDrawer,
          isOnline: isOnline,
        ));
      } else {
        emit(ErrorState(
          data: state.data,
          showDrawer: state.showDrawer,
          isOnline: isOnline,
        ));
      }
    });

    on<ShowDrawerEvent>((event, emit) {
      emit(ShowDrawerState(
        data: state.data,
        showDrawer: true,
        isOnline: state.isOnline,
      ));
    });

    on<SyncDataEvent>((event, emit) async {
      emit(LoadingState(
        data: state.data,
        showDrawer: state.showDrawer,
        isOnline: state.isOnline,
      ));
      final result = await syncData.call();
      if (isValidData.call(result)) {
        emit(DataState(
          data: result,
          showDrawer: state.showDrawer,
          isOnline: state.isOnline,
        ));
      } else {
        if (result.characters.isEmpty && state.data.characters.isNotEmpty) {
          emit(DataState(
            data: state.data,
            showDrawer: state.showDrawer,
            isOnline: state.isOnline,
          ));
          emit(SyncErrorState(
            data: state.data,
            showDrawer: state.showDrawer,
            isOnline: state.isOnline,
          ));
        } else {
          emit(ErrorState(
            data: state.data,
            showDrawer: state.showDrawer,
            isOnline: state.isOnline,
          ));
        }
      }
    });
    on<ChangeModeEvent>((event, emit) async {
      final newValue = await changeMode.call(event.newValue);

      emit(ChangeModeDisplayState(
        data: state.data,
        showDrawer: state.showDrawer,
        isOnline: newValue,
      ));
    });

    on<FilterSelectedEvent>((event, emit) {
      final filterMatch = <Character>[];
      for (var char in state.data.characters) {
        if (char.gender == event.gender) {
          filterMatch.add(char);
        }
      }

      emit(FilterSelectedState(
          data: state.data,
          showDrawer: state.showDrawer,
          isOnline: state.isOnline,
          filterSelected: event.gender,
          filteredChars: filterMatch));
    });
    on<FilterDeselectedEvent>((event, emit) {
      emit(FilterDeselectedState(
        data: state.data,
        showDrawer: state.showDrawer,
        isOnline: state.isOnline,
      ));
    });
  }
}