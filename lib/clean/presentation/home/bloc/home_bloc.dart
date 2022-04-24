import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kiwi/kiwi.dart';
import 'package:urbe_solution/clean/domain/entities/consolidated_data.dart';
import 'package:urbe_solution/clean/domain/use_cases/get_data_use_case.dart';
import 'package:urbe_solution/clean/domain/use_cases/is_valid_data.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final getData = KiwiContainer().resolve<GetDataUseCase>();
  final isValidData = KiwiContainer().resolve<IsValidData>();
  HomeBloc()
      : super(HomeInitial(
            data: ConsolidatedData(
                characters: [], planets: [], transports: [], isOnline: false),
            showDrawer: false)) {
    on<LoadDataEvent>((event, emit) async {
      emit(LoadingState(data: state.data, showDrawer: state.showDrawer));
      final result = await getData.call();
      if (isValidData.call(result)) {
        emit(DataState(data: result, showDrawer: state.showDrawer));
      } else {
        emit(ErrorState(data: state.data, showDrawer: state.showDrawer));
      }
    });

    on<ShowDrawerEvent>((event, emit) {
      emit(ShowDrawerState(data: state.data, showDrawer: true));
    });
  }
}
