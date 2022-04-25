import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kiwi/kiwi.dart';
import 'package:urbe_solution/clean/domain/use_cases/get_mode_use_case.dart';

part 'lateral_drawer_event.dart';
part 'lateral_drawer_state.dart';

class LateralDrawerBloc extends Bloc<LateralDrawerEvent, LateralDrawerState> {
  final getMode = KiwiContainer().resolve<GetModeUseCase>();
  LateralDrawerBloc()
      : super(const LateralDrawerInitial(syncEnabled: false, isOnline: false)) {
    on<InitializeDrawerEvent>((event, emit) async {
      final isOnline = await getMode.call();
      emit(IdleState(isOnline: isOnline, syncEnabled: isOnline));
    });
    on<DrawerSyncDataEvent>((event, emit) {
      emit(NotifyState(
          isOnline: state.isOnline,
          syncEnabled: state.syncEnabled,
          syncPressed: true));
      emit(IdleState(isOnline: state.isOnline, syncEnabled: state.syncEnabled));
    });
    on<DrawerChangeModeEvent>((event, emit) {
      emit(NotifyState(
          isOnline: !state.isOnline,
          syncEnabled: !state.syncEnabled,
          syncPressed: false,
          modeChanged: true));
      emit(IdleState(isOnline: state.isOnline, syncEnabled: state.syncEnabled));
    });
  }
}
