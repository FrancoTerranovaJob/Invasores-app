import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kiwi/kiwi.dart';
import 'package:urbe_solution/clean/domain/entities/consolidated_data.dart';
import 'package:urbe_solution/clean/domain/use_cases/change_mode_use_case.dart';
import 'package:urbe_solution/clean/domain/use_cases/get_data_use_case.dart';
import 'package:urbe_solution/clean/domain/use_cases/get_mode_use_case.dart';
import 'package:urbe_solution/clean/domain/use_cases/is_valid_data.dart';

import '../../../domain/use_cases/sync_data_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final getData = KiwiContainer().resolve<GetDataUseCase>();
  final isValidData = KiwiContainer().resolve<IsValidData>();
  final syncData = KiwiContainer().resolve<SyncDataUseCase>();
  final changeMode = KiwiContainer().resolve<ChangeModeUseCase>();
  final getMode = KiwiContainer().resolve<GetModeUseCase>();
  HomeBloc()
      : super(HomeInitial(
            data: ConsolidatedData(
                characters: [], planets: [], transports: [], isOnline: false),
            showDrawer: false,
            isOnline: false)) {
    on<LoadDataEvent>((event, emit) async {
      emit(LoadingState(
          data: state.data,
          showDrawer: state.showDrawer,
          isOnline: state.isOnline));

      final result = await getData.call();
      final isOnline = await getMode.call();
      if (isValidData.call(result)) {
        emit(DataState(
            data: result, showDrawer: state.showDrawer, isOnline: isOnline));
      } else {
        emit(ErrorState(
            data: state.data,
            showDrawer: state.showDrawer,
            isOnline: isOnline));
      }
    });

    on<ShowDrawerEvent>((event, emit) {
      emit(ShowDrawerState(
          data: state.data, showDrawer: true, isOnline: state.isOnline));
    });

    on<SyncDataEvent>((event, emit) async {
      emit(LoadingState(
          data: state.data,
          showDrawer: state.showDrawer,
          isOnline: state.isOnline));
      final result = await syncData.call();
      if (isValidData.call(result)) {
        emit(DataState(
            data: result,
            showDrawer: state.showDrawer,
            isOnline: state.isOnline));
      } else {
        if (result.characters.isEmpty && state.data.characters.isNotEmpty) {
          emit(DataState(
              data: state.data,
              showDrawer: state.showDrawer,
              isOnline: state.isOnline));
          emit(SyncErrorState(
              data: state.data,
              showDrawer: state.showDrawer,
              isOnline: state.isOnline));
        } else {
          emit(ErrorState(
              data: state.data,
              showDrawer: state.showDrawer,
              isOnline: state.isOnline));
        }
      }
    });
    on<ChangeModeEvent>((event, emit) async {
      final newValue = await changeMode.call(event.newValue);
      if (state is! ErrorState) {
        emit(ChangeModeDisplayState(
            data: state.data,
            showDrawer: state.showDrawer,
            isOnline: newValue));
      }
    });
  }
}
